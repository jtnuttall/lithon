/*
 * Known-answer vector generator for the rapidhash Haskell binding.
 *
 * Compiled against the vendored upstream header (cbits/rapidhash.h) and the
 * local shim (cbits/rapidhash_ext.h), it prints reference digests to stdout.
 * The committed golden file (test/pin/rapidhash-v3-pin.txt) is this program's
 * output; the Haskell test suite recomputes every line through the binding's
 * ByteString entrypoint (and the sliced Vector path for the offset shim).
 *
 *   verify:     scripts/rapidhash-pin.sh          (in the project repository,
 *   regenerate: scripts/rapidhash-pin.sh --regen   not in the sdist)
 */
#include <inttypes.h>
#include <stdio.h>
#include <stdlib.h>

#include "rapidhash_ext.h"

/* Deterministic, non-degenerate filler; mirrored in test/RapidHashTest.hs. */
static uint8_t byte_at(size_t i) { return (uint8_t)(i * 167u + 13u); }

/* Lengths bracketing rapidhash v3's internal branch boundaries. */
static const size_t lengths[] = {
    0,   1,   2,   3,   4,   5,   6,    7,    8,    9,     10,    11,
    12,  13,  14,  15,  16,  17,  31,   32,   33,   47,    48,    49,
    63,  64,  65,  79,  80,  81,  111,  112,  113,  127,   128,   129,
    191, 192, 193, 223, 224, 225, 255,  256,  257,  447,   448,   449,
    511, 512, 1023, 1024, 4096, 65535, 65536, 300007};

static const uint64_t seeds[] = {0ULL, 1ULL, 0xDEADBEEFULL,
                                 0x123456789ABCDEF0ULL, 0xFFFFFFFFFFFFFFFFULL};

static const size_t offsets[] = {1, 3, 8, 17};
static const size_t offset_lengths[] = {0, 7, 16, 63, 64, 257};
static const uint64_t offset_seeds[] = {0ULL, 0xDEADBEEFULL};

#define COUNT(xs) (sizeof(xs) / sizeof((xs)[0]))

int main(void) {
  size_t max_len = 0;
  for (size_t i = 0; i < COUNT(lengths); i++)
    if (lengths[i] > max_len) max_len = lengths[i];

  uint8_t *buf = malloc(max_len);
  if (!buf) return 1;
  for (size_t i = 0; i < max_len; i++) buf[i] = byte_at(i);

  for (size_t li = 0; li < COUNT(lengths); li++)
    printf("default %zu %016" PRIx64 "\n", lengths[li],
           rapidhash(buf, lengths[li]));

  for (size_t li = 0; li < COUNT(lengths); li++)
    for (size_t si = 0; si < COUNT(seeds); si++)
      printf("withSeed %zu %016" PRIx64 " %016" PRIx64 "\n", lengths[li],
             seeds[si], rapidhash_withSeed(buf, lengths[li], seeds[si]));

  for (size_t oi = 0; oi < COUNT(offsets); oi++)
    for (size_t li = 0; li < COUNT(offset_lengths); li++)
      for (size_t si = 0; si < COUNT(offset_seeds); si++)
        printf("offset %zu %zu %016" PRIx64 " %016" PRIx64 "\n", offsets[oi],
               offset_lengths[li], offset_seeds[si],
               rapidhash_offset_withSeed(buf, offsets[oi], offset_lengths[li],
                                         offset_seeds[si]));

  free(buf);
  return 0;
}
