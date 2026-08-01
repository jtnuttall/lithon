# rapidhash

Haskell bindings to [rapidhash](https://github.com/Nicoshev/rapidhash) v3 –
a very fast, high-quality, platform-independent hash.

Like `xxhash-ffi` and `murmur-hash`, this package provides a stable hash
that can be safely persisted for types with a stable byte representation
(e.g., `ByteString`, `Text`); see [supported input types](#supported-input-types).

This library appears to outperform `xxhash-ffi`, `murmur-hash`, and `hashable` by
a reasonable margin in [microbenchmarks](#benchmarks).

Upstream claims wins over every major noncryptographic hashing algorithm on
performance; on quality, it [passes both SMHasher and SMHasher3](https://github.com/Nicoshev/rapidhash/tree/master#collision-based-hash-quality-study).
Your mileage may vary.

**This is not a cryptographically secure hash. Use something else if
you need cryptographic security.**

## Example

```haskell
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TypeApplications #-}

import Data.Text (Text)
import Data.Hash.RapidHash (RapidHash, rapidhash)

digest :: RapidHash
digest = rapidhash @Text "hello, world"

main :: IO ()
main = print digest
```

`rapidhashWithSeed` takes an explicit `RapidSeed` if you need one. To use
rapidhash as your `Hashable` implementation, derive through
`HashViaRapidHash`:

```haskell
newtype ContentKey = ContentKey ByteString
  deriving newtype (Eq, RapidHashable)
  deriving (Hashable) via HashViaRapidHash ContentKey
```

## Status

Package is still fresh, but I consider the API stable. Used for change detection
in [lithon](https://github.com/jtnuttall/lithon).

This project follows the PVP. For stability, pin to the major (e.g., `^>= 0.1`).

### Streaming

Right now, this library supports only a strict block hash: the whole input
must be in memory. (`rapidhashFile` handles the common file case — a
strict read, then one hash.)

rapidhash v3 was rewritten to be streamable: its block functions can be
driven incrementally as long as the caller threads the hash state itself
(the Rust port does exactly this). This binding does not yet expose that
stateful API; I'll add it when the need arises. If you need streaming
before then, feel free to open an issue or PR against the project repository.

## Serialization and deserialization

`RapidHash` serializes and deserializes as a self-describing tagged hex
string — for example, `rhv3:0123456789abcdef`. This reduces the likelihood
that stored digests get confused with the output of other hash algorithms,
or of future rapidhash versions.

The convention applies to every mechanism that produces string output:
`Show`/`Read`, the `Text`/`ByteString` renderers and parsers, and the
`text-builder-linear` builder. (`Binary` instead uses a compact tagged
9-byte encoding.)

The `RapidHash` constructor is exported wholesale; if the tagging doesn't
fit your needs, rewrap the underlying `Word64` however you like.

### Aeson

Efficient `Aeson.ToJSON`/`FromJSON` and `Aeson.ToJSONKey`/`FromJSONKey`
instances are provided behind flag `aeson`; map keys use the same tagged
hex form as values. To use these, add:

cabal.project:

```cabal
package rapidhash
  flags: +aeson
```

stack.yaml:

```yaml
flags:
  rapidhash:
    aeson: true
```

## Supported input types

This library only supports strict types that can be passed to C with zero
allocations. Right now, that is:

- `Data.Text.Text`
- `Data.ByteString.ByteString`
- `Data.ByteString.Short.ShortByteString`
- `Data.Array.Byte.ByteArray`
- `Data.Primitive.PrimArray`
- `Data.Vector.Storable.Vector`
- `Data.Vector.Primitive.Vector`

The byte-oriented instances (`Text`, `ByteString`, `ShortByteString`,
`ByteArray`) produce the same digest on every platform. The element-typed
instances (`PrimArray` and both `Vector`s) hash the underlying memory raw,
so their digests depend on word width and endianness — do not persist
those across platforms. Each instance's haddock says which kind it is, and
the `Storable` vector instance carries an additional warning about padding.

A lazy/streaming API is not provided; see [streaming](#streaming).

## Benchmarks

Measured with `tasty-bench` on a 13th-gen Intel i7-1370P (GHC 9.12.4, NCG,
default flags for every package, meaning what `cabal build` gives you;
your numbers will vary).

Inputs are built once and forced before timing, so payload allocation is not
measured. Reproduce with:

```sh
cabal bench rapidhash-bench --benchmark-options='--csv bench.csv --stdev 2'
```

### Results

> [!NOTE]
>
> 1. The same inputs are fed to every hasher.
> 2. Strict `Text` is only benchmarked for libraries with native `Text` support.
> 3. Lower is better; fastest library is **bold** on each row.

#### Strict `ByteString`

| Input  |  rapidhash | xxh3 (`xxhash-ffi`) | `hashable` | murmur2 (`murmur-hash`) |
| ------ | ---------: | ------------------: | ---------: | ----------------------: |
| 8 B    |     4.8 ns |              6.8 ns | **4.1 ns** |                  8.1 ns |
| 64 B   | **6.0 ns** |              8.3 ns |     9.9 ns |                  107 ns |
| 1 KiB  |  **25 ns** |               60 ns |      55 ns |                  2.0 μs |
| 64 KiB | **1.3 μs** |              3.1 μs |     3.0 μs |                  129 μs |
| 1 MiB  |  **21 μs** |               50 μs |      52 μs |                  2.2 ms |

#### Strict `Text`

| Input  |  rapidhash | xxh3 (`xxhash-ffi`) | `hashable` |
| ------ | ---------: | ------------------: | ---------: |
| 8 B    | **3.5 ns** |              9.4 ns |     4.8 ns |
| 64 B   | **4.5 ns** |             10.5 ns |      10 ns |
| 1 KiB  |  **24 ns** |               66 ns |      62 ns |
| 64 KiB | **1.4 μs** |              3.2 μs |     3.2 μs |
| 1 MiB  |  **23 μs** |               57 μs |      51 μs |

#### Notes

- `hashable` is the most straightforward baseline. Its `ByteString`/`Text`
  hashers are presently C calls, both to xxhash3[^1]. It is presented for
  speed comparison against a known-optimized hasher.
- rapidhash measures meaningfully faster than `hashable`, except at very
  small inputs, where it seems to pay more in constant factors.
- `murmur-hash` is pure Haskell (MurmurHash2).
- `xxhash-ffi` is measured through its `XXH3` newtype `Hashable` instance.
- [Upstream reports](https://github.com/Nicoshev/rapidhash/tree/master#outstanding-performance)
  \~47-71 GB/s for rapidhash across M1 Pro-M4/Ryzen 9700X. This library
  measures \~46-50 GB/s at the 64 KiB-1 MiB sizes on a laptop CPU, which
  seats it neatly within range.

## Compilation

This library is a thin FFI binding to the upstream single-header C
implementation, vendored and shipped in the sdist, which means this
library should compile anywhere there is a compliant C compiler.

Compilation issues are mine, not rapidhash's; please report any such
issues in [the repository for this Haskell package](https://github.com/jtnuttall/lithon/issues).

### Optimizations

Given that this library is small and rapidhash's performance is contingent
on compiler optimizations, the `optimize` flag defaults to on: `-O2` for
GHC, `-O3` for the C compiler. Disable it by passing `-f -optimize` to Cabal.

A second flag, `llvm-bench`, rebuilds the benchmarks with GHC's LLVM backend
so its effect can be measured; it needs an LLVM toolchain matching your GHC,
and GHC >= 9.10. At this time I do not believe the library's performance to be
substantially altered by LLVM compilation, and the implementation is plenty fast
enough on the NCG for my purposes.

## Technical notes

### Verification

- The library is parity-tested against 384 known-answer vectors, which are
  generated by a C program that uses the rapidhash header directly.
- Property tests check that every supported input representation hashes its
  underlying bytes identically.

### Performance and safety

- The hashing algorithm is pure and does not modify its input, so the FFI
  call is wrapped in `unsafeDupablePerformIO`, the cheapest option that
  is safe here.
- Zero-copy FFI is trivial for types that wrap a `ForeignPtr`.
- Types that wrap an unsliced `ByteArray` go directly through `UnliftedFFITypes`.
- Types that wrap a sliced `ByteArray` (offset + length) go through a small
  C shim in `cbits/rapidhash_ext.h`, again with `UnliftedFFITypes`.

[^1]: Implementations for [ByteString](https://hackage-content.haskell.org/package/hashable-1.5.1.0/docs/src/Data.Hashable.Class.html#line-578) and [Text](https://hackage-content.haskell.org/package/hashable-1.5.1.0/docs/src/Data.Hashable.Class.html#line-622) as of writing.
