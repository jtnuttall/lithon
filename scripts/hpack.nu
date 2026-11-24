#!/usr/bin/env nu

use std/log

let ok = $"[(ansi green)OK(ansi reset)]"
let err = $"[(ansi red)ERR(ansi reset)]"

def main [
  --check(-c) # Don't write any package.yaml files, just check for differences.
] {
  if $check {
    hpack-check
  } else {
    hpack
  }

  log info "success"
}

def hpack [] {
  log info "regenerating cabal files..."

  pkg-dirs | each {|dir|
    log debug $dir
    ^hpack $dir
    ()
  }
}

def hpack-check [] {
  log info "checking that cabal files are up to date..."

  let results: list<record> = pkg-dirs | each {|dir|
    let cabal_file: string = cabal_file $dir
    log debug $cabal_file

    mut result: record = do {
      cd $dir
      ^hpack - | ^diff -u $cabal_file - | complete
    }

    $result.cabal_file = $cabal_file | path relative-to (pwd)
    $result
  }

  mut failing = 0

  for result in $results {
    if $result.exit_code != 0 {
      $failing += 1

      print $"($err): ($result.cabal_file) differs \(exit code ($result.exit_code)\)"

      print $result.stderr

      print $result.stdout
    } else {
      print $"($ok): ($result.cabal_file)"
    }
  }

  if $failing > 1 {
    error make {
      msg: $"$(failing) out-of-date Cabal files"
      help: "run 'just hpack'"
    }
  }
}

def cabal_file [dir: string] {
  let cabal_files: list<string> = glob $"($dir)/*.cabal"

  match $cabal_files {
    [] => {
      error make {
        msg: "Missing cabal file"
        label: $"No cabal files found in ($dir)"
        help: "Did you run hpack?"
      }
    }
    [$file, ..$rest] => {
      if ($rest | is-not-empty) {
        error make {
          msg: "More than one cabal file"
          label: $"Only one cabal file is allowed, but I found $($cabal_files | length): ($cabal_files | to nuon)"
          help: "Delete the stray file, perhaps?"
        }
      }

      $file
    }
  }
}

def pkg-dirs [] {
  glob "*/package.yaml" | each {path dirname}
}
