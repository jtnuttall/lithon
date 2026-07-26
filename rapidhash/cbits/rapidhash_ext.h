// Small extensions to rapidhash so that, for example, zero-cost Text
// manipulation is possible.
#pragma once

#include "rapidhash.h"
#include <stddef.h>
#include <stdint.h>

/*
 *  rapidhash seeded hash function.
 *
 *  @param key     Buffer to be hashed.
 *  @param offset  Offset into the buffer, in bytes.
 *  @param len     @key length, in bytes.
 *  @param seed    64-bit seed used to alter the hash result predictably.
 *
 *  Calls rapidhash_internal using provided parameters and default secrets.
 *
 *  Returns a 64-bit hash.
 */
RAPIDHASH_INLINE uint64_t
rapidhash_offset_withSeed(const void *key, size_t offset, size_t len,
                          uint64_t seed) RAPIDHASH_NOEXCEPT {
  return rapidhash_internal((const uint8_t *)key + offset, len, seed,
                            rapid_secret);
}
