{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE NoFieldSelectors #-}
{-# OPTIONS_HADDOCK prune #-}

module SDL3.Sys.Bindgen.Stdinc.FunPtr (
  SDL3.Sys.Bindgen.Stdinc.FunPtr.sDL_malloc,
  SDL3.Sys.Bindgen.Stdinc.FunPtr.sDL_calloc,
  SDL3.Sys.Bindgen.Stdinc.FunPtr.sDL_realloc,
  SDL3.Sys.Bindgen.Stdinc.FunPtr.sDL_free,
  SDL3.Sys.Bindgen.Stdinc.FunPtr.sDL_GetOriginalMemoryFunctions,
  SDL3.Sys.Bindgen.Stdinc.FunPtr.sDL_GetMemoryFunctions,
  SDL3.Sys.Bindgen.Stdinc.FunPtr.sDL_SetMemoryFunctions,
  SDL3.Sys.Bindgen.Stdinc.FunPtr.sDL_aligned_alloc,
  SDL3.Sys.Bindgen.Stdinc.FunPtr.sDL_aligned_free,
  SDL3.Sys.Bindgen.Stdinc.FunPtr.sDL_GetNumAllocations,
  SDL3.Sys.Bindgen.Stdinc.FunPtr.sDL_GetEnvironment,
  SDL3.Sys.Bindgen.Stdinc.FunPtr.sDL_CreateEnvironment,
  SDL3.Sys.Bindgen.Stdinc.FunPtr.sDL_GetEnvironmentVariable,
  SDL3.Sys.Bindgen.Stdinc.FunPtr.sDL_GetEnvironmentVariables,
  SDL3.Sys.Bindgen.Stdinc.FunPtr.sDL_SetEnvironmentVariable,
  SDL3.Sys.Bindgen.Stdinc.FunPtr.sDL_UnsetEnvironmentVariable,
  SDL3.Sys.Bindgen.Stdinc.FunPtr.sDL_DestroyEnvironment,
  SDL3.Sys.Bindgen.Stdinc.FunPtr.sDL_getenv,
  SDL3.Sys.Bindgen.Stdinc.FunPtr.sDL_getenv_unsafe,
  SDL3.Sys.Bindgen.Stdinc.FunPtr.sDL_setenv_unsafe,
  SDL3.Sys.Bindgen.Stdinc.FunPtr.sDL_unsetenv_unsafe,
  SDL3.Sys.Bindgen.Stdinc.FunPtr.sDL_qsort,
  SDL3.Sys.Bindgen.Stdinc.FunPtr.sDL_bsearch,
  SDL3.Sys.Bindgen.Stdinc.FunPtr.sDL_qsort_r,
  SDL3.Sys.Bindgen.Stdinc.FunPtr.sDL_bsearch_r,
  SDL3.Sys.Bindgen.Stdinc.FunPtr.sDL_abs,
  SDL3.Sys.Bindgen.Stdinc.FunPtr.sDL_isalpha,
  SDL3.Sys.Bindgen.Stdinc.FunPtr.sDL_isalnum,
  SDL3.Sys.Bindgen.Stdinc.FunPtr.sDL_isblank,
  SDL3.Sys.Bindgen.Stdinc.FunPtr.sDL_iscntrl,
  SDL3.Sys.Bindgen.Stdinc.FunPtr.sDL_isdigit,
  SDL3.Sys.Bindgen.Stdinc.FunPtr.sDL_isxdigit,
  SDL3.Sys.Bindgen.Stdinc.FunPtr.sDL_ispunct,
  SDL3.Sys.Bindgen.Stdinc.FunPtr.sDL_isspace,
  SDL3.Sys.Bindgen.Stdinc.FunPtr.sDL_isupper,
  SDL3.Sys.Bindgen.Stdinc.FunPtr.sDL_islower,
  SDL3.Sys.Bindgen.Stdinc.FunPtr.sDL_isprint,
  SDL3.Sys.Bindgen.Stdinc.FunPtr.sDL_isgraph,
  SDL3.Sys.Bindgen.Stdinc.FunPtr.sDL_toupper,
  SDL3.Sys.Bindgen.Stdinc.FunPtr.sDL_tolower,
  SDL3.Sys.Bindgen.Stdinc.FunPtr.sDL_crc16,
  SDL3.Sys.Bindgen.Stdinc.FunPtr.sDL_crc32,
  SDL3.Sys.Bindgen.Stdinc.FunPtr.sDL_murmur3_32,
  SDL3.Sys.Bindgen.Stdinc.FunPtr.sDL_memset4,
  SDL3.Sys.Bindgen.Stdinc.FunPtr.sDL_memcmp,
  SDL3.Sys.Bindgen.Stdinc.FunPtr.sDL_wcslen,
  SDL3.Sys.Bindgen.Stdinc.FunPtr.sDL_wcsnlen,
  SDL3.Sys.Bindgen.Stdinc.FunPtr.sDL_wcslcpy,
  SDL3.Sys.Bindgen.Stdinc.FunPtr.sDL_wcslcat,
  SDL3.Sys.Bindgen.Stdinc.FunPtr.sDL_wcsdup,
  SDL3.Sys.Bindgen.Stdinc.FunPtr.sDL_wcsstr,
  SDL3.Sys.Bindgen.Stdinc.FunPtr.sDL_wcsnstr,
  SDL3.Sys.Bindgen.Stdinc.FunPtr.sDL_wcscmp,
  SDL3.Sys.Bindgen.Stdinc.FunPtr.sDL_wcsncmp,
  SDL3.Sys.Bindgen.Stdinc.FunPtr.sDL_wcscasecmp,
  SDL3.Sys.Bindgen.Stdinc.FunPtr.sDL_wcsncasecmp,
  SDL3.Sys.Bindgen.Stdinc.FunPtr.sDL_strlen,
  SDL3.Sys.Bindgen.Stdinc.FunPtr.sDL_strnlen,
  SDL3.Sys.Bindgen.Stdinc.FunPtr.sDL_strlcpy,
  SDL3.Sys.Bindgen.Stdinc.FunPtr.sDL_utf8strlcpy,
  SDL3.Sys.Bindgen.Stdinc.FunPtr.sDL_strlcat,
  SDL3.Sys.Bindgen.Stdinc.FunPtr.sDL_strdup,
  SDL3.Sys.Bindgen.Stdinc.FunPtr.sDL_strndup,
  SDL3.Sys.Bindgen.Stdinc.FunPtr.sDL_strrev,
  SDL3.Sys.Bindgen.Stdinc.FunPtr.sDL_strupr,
  SDL3.Sys.Bindgen.Stdinc.FunPtr.sDL_strlwr,
  SDL3.Sys.Bindgen.Stdinc.FunPtr.sDL_strchr,
  SDL3.Sys.Bindgen.Stdinc.FunPtr.sDL_strrchr,
  SDL3.Sys.Bindgen.Stdinc.FunPtr.sDL_strstr,
  SDL3.Sys.Bindgen.Stdinc.FunPtr.sDL_strnstr,
  SDL3.Sys.Bindgen.Stdinc.FunPtr.sDL_strcasestr,
  SDL3.Sys.Bindgen.Stdinc.FunPtr.sDL_strtok_r,
  SDL3.Sys.Bindgen.Stdinc.FunPtr.sDL_utf8strlen,
  SDL3.Sys.Bindgen.Stdinc.FunPtr.sDL_utf8strnlen,
  SDL3.Sys.Bindgen.Stdinc.FunPtr.sDL_itoa,
  SDL3.Sys.Bindgen.Stdinc.FunPtr.sDL_uitoa,
  SDL3.Sys.Bindgen.Stdinc.FunPtr.sDL_lltoa,
  SDL3.Sys.Bindgen.Stdinc.FunPtr.sDL_ulltoa,
  SDL3.Sys.Bindgen.Stdinc.FunPtr.sDL_atoi,
  SDL3.Sys.Bindgen.Stdinc.FunPtr.sDL_atof,
  SDL3.Sys.Bindgen.Stdinc.FunPtr.sDL_strtoll,
  SDL3.Sys.Bindgen.Stdinc.FunPtr.sDL_strtoull,
  SDL3.Sys.Bindgen.Stdinc.FunPtr.sDL_strtod,
  SDL3.Sys.Bindgen.Stdinc.FunPtr.sDL_strcmp,
  SDL3.Sys.Bindgen.Stdinc.FunPtr.sDL_strncmp,
  SDL3.Sys.Bindgen.Stdinc.FunPtr.sDL_strcasecmp,
  SDL3.Sys.Bindgen.Stdinc.FunPtr.sDL_strncasecmp,
  SDL3.Sys.Bindgen.Stdinc.FunPtr.sDL_strpbrk,
  SDL3.Sys.Bindgen.Stdinc.FunPtr.sDL_StepUTF8,
  SDL3.Sys.Bindgen.Stdinc.FunPtr.sDL_StepBackUTF8,
  SDL3.Sys.Bindgen.Stdinc.FunPtr.sDL_UCS4ToUTF8,
  SDL3.Sys.Bindgen.Stdinc.FunPtr.sDL_srand,
  SDL3.Sys.Bindgen.Stdinc.FunPtr.sDL_rand,
  SDL3.Sys.Bindgen.Stdinc.FunPtr.sDL_randf,
  SDL3.Sys.Bindgen.Stdinc.FunPtr.sDL_rand_bits,
  SDL3.Sys.Bindgen.Stdinc.FunPtr.sDL_rand_r,
  SDL3.Sys.Bindgen.Stdinc.FunPtr.sDL_randf_r,
  SDL3.Sys.Bindgen.Stdinc.FunPtr.sDL_rand_bits_r,
  SDL3.Sys.Bindgen.Stdinc.FunPtr.sDL_acos,
  SDL3.Sys.Bindgen.Stdinc.FunPtr.sDL_acosf,
  SDL3.Sys.Bindgen.Stdinc.FunPtr.sDL_asin,
  SDL3.Sys.Bindgen.Stdinc.FunPtr.sDL_asinf,
  SDL3.Sys.Bindgen.Stdinc.FunPtr.sDL_atan,
  SDL3.Sys.Bindgen.Stdinc.FunPtr.sDL_atanf,
  SDL3.Sys.Bindgen.Stdinc.FunPtr.sDL_atan2,
  SDL3.Sys.Bindgen.Stdinc.FunPtr.sDL_atan2f,
  SDL3.Sys.Bindgen.Stdinc.FunPtr.sDL_ceil,
  SDL3.Sys.Bindgen.Stdinc.FunPtr.sDL_ceilf,
  SDL3.Sys.Bindgen.Stdinc.FunPtr.sDL_copysign,
  SDL3.Sys.Bindgen.Stdinc.FunPtr.sDL_copysignf,
  SDL3.Sys.Bindgen.Stdinc.FunPtr.sDL_cos,
  SDL3.Sys.Bindgen.Stdinc.FunPtr.sDL_cosf,
  SDL3.Sys.Bindgen.Stdinc.FunPtr.sDL_exp,
  SDL3.Sys.Bindgen.Stdinc.FunPtr.sDL_expf,
  SDL3.Sys.Bindgen.Stdinc.FunPtr.sDL_fabs,
  SDL3.Sys.Bindgen.Stdinc.FunPtr.sDL_fabsf,
  SDL3.Sys.Bindgen.Stdinc.FunPtr.sDL_floor,
  SDL3.Sys.Bindgen.Stdinc.FunPtr.sDL_floorf,
  SDL3.Sys.Bindgen.Stdinc.FunPtr.sDL_trunc,
  SDL3.Sys.Bindgen.Stdinc.FunPtr.sDL_truncf,
  SDL3.Sys.Bindgen.Stdinc.FunPtr.sDL_fmod,
  SDL3.Sys.Bindgen.Stdinc.FunPtr.sDL_fmodf,
  SDL3.Sys.Bindgen.Stdinc.FunPtr.sDL_isinf,
  SDL3.Sys.Bindgen.Stdinc.FunPtr.sDL_isinff,
  SDL3.Sys.Bindgen.Stdinc.FunPtr.sDL_isnan,
  SDL3.Sys.Bindgen.Stdinc.FunPtr.sDL_isnanf,
  SDL3.Sys.Bindgen.Stdinc.FunPtr.sDL_log,
  SDL3.Sys.Bindgen.Stdinc.FunPtr.sDL_logf,
  SDL3.Sys.Bindgen.Stdinc.FunPtr.sDL_log10,
  SDL3.Sys.Bindgen.Stdinc.FunPtr.sDL_log10f,
  SDL3.Sys.Bindgen.Stdinc.FunPtr.sDL_modf,
  SDL3.Sys.Bindgen.Stdinc.FunPtr.sDL_modff,
  SDL3.Sys.Bindgen.Stdinc.FunPtr.sDL_pow,
  SDL3.Sys.Bindgen.Stdinc.FunPtr.sDL_powf,
  SDL3.Sys.Bindgen.Stdinc.FunPtr.sDL_round,
  SDL3.Sys.Bindgen.Stdinc.FunPtr.sDL_roundf,
  SDL3.Sys.Bindgen.Stdinc.FunPtr.sDL_scalbn,
  SDL3.Sys.Bindgen.Stdinc.FunPtr.sDL_scalbnf,
  SDL3.Sys.Bindgen.Stdinc.FunPtr.sDL_sin,
  SDL3.Sys.Bindgen.Stdinc.FunPtr.sDL_sinf,
  SDL3.Sys.Bindgen.Stdinc.FunPtr.sDL_sqrt,
  SDL3.Sys.Bindgen.Stdinc.FunPtr.sDL_sqrtf,
  SDL3.Sys.Bindgen.Stdinc.FunPtr.sDL_tan,
  SDL3.Sys.Bindgen.Stdinc.FunPtr.sDL_tanf,
  SDL3.Sys.Bindgen.Stdinc.FunPtr.sDL_iconv_open,
  SDL3.Sys.Bindgen.Stdinc.FunPtr.sDL_iconv_close,
  SDL3.Sys.Bindgen.Stdinc.FunPtr.sDL_iconv,
  SDL3.Sys.Bindgen.Stdinc.FunPtr.sDL_iconv_string,
  SDL3.Sys.Bindgen.Stdinc.FunPtr.sDL_size_mul_check_overflow_builtin,
  SDL3.Sys.Bindgen.Stdinc.FunPtr.sDL_size_add_check_overflow_builtin,
)
where

import HsBindgen.Runtime.LibC qualified
import HsBindgen.Runtime.PtrConst qualified as PtrConst
import HsBindgen.Runtime.Support qualified as BG
import HsBindgen.Runtime.Support.CAPI qualified
import SDL3.Sys.Bindgen.Stdinc

$( HsBindgen.Runtime.Support.CAPI.addCSource
     ( HsBindgen.Runtime.Support.CAPI.unlines
         [ "#include <SDL3/SDL_stdinc.h>"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_malloc */"
         , "__attribute__ ((const))"
         , "void *(*hs_bindgen_9722441ea82cf670 (void)) ("
         , "  size_t arg1"
         , ")"
         , "{"
         , "  return &SDL_malloc;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_calloc */"
         , "__attribute__ ((const))"
         , "void *(*hs_bindgen_2b076bb91cf947df (void)) ("
         , "  size_t arg1,"
         , "  size_t arg2"
         , ")"
         , "{"
         , "  return &SDL_calloc;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_realloc */"
         , "__attribute__ ((const))"
         , "void *(*hs_bindgen_bbae567861825a2b (void)) ("
         , "  void *arg1,"
         , "  size_t arg2"
         , ")"
         , "{"
         , "  return &SDL_realloc;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_free */"
         , "__attribute__ ((const))"
         , "void (*hs_bindgen_0f3dfcf2ab9d228a (void)) ("
         , "  void *arg1"
         , ")"
         , "{"
         , "  return &SDL_free;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_GetOriginalMemoryFunctions */"
         , "__attribute__ ((const))"
         , "void (*hs_bindgen_4ad4cf326cf2d8ee (void)) ("
         , "  SDL_malloc_func *arg1,"
         , "  SDL_calloc_func *arg2,"
         , "  SDL_realloc_func *arg3,"
         , "  SDL_free_func *arg4"
         , ")"
         , "{"
         , "  return &SDL_GetOriginalMemoryFunctions;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_GetMemoryFunctions */"
         , "__attribute__ ((const))"
         , "void (*hs_bindgen_d860ef935b823504 (void)) ("
         , "  SDL_malloc_func *arg1,"
         , "  SDL_calloc_func *arg2,"
         , "  SDL_realloc_func *arg3,"
         , "  SDL_free_func *arg4"
         , ")"
         , "{"
         , "  return &SDL_GetMemoryFunctions;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_SetMemoryFunctions */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_a474c8c00b052ea2 (void)) ("
         , "  SDL_malloc_func arg1,"
         , "  SDL_calloc_func arg2,"
         , "  SDL_realloc_func arg3,"
         , "  SDL_free_func arg4"
         , ")"
         , "{"
         , "  return &SDL_SetMemoryFunctions;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_aligned_alloc */"
         , "__attribute__ ((const))"
         , "void *(*hs_bindgen_de151c2774561d5d (void)) ("
         , "  size_t arg1,"
         , "  size_t arg2"
         , ")"
         , "{"
         , "  return &SDL_aligned_alloc;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_aligned_free */"
         , "__attribute__ ((const))"
         , "void (*hs_bindgen_dd6b53bc3c6f96ea (void)) ("
         , "  void *arg1"
         , ")"
         , "{"
         , "  return &SDL_aligned_free;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_GetNumAllocations */"
         , "__attribute__ ((const))"
         , "signed int (*hs_bindgen_fe81cad123788733 (void)) (void)"
         , "{"
         , "  return &SDL_GetNumAllocations;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_GetEnvironment */"
         , "__attribute__ ((const))"
         , "SDL_Environment *(*hs_bindgen_9a656c04aab82f9e (void)) (void)"
         , "{"
         , "  return &SDL_GetEnvironment;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_CreateEnvironment */"
         , "__attribute__ ((const))"
         , "SDL_Environment *(*hs_bindgen_c0820759e235b8e4 (void)) ("
         , "  _Bool arg1"
         , ")"
         , "{"
         , "  return &SDL_CreateEnvironment;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_GetEnvironmentVariable */"
         , "__attribute__ ((const))"
         , "char const *(*hs_bindgen_a475668aa4ab4369 (void)) ("
         , "  SDL_Environment *arg1,"
         , "  char const *arg2"
         , ")"
         , "{"
         , "  return &SDL_GetEnvironmentVariable;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_GetEnvironmentVariables */"
         , "__attribute__ ((const))"
         , "char **(*hs_bindgen_9fb7038d3656b96c (void)) ("
         , "  SDL_Environment *arg1"
         , ")"
         , "{"
         , "  return &SDL_GetEnvironmentVariables;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_SetEnvironmentVariable */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_a99329e2f1a82258 (void)) ("
         , "  SDL_Environment *arg1,"
         , "  char const *arg2,"
         , "  char const *arg3,"
         , "  _Bool arg4"
         , ")"
         , "{"
         , "  return &SDL_SetEnvironmentVariable;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_UnsetEnvironmentVariable */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_c6a62ea65fc9d622 (void)) ("
         , "  SDL_Environment *arg1,"
         , "  char const *arg2"
         , ")"
         , "{"
         , "  return &SDL_UnsetEnvironmentVariable;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_DestroyEnvironment */"
         , "__attribute__ ((const))"
         , "void (*hs_bindgen_e750bb904f747388 (void)) ("
         , "  SDL_Environment *arg1"
         , ")"
         , "{"
         , "  return &SDL_DestroyEnvironment;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_getenv */"
         , "__attribute__ ((const))"
         , "char const *(*hs_bindgen_b563cf6799d5c876 (void)) ("
         , "  char const *arg1"
         , ")"
         , "{"
         , "  return &SDL_getenv;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_getenv_unsafe */"
         , "__attribute__ ((const))"
         , "char const *(*hs_bindgen_e6077a375be5ae63 (void)) ("
         , "  char const *arg1"
         , ")"
         , "{"
         , "  return &SDL_getenv_unsafe;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_setenv_unsafe */"
         , "__attribute__ ((const))"
         , "signed int (*hs_bindgen_aaf5efc0afa93f4f (void)) ("
         , "  char const *arg1,"
         , "  char const *arg2,"
         , "  signed int arg3"
         , ")"
         , "{"
         , "  return &SDL_setenv_unsafe;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_unsetenv_unsafe */"
         , "__attribute__ ((const))"
         , "signed int (*hs_bindgen_519fb9e8ee876013 (void)) ("
         , "  char const *arg1"
         , ")"
         , "{"
         , "  return &SDL_unsetenv_unsafe;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_qsort */"
         , "__attribute__ ((const))"
         , "void (*hs_bindgen_fd5cea92e3ba7b16 (void)) ("
         , "  void *arg1,"
         , "  size_t arg2,"
         , "  size_t arg3,"
         , "  SDL_CompareCallback arg4"
         , ")"
         , "{"
         , "  return &SDL_qsort;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_bsearch */"
         , "__attribute__ ((const))"
         , "void *(*hs_bindgen_00f02cc97cc6b9fd (void)) ("
         , "  void const *arg1,"
         , "  void const *arg2,"
         , "  size_t arg3,"
         , "  size_t arg4,"
         , "  SDL_CompareCallback arg5"
         , ")"
         , "{"
         , "  return &SDL_bsearch;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_qsort_r */"
         , "__attribute__ ((const))"
         , "void (*hs_bindgen_271b6eff10a288b3 (void)) ("
         , "  void *arg1,"
         , "  size_t arg2,"
         , "  size_t arg3,"
         , "  SDL_CompareCallback_r arg4,"
         , "  void *arg5"
         , ")"
         , "{"
         , "  return &SDL_qsort_r;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_bsearch_r */"
         , "__attribute__ ((const))"
         , "void *(*hs_bindgen_39f0a8a8445979b1 (void)) ("
         , "  void const *arg1,"
         , "  void const *arg2,"
         , "  size_t arg3,"
         , "  size_t arg4,"
         , "  SDL_CompareCallback_r arg5,"
         , "  void *arg6"
         , ")"
         , "{"
         , "  return &SDL_bsearch_r;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_abs */"
         , "__attribute__ ((const))"
         , "signed int (*hs_bindgen_955d92475ad359d8 (void)) ("
         , "  signed int arg1"
         , ")"
         , "{"
         , "  return &SDL_abs;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_isalpha */"
         , "__attribute__ ((const))"
         , "signed int (*hs_bindgen_8e8018b5d5d8d98f (void)) ("
         , "  signed int arg1"
         , ")"
         , "{"
         , "  return &SDL_isalpha;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_isalnum */"
         , "__attribute__ ((const))"
         , "signed int (*hs_bindgen_a52d45d106787b27 (void)) ("
         , "  signed int arg1"
         , ")"
         , "{"
         , "  return &SDL_isalnum;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_isblank */"
         , "__attribute__ ((const))"
         , "signed int (*hs_bindgen_0c075721ec100ff5 (void)) ("
         , "  signed int arg1"
         , ")"
         , "{"
         , "  return &SDL_isblank;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_iscntrl */"
         , "__attribute__ ((const))"
         , "signed int (*hs_bindgen_de902558496e469f (void)) ("
         , "  signed int arg1"
         , ")"
         , "{"
         , "  return &SDL_iscntrl;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_isdigit */"
         , "__attribute__ ((const))"
         , "signed int (*hs_bindgen_61af141b860ceb41 (void)) ("
         , "  signed int arg1"
         , ")"
         , "{"
         , "  return &SDL_isdigit;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_isxdigit */"
         , "__attribute__ ((const))"
         , "signed int (*hs_bindgen_c17beb32f0f1fd52 (void)) ("
         , "  signed int arg1"
         , ")"
         , "{"
         , "  return &SDL_isxdigit;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_ispunct */"
         , "__attribute__ ((const))"
         , "signed int (*hs_bindgen_a88a9667ca4e8aa7 (void)) ("
         , "  signed int arg1"
         , ")"
         , "{"
         , "  return &SDL_ispunct;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_isspace */"
         , "__attribute__ ((const))"
         , "signed int (*hs_bindgen_02457e0c40d5e057 (void)) ("
         , "  signed int arg1"
         , ")"
         , "{"
         , "  return &SDL_isspace;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_isupper */"
         , "__attribute__ ((const))"
         , "signed int (*hs_bindgen_0f55cc5ba611a3f2 (void)) ("
         , "  signed int arg1"
         , ")"
         , "{"
         , "  return &SDL_isupper;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_islower */"
         , "__attribute__ ((const))"
         , "signed int (*hs_bindgen_f681ed21a8e1349a (void)) ("
         , "  signed int arg1"
         , ")"
         , "{"
         , "  return &SDL_islower;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_isprint */"
         , "__attribute__ ((const))"
         , "signed int (*hs_bindgen_991fe49732021ccb (void)) ("
         , "  signed int arg1"
         , ")"
         , "{"
         , "  return &SDL_isprint;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_isgraph */"
         , "__attribute__ ((const))"
         , "signed int (*hs_bindgen_192487d885c8ab5a (void)) ("
         , "  signed int arg1"
         , ")"
         , "{"
         , "  return &SDL_isgraph;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_toupper */"
         , "__attribute__ ((const))"
         , "signed int (*hs_bindgen_ffb5de4d18c52c67 (void)) ("
         , "  signed int arg1"
         , ")"
         , "{"
         , "  return &SDL_toupper;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_tolower */"
         , "__attribute__ ((const))"
         , "signed int (*hs_bindgen_9f7c4f835baa2ffa (void)) ("
         , "  signed int arg1"
         , ")"
         , "{"
         , "  return &SDL_tolower;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_crc16 */"
         , "__attribute__ ((const))"
         , "Uint16 (*hs_bindgen_a900454baab74e94 (void)) ("
         , "  Uint16 arg1,"
         , "  void const *arg2,"
         , "  size_t arg3"
         , ")"
         , "{"
         , "  return &SDL_crc16;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_crc32 */"
         , "__attribute__ ((const))"
         , "Uint32 (*hs_bindgen_ce720b59f82b140a (void)) ("
         , "  Uint32 arg1,"
         , "  void const *arg2,"
         , "  size_t arg3"
         , ")"
         , "{"
         , "  return &SDL_crc32;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_murmur3_32 */"
         , "__attribute__ ((const))"
         , "Uint32 (*hs_bindgen_fe133a77578cb1aa (void)) ("
         , "  void const *arg1,"
         , "  size_t arg2,"
         , "  Uint32 arg3"
         , ")"
         , "{"
         , "  return &SDL_murmur3_32;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_memset4 */"
         , "__attribute__ ((const))"
         , "void *(*hs_bindgen_45d6fa96a2a35062 (void)) ("
         , "  void *arg1,"
         , "  Uint32 arg2,"
         , "  size_t arg3"
         , ")"
         , "{"
         , "  return &SDL_memset4;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_memcmp */"
         , "__attribute__ ((const))"
         , "signed int (*hs_bindgen_d8af51803c9c5c62 (void)) ("
         , "  void const *arg1,"
         , "  void const *arg2,"
         , "  size_t arg3"
         , ")"
         , "{"
         , "  return &SDL_memcmp;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_wcslen */"
         , "__attribute__ ((const))"
         , "size_t (*hs_bindgen_b1d053429f9e09c3 (void)) ("
         , "  wchar_t const *arg1"
         , ")"
         , "{"
         , "  return &SDL_wcslen;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_wcsnlen */"
         , "__attribute__ ((const))"
         , "size_t (*hs_bindgen_ce1645bc94a325e1 (void)) ("
         , "  wchar_t const *arg1,"
         , "  size_t arg2"
         , ")"
         , "{"
         , "  return &SDL_wcsnlen;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_wcslcpy */"
         , "__attribute__ ((const))"
         , "size_t (*hs_bindgen_11ca43711b8baf20 (void)) ("
         , "  wchar_t *arg1,"
         , "  wchar_t const *arg2,"
         , "  size_t arg3"
         , ")"
         , "{"
         , "  return &SDL_wcslcpy;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_wcslcat */"
         , "__attribute__ ((const))"
         , "size_t (*hs_bindgen_7e7896cd495dd344 (void)) ("
         , "  wchar_t *arg1,"
         , "  wchar_t const *arg2,"
         , "  size_t arg3"
         , ")"
         , "{"
         , "  return &SDL_wcslcat;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_wcsdup */"
         , "__attribute__ ((const))"
         , "wchar_t *(*hs_bindgen_9ab91a86c489d607 (void)) ("
         , "  wchar_t const *arg1"
         , ")"
         , "{"
         , "  return &SDL_wcsdup;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_wcsstr */"
         , "__attribute__ ((const))"
         , "wchar_t *(*hs_bindgen_e5c78fe942e46a5f (void)) ("
         , "  wchar_t const *arg1,"
         , "  wchar_t const *arg2"
         , ")"
         , "{"
         , "  return &SDL_wcsstr;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_wcsnstr */"
         , "__attribute__ ((const))"
         , "wchar_t *(*hs_bindgen_2dc934c7f1856237 (void)) ("
         , "  wchar_t const *arg1,"
         , "  wchar_t const *arg2,"
         , "  size_t arg3"
         , ")"
         , "{"
         , "  return &SDL_wcsnstr;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_wcscmp */"
         , "__attribute__ ((const))"
         , "signed int (*hs_bindgen_759b9046679b686f (void)) ("
         , "  wchar_t const *arg1,"
         , "  wchar_t const *arg2"
         , ")"
         , "{"
         , "  return &SDL_wcscmp;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_wcsncmp */"
         , "__attribute__ ((const))"
         , "signed int (*hs_bindgen_c5ac0e330fb4ae45 (void)) ("
         , "  wchar_t const *arg1,"
         , "  wchar_t const *arg2,"
         , "  size_t arg3"
         , ")"
         , "{"
         , "  return &SDL_wcsncmp;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_wcscasecmp */"
         , "__attribute__ ((const))"
         , "signed int (*hs_bindgen_fb42c136f5dd392f (void)) ("
         , "  wchar_t const *arg1,"
         , "  wchar_t const *arg2"
         , ")"
         , "{"
         , "  return &SDL_wcscasecmp;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_wcsncasecmp */"
         , "__attribute__ ((const))"
         , "signed int (*hs_bindgen_fcc719df5ea9c486 (void)) ("
         , "  wchar_t const *arg1,"
         , "  wchar_t const *arg2,"
         , "  size_t arg3"
         , ")"
         , "{"
         , "  return &SDL_wcsncasecmp;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_strlen */"
         , "__attribute__ ((const))"
         , "size_t (*hs_bindgen_7f2511e625836c60 (void)) ("
         , "  char const *arg1"
         , ")"
         , "{"
         , "  return &SDL_strlen;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_strnlen */"
         , "__attribute__ ((const))"
         , "size_t (*hs_bindgen_f4143204114af698 (void)) ("
         , "  char const *arg1,"
         , "  size_t arg2"
         , ")"
         , "{"
         , "  return &SDL_strnlen;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_strlcpy */"
         , "__attribute__ ((const))"
         , "size_t (*hs_bindgen_7640410395c54d89 (void)) ("
         , "  char *arg1,"
         , "  char const *arg2,"
         , "  size_t arg3"
         , ")"
         , "{"
         , "  return &SDL_strlcpy;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_utf8strlcpy */"
         , "__attribute__ ((const))"
         , "size_t (*hs_bindgen_a2badcf2b044ea50 (void)) ("
         , "  char *arg1,"
         , "  char const *arg2,"
         , "  size_t arg3"
         , ")"
         , "{"
         , "  return &SDL_utf8strlcpy;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_strlcat */"
         , "__attribute__ ((const))"
         , "size_t (*hs_bindgen_26754eda643124d0 (void)) ("
         , "  char *arg1,"
         , "  char const *arg2,"
         , "  size_t arg3"
         , ")"
         , "{"
         , "  return &SDL_strlcat;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_strdup */"
         , "__attribute__ ((const))"
         , "char *(*hs_bindgen_71b06acdd2d314be (void)) ("
         , "  char const *arg1"
         , ")"
         , "{"
         , "  return &SDL_strdup;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_strndup */"
         , "__attribute__ ((const))"
         , "char *(*hs_bindgen_fd797c695710e05f (void)) ("
         , "  char const *arg1,"
         , "  size_t arg2"
         , ")"
         , "{"
         , "  return &SDL_strndup;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_strrev */"
         , "__attribute__ ((const))"
         , "char *(*hs_bindgen_ffc5b79b6b976433 (void)) ("
         , "  char *arg1"
         , ")"
         , "{"
         , "  return &SDL_strrev;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_strupr */"
         , "__attribute__ ((const))"
         , "char *(*hs_bindgen_ca97edf7bfcb6705 (void)) ("
         , "  char *arg1"
         , ")"
         , "{"
         , "  return &SDL_strupr;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_strlwr */"
         , "__attribute__ ((const))"
         , "char *(*hs_bindgen_d78a5116cc6d3f71 (void)) ("
         , "  char *arg1"
         , ")"
         , "{"
         , "  return &SDL_strlwr;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_strchr */"
         , "__attribute__ ((const))"
         , "char *(*hs_bindgen_6ce9f7bacdf27653 (void)) ("
         , "  char const *arg1,"
         , "  signed int arg2"
         , ")"
         , "{"
         , "  return &SDL_strchr;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_strrchr */"
         , "__attribute__ ((const))"
         , "char *(*hs_bindgen_d2538022eb73bf53 (void)) ("
         , "  char const *arg1,"
         , "  signed int arg2"
         , ")"
         , "{"
         , "  return &SDL_strrchr;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_strstr */"
         , "__attribute__ ((const))"
         , "char *(*hs_bindgen_b07cb6fe84d9cf1e (void)) ("
         , "  char const *arg1,"
         , "  char const *arg2"
         , ")"
         , "{"
         , "  return &SDL_strstr;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_strnstr */"
         , "__attribute__ ((const))"
         , "char *(*hs_bindgen_c3b37921fa630595 (void)) ("
         , "  char const *arg1,"
         , "  char const *arg2,"
         , "  size_t arg3"
         , ")"
         , "{"
         , "  return &SDL_strnstr;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_strcasestr */"
         , "__attribute__ ((const))"
         , "char *(*hs_bindgen_3b1f9973e35be364 (void)) ("
         , "  char const *arg1,"
         , "  char const *arg2"
         , ")"
         , "{"
         , "  return &SDL_strcasestr;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_strtok_r */"
         , "__attribute__ ((const))"
         , "char *(*hs_bindgen_99a1a0af797e8aad (void)) ("
         , "  char *arg1,"
         , "  char const *arg2,"
         , "  char **arg3"
         , ")"
         , "{"
         , "  return &SDL_strtok_r;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_utf8strlen */"
         , "__attribute__ ((const))"
         , "size_t (*hs_bindgen_fdd33f5a5e9573d8 (void)) ("
         , "  char const *arg1"
         , ")"
         , "{"
         , "  return &SDL_utf8strlen;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_utf8strnlen */"
         , "__attribute__ ((const))"
         , "size_t (*hs_bindgen_1e79ccdd40706b8d (void)) ("
         , "  char const *arg1,"
         , "  size_t arg2"
         , ")"
         , "{"
         , "  return &SDL_utf8strnlen;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_itoa */"
         , "__attribute__ ((const))"
         , "char *(*hs_bindgen_4cfc9a356cf1014c (void)) ("
         , "  signed int arg1,"
         , "  char *arg2,"
         , "  signed int arg3"
         , ")"
         , "{"
         , "  return &SDL_itoa;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_uitoa */"
         , "__attribute__ ((const))"
         , "char *(*hs_bindgen_e052861370ec1ea4 (void)) ("
         , "  unsigned int arg1,"
         , "  char *arg2,"
         , "  signed int arg3"
         , ")"
         , "{"
         , "  return &SDL_uitoa;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_lltoa */"
         , "__attribute__ ((const))"
         , "char *(*hs_bindgen_9c5155b926feaa3f (void)) ("
         , "  signed long long arg1,"
         , "  char *arg2,"
         , "  signed int arg3"
         , ")"
         , "{"
         , "  return &SDL_lltoa;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_ulltoa */"
         , "__attribute__ ((const))"
         , "char *(*hs_bindgen_a3b3fdde6f9a0142 (void)) ("
         , "  unsigned long long arg1,"
         , "  char *arg2,"
         , "  signed int arg3"
         , ")"
         , "{"
         , "  return &SDL_ulltoa;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_atoi */"
         , "__attribute__ ((const))"
         , "signed int (*hs_bindgen_9a3e9e2b67b916a2 (void)) ("
         , "  char const *arg1"
         , ")"
         , "{"
         , "  return &SDL_atoi;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_atof */"
         , "__attribute__ ((const))"
         , "double (*hs_bindgen_2804d8be78ed3cae (void)) ("
         , "  char const *arg1"
         , ")"
         , "{"
         , "  return &SDL_atof;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_strtoll */"
         , "__attribute__ ((const))"
         , "signed long long (*hs_bindgen_6e1c8dc5ccea4653 (void)) ("
         , "  char const *arg1,"
         , "  char **arg2,"
         , "  signed int arg3"
         , ")"
         , "{"
         , "  return &SDL_strtoll;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_strtoull */"
         , "__attribute__ ((const))"
         , "unsigned long long (*hs_bindgen_f81f822f17549fa4 (void)) ("
         , "  char const *arg1,"
         , "  char **arg2,"
         , "  signed int arg3"
         , ")"
         , "{"
         , "  return &SDL_strtoull;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_strtod */"
         , "__attribute__ ((const))"
         , "double (*hs_bindgen_6ab6327bbf86f171 (void)) ("
         , "  char const *arg1,"
         , "  char **arg2"
         , ")"
         , "{"
         , "  return &SDL_strtod;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_strcmp */"
         , "__attribute__ ((const))"
         , "signed int (*hs_bindgen_fc45ddd2c1f0219e (void)) ("
         , "  char const *arg1,"
         , "  char const *arg2"
         , ")"
         , "{"
         , "  return &SDL_strcmp;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_strncmp */"
         , "__attribute__ ((const))"
         , "signed int (*hs_bindgen_18f45fe45a42c194 (void)) ("
         , "  char const *arg1,"
         , "  char const *arg2,"
         , "  size_t arg3"
         , ")"
         , "{"
         , "  return &SDL_strncmp;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_strcasecmp */"
         , "__attribute__ ((const))"
         , "signed int (*hs_bindgen_2996562bf0a4585e (void)) ("
         , "  char const *arg1,"
         , "  char const *arg2"
         , ")"
         , "{"
         , "  return &SDL_strcasecmp;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_strncasecmp */"
         , "__attribute__ ((const))"
         , "signed int (*hs_bindgen_28d4c90d056ca0bb (void)) ("
         , "  char const *arg1,"
         , "  char const *arg2,"
         , "  size_t arg3"
         , ")"
         , "{"
         , "  return &SDL_strncasecmp;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_strpbrk */"
         , "__attribute__ ((const))"
         , "char *(*hs_bindgen_65f684850b2f315d (void)) ("
         , "  char const *arg1,"
         , "  char const *arg2"
         , ")"
         , "{"
         , "  return &SDL_strpbrk;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_StepUTF8 */"
         , "__attribute__ ((const))"
         , "Uint32 (*hs_bindgen_0907aee5a9e22b6c (void)) ("
         , "  char const **arg1,"
         , "  size_t *arg2"
         , ")"
         , "{"
         , "  return &SDL_StepUTF8;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_StepBackUTF8 */"
         , "__attribute__ ((const))"
         , "Uint32 (*hs_bindgen_ccaed4cafbb7e45b (void)) ("
         , "  char const *arg1,"
         , "  char const **arg2"
         , ")"
         , "{"
         , "  return &SDL_StepBackUTF8;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_UCS4ToUTF8 */"
         , "__attribute__ ((const))"
         , "char *(*hs_bindgen_d8d90fbed44bffa4 (void)) ("
         , "  Uint32 arg1,"
         , "  char *arg2"
         , ")"
         , "{"
         , "  return &SDL_UCS4ToUTF8;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_srand */"
         , "__attribute__ ((const))"
         , "void (*hs_bindgen_da73119d08a07679 (void)) ("
         , "  Uint64 arg1"
         , ")"
         , "{"
         , "  return &SDL_srand;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_rand */"
         , "__attribute__ ((const))"
         , "Sint32 (*hs_bindgen_4e5afaafc53503d2 (void)) ("
         , "  Sint32 arg1"
         , ")"
         , "{"
         , "  return &SDL_rand;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_randf */"
         , "__attribute__ ((const))"
         , "float (*hs_bindgen_e6a11f5c2731e306 (void)) (void)"
         , "{"
         , "  return &SDL_randf;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_rand_bits */"
         , "__attribute__ ((const))"
         , "Uint32 (*hs_bindgen_1b4a072c67be4b47 (void)) (void)"
         , "{"
         , "  return &SDL_rand_bits;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_rand_r */"
         , "__attribute__ ((const))"
         , "Sint32 (*hs_bindgen_b7805b04f67ee663 (void)) ("
         , "  Uint64 *arg1,"
         , "  Sint32 arg2"
         , ")"
         , "{"
         , "  return &SDL_rand_r;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_randf_r */"
         , "__attribute__ ((const))"
         , "float (*hs_bindgen_2868c0dca829c12d (void)) ("
         , "  Uint64 *arg1"
         , ")"
         , "{"
         , "  return &SDL_randf_r;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_rand_bits_r */"
         , "__attribute__ ((const))"
         , "Uint32 (*hs_bindgen_4f041e8bf307388e (void)) ("
         , "  Uint64 *arg1"
         , ")"
         , "{"
         , "  return &SDL_rand_bits_r;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_acos */"
         , "__attribute__ ((const))"
         , "double (*hs_bindgen_fc7fee2483850ab3 (void)) ("
         , "  double arg1"
         , ")"
         , "{"
         , "  return &SDL_acos;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_acosf */"
         , "__attribute__ ((const))"
         , "float (*hs_bindgen_521ecf135cd97997 (void)) ("
         , "  float arg1"
         , ")"
         , "{"
         , "  return &SDL_acosf;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_asin */"
         , "__attribute__ ((const))"
         , "double (*hs_bindgen_0446975347dc0e74 (void)) ("
         , "  double arg1"
         , ")"
         , "{"
         , "  return &SDL_asin;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_asinf */"
         , "__attribute__ ((const))"
         , "float (*hs_bindgen_6069a6cbf645d9a4 (void)) ("
         , "  float arg1"
         , ")"
         , "{"
         , "  return &SDL_asinf;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_atan */"
         , "__attribute__ ((const))"
         , "double (*hs_bindgen_eb9c094d5b8cc44a (void)) ("
         , "  double arg1"
         , ")"
         , "{"
         , "  return &SDL_atan;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_atanf */"
         , "__attribute__ ((const))"
         , "float (*hs_bindgen_9807f179a4fbb908 (void)) ("
         , "  float arg1"
         , ")"
         , "{"
         , "  return &SDL_atanf;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_atan2 */"
         , "__attribute__ ((const))"
         , "double (*hs_bindgen_c868e29b9251ada8 (void)) ("
         , "  double arg1,"
         , "  double arg2"
         , ")"
         , "{"
         , "  return &SDL_atan2;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_atan2f */"
         , "__attribute__ ((const))"
         , "float (*hs_bindgen_357a95d359b4aaad (void)) ("
         , "  float arg1,"
         , "  float arg2"
         , ")"
         , "{"
         , "  return &SDL_atan2f;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_ceil */"
         , "__attribute__ ((const))"
         , "double (*hs_bindgen_51763cbf0b798de3 (void)) ("
         , "  double arg1"
         , ")"
         , "{"
         , "  return &SDL_ceil;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_ceilf */"
         , "__attribute__ ((const))"
         , "float (*hs_bindgen_362325253c9b19f8 (void)) ("
         , "  float arg1"
         , ")"
         , "{"
         , "  return &SDL_ceilf;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_copysign */"
         , "__attribute__ ((const))"
         , "double (*hs_bindgen_df3beaabf480a0d3 (void)) ("
         , "  double arg1,"
         , "  double arg2"
         , ")"
         , "{"
         , "  return &SDL_copysign;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_copysignf */"
         , "__attribute__ ((const))"
         , "float (*hs_bindgen_e6af77974ed5435f (void)) ("
         , "  float arg1,"
         , "  float arg2"
         , ")"
         , "{"
         , "  return &SDL_copysignf;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_cos */"
         , "__attribute__ ((const))"
         , "double (*hs_bindgen_3d9b0e8a53288293 (void)) ("
         , "  double arg1"
         , ")"
         , "{"
         , "  return &SDL_cos;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_cosf */"
         , "__attribute__ ((const))"
         , "float (*hs_bindgen_8a6d19c21d08744f (void)) ("
         , "  float arg1"
         , ")"
         , "{"
         , "  return &SDL_cosf;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_exp */"
         , "__attribute__ ((const))"
         , "double (*hs_bindgen_32a0ab5c8aca638e (void)) ("
         , "  double arg1"
         , ")"
         , "{"
         , "  return &SDL_exp;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_expf */"
         , "__attribute__ ((const))"
         , "float (*hs_bindgen_e734b446bd66b310 (void)) ("
         , "  float arg1"
         , ")"
         , "{"
         , "  return &SDL_expf;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_fabs */"
         , "__attribute__ ((const))"
         , "double (*hs_bindgen_0fe1f848b90d29bc (void)) ("
         , "  double arg1"
         , ")"
         , "{"
         , "  return &SDL_fabs;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_fabsf */"
         , "__attribute__ ((const))"
         , "float (*hs_bindgen_1e189b3e959f375b (void)) ("
         , "  float arg1"
         , ")"
         , "{"
         , "  return &SDL_fabsf;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_floor */"
         , "__attribute__ ((const))"
         , "double (*hs_bindgen_ae709679ac231e3a (void)) ("
         , "  double arg1"
         , ")"
         , "{"
         , "  return &SDL_floor;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_floorf */"
         , "__attribute__ ((const))"
         , "float (*hs_bindgen_6bcbc045e8590408 (void)) ("
         , "  float arg1"
         , ")"
         , "{"
         , "  return &SDL_floorf;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_trunc */"
         , "__attribute__ ((const))"
         , "double (*hs_bindgen_9ff826562c85b6db (void)) ("
         , "  double arg1"
         , ")"
         , "{"
         , "  return &SDL_trunc;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_truncf */"
         , "__attribute__ ((const))"
         , "float (*hs_bindgen_5afacbe63e710528 (void)) ("
         , "  float arg1"
         , ")"
         , "{"
         , "  return &SDL_truncf;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_fmod */"
         , "__attribute__ ((const))"
         , "double (*hs_bindgen_3a93d2030ffd9ef3 (void)) ("
         , "  double arg1,"
         , "  double arg2"
         , ")"
         , "{"
         , "  return &SDL_fmod;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_fmodf */"
         , "__attribute__ ((const))"
         , "float (*hs_bindgen_a851844ef04e542d (void)) ("
         , "  float arg1,"
         , "  float arg2"
         , ")"
         , "{"
         , "  return &SDL_fmodf;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_isinf */"
         , "__attribute__ ((const))"
         , "signed int (*hs_bindgen_d9346ba385534fdd (void)) ("
         , "  double arg1"
         , ")"
         , "{"
         , "  return &SDL_isinf;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_isinff */"
         , "__attribute__ ((const))"
         , "signed int (*hs_bindgen_bfaf6777c1c350c3 (void)) ("
         , "  float arg1"
         , ")"
         , "{"
         , "  return &SDL_isinff;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_isnan */"
         , "__attribute__ ((const))"
         , "signed int (*hs_bindgen_006f33027be22f99 (void)) ("
         , "  double arg1"
         , ")"
         , "{"
         , "  return &SDL_isnan;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_isnanf */"
         , "__attribute__ ((const))"
         , "signed int (*hs_bindgen_308e1efef7090245 (void)) ("
         , "  float arg1"
         , ")"
         , "{"
         , "  return &SDL_isnanf;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_log */"
         , "__attribute__ ((const))"
         , "double (*hs_bindgen_4f9418e7e4267684 (void)) ("
         , "  double arg1"
         , ")"
         , "{"
         , "  return &SDL_log;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_logf */"
         , "__attribute__ ((const))"
         , "float (*hs_bindgen_ab81f791c1e3e516 (void)) ("
         , "  float arg1"
         , ")"
         , "{"
         , "  return &SDL_logf;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_log10 */"
         , "__attribute__ ((const))"
         , "double (*hs_bindgen_c9a4b45a046047ba (void)) ("
         , "  double arg1"
         , ")"
         , "{"
         , "  return &SDL_log10;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_log10f */"
         , "__attribute__ ((const))"
         , "float (*hs_bindgen_72ace8de925eb690 (void)) ("
         , "  float arg1"
         , ")"
         , "{"
         , "  return &SDL_log10f;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_modf */"
         , "__attribute__ ((const))"
         , "double (*hs_bindgen_b05adeb0cad2dab6 (void)) ("
         , "  double arg1,"
         , "  double *arg2"
         , ")"
         , "{"
         , "  return &SDL_modf;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_modff */"
         , "__attribute__ ((const))"
         , "float (*hs_bindgen_59f3b87137ea46cd (void)) ("
         , "  float arg1,"
         , "  float *arg2"
         , ")"
         , "{"
         , "  return &SDL_modff;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_pow */"
         , "__attribute__ ((const))"
         , "double (*hs_bindgen_75e5e5b712af4971 (void)) ("
         , "  double arg1,"
         , "  double arg2"
         , ")"
         , "{"
         , "  return &SDL_pow;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_powf */"
         , "__attribute__ ((const))"
         , "float (*hs_bindgen_deb1ba3db460136c (void)) ("
         , "  float arg1,"
         , "  float arg2"
         , ")"
         , "{"
         , "  return &SDL_powf;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_round */"
         , "__attribute__ ((const))"
         , "double (*hs_bindgen_e8841dcdfaff32de (void)) ("
         , "  double arg1"
         , ")"
         , "{"
         , "  return &SDL_round;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_roundf */"
         , "__attribute__ ((const))"
         , "float (*hs_bindgen_57450d2f082e285c (void)) ("
         , "  float arg1"
         , ")"
         , "{"
         , "  return &SDL_roundf;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_scalbn */"
         , "__attribute__ ((const))"
         , "double (*hs_bindgen_6fc1ebd971ec8157 (void)) ("
         , "  double arg1,"
         , "  signed int arg2"
         , ")"
         , "{"
         , "  return &SDL_scalbn;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_scalbnf */"
         , "__attribute__ ((const))"
         , "float (*hs_bindgen_706cd6213dd8d69d (void)) ("
         , "  float arg1,"
         , "  signed int arg2"
         , ")"
         , "{"
         , "  return &SDL_scalbnf;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_sin */"
         , "__attribute__ ((const))"
         , "double (*hs_bindgen_e4b1725cdd38afe4 (void)) ("
         , "  double arg1"
         , ")"
         , "{"
         , "  return &SDL_sin;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_sinf */"
         , "__attribute__ ((const))"
         , "float (*hs_bindgen_4d400d672d200ac9 (void)) ("
         , "  float arg1"
         , ")"
         , "{"
         , "  return &SDL_sinf;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_sqrt */"
         , "__attribute__ ((const))"
         , "double (*hs_bindgen_8352f3e6d4755f65 (void)) ("
         , "  double arg1"
         , ")"
         , "{"
         , "  return &SDL_sqrt;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_sqrtf */"
         , "__attribute__ ((const))"
         , "float (*hs_bindgen_87f1efd0a9654c58 (void)) ("
         , "  float arg1"
         , ")"
         , "{"
         , "  return &SDL_sqrtf;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_tan */"
         , "__attribute__ ((const))"
         , "double (*hs_bindgen_4a65c95891312c30 (void)) ("
         , "  double arg1"
         , ")"
         , "{"
         , "  return &SDL_tan;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_tanf */"
         , "__attribute__ ((const))"
         , "float (*hs_bindgen_094dc8b00c4ee010 (void)) ("
         , "  float arg1"
         , ")"
         , "{"
         , "  return &SDL_tanf;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_iconv_open */"
         , "__attribute__ ((const))"
         , "SDL_iconv_t (*hs_bindgen_704fe1bf2ce9aef6 (void)) ("
         , "  char const *arg1,"
         , "  char const *arg2"
         , ")"
         , "{"
         , "  return &SDL_iconv_open;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_iconv_close */"
         , "__attribute__ ((const))"
         , "signed int (*hs_bindgen_2c0a62f403d4446c (void)) ("
         , "  SDL_iconv_t arg1"
         , ")"
         , "{"
         , "  return &SDL_iconv_close;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_iconv */"
         , "__attribute__ ((const))"
         , "size_t (*hs_bindgen_c0049201d1f4606f (void)) ("
         , "  SDL_iconv_t arg1,"
         , "  char const **arg2,"
         , "  size_t *arg3,"
         , "  char **arg4,"
         , "  size_t *arg5"
         , ")"
         , "{"
         , "  return &SDL_iconv;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_iconv_string */"
         , "__attribute__ ((const))"
         , "char *(*hs_bindgen_ce165346002f1247 (void)) ("
         , "  char const *arg1,"
         , "  char const *arg2,"
         , "  char const *arg3,"
         , "  size_t arg4"
         , ")"
         , "{"
         , "  return &SDL_iconv_string;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_size_mul_check_overflow_builtin */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_5f2e41800217ca05 (void)) ("
         , "  size_t arg1,"
         , "  size_t arg2,"
         , "  size_t *arg3"
         , ")"
         , "{"
         , "  return &SDL_size_mul_check_overflow_builtin;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_size_add_check_overflow_builtin */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_2d8ca557aa2f3eb0 (void)) ("
         , "  size_t arg1,"
         , "  size_t arg2,"
         , "  size_t *arg3"
         , ")"
         , "{"
         , "  return &SDL_size_add_check_overflow_builtin;"
         , "}"
         ]
     )
 )

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_malloc@
foreign import ccall unsafe "hs_bindgen_9722441ea82cf670"
  hs_bindgen_9722441ea82cf670_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_malloc@
hs_bindgen_9722441ea82cf670 :: IO (BG.FunPtr (HsBindgen.Runtime.LibC.CSize -> IO (BG.Ptr BG.Void)))
hs_bindgen_9722441ea82cf670 =
  BG.fromFFIType hs_bindgen_9722441ea82cf670_base

{-# NOINLINE sDL_malloc #-}

-- | Allocate uninitialized memory.
--
--     The allocated memory returned by this function must be freed with @SDL_free()@.
--
--     If @size@ is 0, it will be set to 1.
--
--     If the allocation is successful, the returned pointer is guaranteed to be aligned to either the /fundamental alignment/ (@alignof(max_align_t)@ in C11 and later) or @2 * sizeof(void *)@, whichever is smaller. Use @SDL_aligned_alloc()@ if you need to allocate memory aligned to an alignment greater than this guarantee.
--
--     [@size@]: the size to allocate.
--
--     [Returns]: a pointer to the allocated memory, or NULL if allocation failed.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_free', SDL_calloc, SDL_realloc, 'sDL_aligned_alloc'
--
--     [C declaration]: @SDL_malloc@, defined at @SDL3\/SDL_stdinc.h 1341:47@
sDL_malloc :: BG.FunPtr (HsBindgen.Runtime.LibC.CSize -> IO (BG.Ptr BG.Void))
sDL_malloc =
  BG.unsafePerformIO hs_bindgen_9722441ea82cf670

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_calloc@
foreign import ccall unsafe "hs_bindgen_2b076bb91cf947df"
  hs_bindgen_2b076bb91cf947df_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_calloc@
hs_bindgen_2b076bb91cf947df
  :: IO (BG.FunPtr (HsBindgen.Runtime.LibC.CSize -> HsBindgen.Runtime.LibC.CSize -> IO (BG.Ptr BG.Void)))
hs_bindgen_2b076bb91cf947df =
  BG.fromFFIType hs_bindgen_2b076bb91cf947df_base

{-# NOINLINE sDL_calloc #-}

-- | [C declaration]: @SDL_calloc@, defined at @SDL3\/SDL_stdinc.h 1366:69@
sDL_calloc
  :: BG.FunPtr (HsBindgen.Runtime.LibC.CSize -> HsBindgen.Runtime.LibC.CSize -> IO (BG.Ptr BG.Void))
sDL_calloc =
  BG.unsafePerformIO hs_bindgen_2b076bb91cf947df

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_realloc@
foreign import ccall unsafe "hs_bindgen_bbae567861825a2b"
  hs_bindgen_bbae567861825a2b_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_realloc@
hs_bindgen_bbae567861825a2b
  :: IO (BG.FunPtr (BG.Ptr BG.Void -> HsBindgen.Runtime.LibC.CSize -> IO (BG.Ptr BG.Void)))
hs_bindgen_bbae567861825a2b =
  BG.fromFFIType hs_bindgen_bbae567861825a2b_base

{-# NOINLINE sDL_realloc #-}

-- | [C declaration]: @SDL_realloc@, defined at @SDL3\/SDL_stdinc.h 1406:54@
sDL_realloc :: BG.FunPtr (BG.Ptr BG.Void -> HsBindgen.Runtime.LibC.CSize -> IO (BG.Ptr BG.Void))
sDL_realloc =
  BG.unsafePerformIO hs_bindgen_bbae567861825a2b

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_free@
foreign import ccall unsafe "hs_bindgen_0f3dfcf2ab9d228a"
  hs_bindgen_0f3dfcf2ab9d228a_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_free@
hs_bindgen_0f3dfcf2ab9d228a :: IO (BG.FunPtr (BG.Ptr BG.Void -> IO ()))
hs_bindgen_0f3dfcf2ab9d228a =
  BG.fromFFIType hs_bindgen_0f3dfcf2ab9d228a_base

{-# NOINLINE sDL_free #-}

-- | Free allocated memory.
--
--     The pointer is no longer valid after this call and cannot be dereferenced anymore.
--
--     If @mem@ is NULL, this function does nothing.
--
--     [@mem@]: a pointer to allocated memory, or NULL.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_malloc', SDL_calloc, SDL_realloc
--
--     [C declaration]: @SDL_free@, defined at @SDL3\/SDL_stdinc.h 1426:34@
sDL_free :: BG.FunPtr (BG.Ptr BG.Void -> IO ())
sDL_free =
  BG.unsafePerformIO hs_bindgen_0f3dfcf2ab9d228a

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_GetOriginalMemoryFunctions@
foreign import ccall unsafe "hs_bindgen_4ad4cf326cf2d8ee"
  hs_bindgen_4ad4cf326cf2d8ee_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_GetOriginalMemoryFunctions@
hs_bindgen_4ad4cf326cf2d8ee
  :: IO
       ( BG.FunPtr
           ( BG.Ptr SDL_malloc_func
             -> BG.Ptr SDL_calloc_func
             -> BG.Ptr SDL_realloc_func
             -> BG.Ptr SDL_free_func
             -> IO ()
           )
       )
hs_bindgen_4ad4cf326cf2d8ee =
  BG.fromFFIType hs_bindgen_4ad4cf326cf2d8ee_base

{-# NOINLINE sDL_GetOriginalMemoryFunctions #-}

-- | Get the original set of SDL memory functions.
--
--     This is what SDL_malloc and friends will use by default, if there has been no call to SDL_SetMemoryFunctions. This is not necessarily using the C runtime\'s @malloc@ functions behind the scenes! Different platforms and build configurations might do any number of unexpected things.
--
--     [@malloc_func@]: filled with malloc function.
--
--     [@calloc_func@]: filled with calloc function.
--
--     [@realloc_func@]: filled with realloc function.
--
--     [@free_func@]: filled with free function.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_GetOriginalMemoryFunctions@, defined at @SDL3\/SDL_stdinc.h 1524:34@
sDL_GetOriginalMemoryFunctions
  :: BG.FunPtr
       ( BG.Ptr SDL_malloc_func
         -> BG.Ptr SDL_calloc_func
         -> BG.Ptr SDL_realloc_func
         -> BG.Ptr SDL_free_func
         -> IO ()
       )
sDL_GetOriginalMemoryFunctions =
  BG.unsafePerformIO hs_bindgen_4ad4cf326cf2d8ee

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_GetMemoryFunctions@
foreign import ccall unsafe "hs_bindgen_d860ef935b823504"
  hs_bindgen_d860ef935b823504_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_GetMemoryFunctions@
hs_bindgen_d860ef935b823504
  :: IO
       ( BG.FunPtr
           ( BG.Ptr SDL_malloc_func
             -> BG.Ptr SDL_calloc_func
             -> BG.Ptr SDL_realloc_func
             -> BG.Ptr SDL_free_func
             -> IO ()
           )
       )
hs_bindgen_d860ef935b823504 =
  BG.fromFFIType hs_bindgen_d860ef935b823504_base

{-# NOINLINE sDL_GetMemoryFunctions #-}

-- | Get the current set of SDL memory functions.
--
--     [@malloc_func@]: filled with malloc function.
--
--     [@calloc_func@]: filled with calloc function.
--
--     [@realloc_func@]: filled with realloc function.
--
--     [@free_func@]: filled with free function.
--
--     [Thread safety]: This does not hold a lock, so do not call this in the unlikely event of a background thread calling SDL_SetMemoryFunctions simultaneously.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_SetMemoryFunctions', 'sDL_GetOriginalMemoryFunctions'
--
--     [C declaration]: @SDL_GetMemoryFunctions@, defined at @SDL3\/SDL_stdinc.h 1546:34@
sDL_GetMemoryFunctions
  :: BG.FunPtr
       ( BG.Ptr SDL_malloc_func
         -> BG.Ptr SDL_calloc_func
         -> BG.Ptr SDL_realloc_func
         -> BG.Ptr SDL_free_func
         -> IO ()
       )
sDL_GetMemoryFunctions =
  BG.unsafePerformIO hs_bindgen_d860ef935b823504

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_SetMemoryFunctions@
foreign import ccall unsafe "hs_bindgen_a474c8c00b052ea2"
  hs_bindgen_a474c8c00b052ea2_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_SetMemoryFunctions@
hs_bindgen_a474c8c00b052ea2
  :: IO
       (BG.FunPtr (SDL_malloc_func -> SDL_calloc_func -> SDL_realloc_func -> SDL_free_func -> IO BG.CBool))
hs_bindgen_a474c8c00b052ea2 =
  BG.fromFFIType hs_bindgen_a474c8c00b052ea2_base

{-# NOINLINE sDL_SetMemoryFunctions #-}

-- | Replace SDL\'s memory allocation functions with a custom set.
--
--     It is not safe to call this function once any allocations have been made, as future calls to SDL_free will use the new allocator, even if they came from an SDL_malloc made with the old one!
--
--     If used, usually this needs to be the first call made into the SDL library, if not the very first thing done at program startup time.
--
--     [@malloc_func@]: custom malloc function.
--
--     [@calloc_func@]: custom calloc function.
--
--     [@realloc_func@]: custom realloc function.
--
--     [@free_func@]: custom free function.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread, but one should not replace the memory functions once any allocations are made!
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetMemoryFunctions', 'sDL_GetOriginalMemoryFunctions'
--
--     [C declaration]: @SDL_SetMemoryFunctions@, defined at @SDL3\/SDL_stdinc.h 1577:34@
sDL_SetMemoryFunctions
  :: BG.FunPtr (SDL_malloc_func -> SDL_calloc_func -> SDL_realloc_func -> SDL_free_func -> IO BG.CBool)
sDL_SetMemoryFunctions =
  BG.unsafePerformIO hs_bindgen_a474c8c00b052ea2

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_aligned_alloc@
foreign import ccall unsafe "hs_bindgen_de151c2774561d5d"
  hs_bindgen_de151c2774561d5d_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_aligned_alloc@
hs_bindgen_de151c2774561d5d
  :: IO (BG.FunPtr (HsBindgen.Runtime.LibC.CSize -> HsBindgen.Runtime.LibC.CSize -> IO (BG.Ptr BG.Void)))
hs_bindgen_de151c2774561d5d =
  BG.fromFFIType hs_bindgen_de151c2774561d5d_base

{-# NOINLINE sDL_aligned_alloc #-}

-- | Allocate memory aligned to a specific alignment.
--
--     The memory returned by this function must be freed with @SDL_aligned_free()@, /not/ @SDL_free()@.
--
--     If @alignment@ is less than the size of @void *@, it will be increased to match that.
--
--     The returned memory address will be a multiple of the alignment value, and the size of the memory allocated will be a multiple of the alignment value.
--
--     [@alignment@]: the alignment of the memory.
--
--     [@size@]: the size to allocate.
--
--     [Returns]: a pointer to the aligned memory, or NULL if allocation failed.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_aligned_free'
--
--     [C declaration]: @SDL_aligned_alloc@, defined at @SDL3\/SDL_stdinc.h 1604:47@
sDL_aligned_alloc
  :: BG.FunPtr (HsBindgen.Runtime.LibC.CSize -> HsBindgen.Runtime.LibC.CSize -> IO (BG.Ptr BG.Void))
sDL_aligned_alloc =
  BG.unsafePerformIO hs_bindgen_de151c2774561d5d

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_aligned_free@
foreign import ccall unsafe "hs_bindgen_dd6b53bc3c6f96ea"
  hs_bindgen_dd6b53bc3c6f96ea_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_aligned_free@
hs_bindgen_dd6b53bc3c6f96ea :: IO (BG.FunPtr (BG.Ptr BG.Void -> IO ()))
hs_bindgen_dd6b53bc3c6f96ea =
  BG.fromFFIType hs_bindgen_dd6b53bc3c6f96ea_base

{-# NOINLINE sDL_aligned_free #-}

-- | Free memory allocated by @SDL_aligned_alloc()@.
--
--     The pointer is no longer valid after this call and cannot be dereferenced anymore.
--
--     If @mem@ is NULL, this function does nothing.
--
--     [@mem@]: a pointer previously returned by @SDL_aligned_alloc()@, or NULL.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_aligned_alloc'
--
--     [C declaration]: @SDL_aligned_free@, defined at @SDL3\/SDL_stdinc.h 1622:34@
sDL_aligned_free :: BG.FunPtr (BG.Ptr BG.Void -> IO ())
sDL_aligned_free =
  BG.unsafePerformIO hs_bindgen_dd6b53bc3c6f96ea

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_GetNumAllocations@
foreign import ccall unsafe "hs_bindgen_fe81cad123788733"
  hs_bindgen_fe81cad123788733_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_GetNumAllocations@
hs_bindgen_fe81cad123788733 :: IO (BG.FunPtr (IO BG.CInt))
hs_bindgen_fe81cad123788733 =
  BG.fromFFIType hs_bindgen_fe81cad123788733_base

{-# NOINLINE sDL_GetNumAllocations #-}

-- | Get the number of outstanding (unfreed) allocations.
--
--     [Returns]: the number of allocations or -1 if allocation counting is disabled.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_GetNumAllocations@, defined at @SDL3\/SDL_stdinc.h 1634:33@
sDL_GetNumAllocations :: BG.FunPtr (IO BG.CInt)
sDL_GetNumAllocations =
  BG.unsafePerformIO hs_bindgen_fe81cad123788733

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_GetEnvironment@
foreign import ccall unsafe "hs_bindgen_9a656c04aab82f9e"
  hs_bindgen_9a656c04aab82f9e_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_GetEnvironment@
hs_bindgen_9a656c04aab82f9e :: IO (BG.FunPtr (IO (BG.Ptr SDL_Environment)))
hs_bindgen_9a656c04aab82f9e =
  BG.fromFFIType hs_bindgen_9a656c04aab82f9e_base

{-# NOINLINE sDL_GetEnvironment #-}

-- | Get the process environment.
--
--     This is initialized at application start and is not affected by setenv() and unsetenv() calls after that point. Use @SDL_SetEnvironmentVariable()@ and @SDL_UnsetEnvironmentVariable()@ if you want to modify this environment, or @SDL_setenv_unsafe()@ or @SDL_unsetenv_unsafe()@ if you want changes to persist in the C runtime environment after SDL_Quit().
--
--     [Returns]: a pointer to the environment for the process or NULL on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetEnvironmentVariable', 'sDL_GetEnvironmentVariables', 'sDL_SetEnvironmentVariable', 'sDL_UnsetEnvironmentVariable'
--
--     [C declaration]: @SDL_GetEnvironment@, defined at @SDL3\/SDL_stdinc.h 1672:47@
sDL_GetEnvironment :: BG.FunPtr (IO (BG.Ptr SDL_Environment))
sDL_GetEnvironment =
  BG.unsafePerformIO hs_bindgen_9a656c04aab82f9e

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_CreateEnvironment@
foreign import ccall unsafe "hs_bindgen_c0820759e235b8e4"
  hs_bindgen_c0820759e235b8e4_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_CreateEnvironment@
hs_bindgen_c0820759e235b8e4 :: IO (BG.FunPtr (BG.CBool -> IO (BG.Ptr SDL_Environment)))
hs_bindgen_c0820759e235b8e4 =
  BG.fromFFIType hs_bindgen_c0820759e235b8e4_base

{-# NOINLINE sDL_CreateEnvironment #-}

-- | Create a set of environment variables
--
--     [@populated@]: true to initialize it from the C runtime environment, false to create an empty environment.
--
--     [Returns]: a pointer to the new environment or NULL on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: If @populated@ is false, it is safe to call this function from any thread, otherwise it is safe if no other threads are calling setenv() or unsetenv()
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetEnvironmentVariable', 'sDL_GetEnvironmentVariables', 'sDL_SetEnvironmentVariable', 'sDL_UnsetEnvironmentVariable', 'sDL_DestroyEnvironment'
--
--     [C declaration]: @SDL_CreateEnvironment@, defined at @SDL3\/SDL_stdinc.h 1694:47@
sDL_CreateEnvironment :: BG.FunPtr (BG.CBool -> IO (BG.Ptr SDL_Environment))
sDL_CreateEnvironment =
  BG.unsafePerformIO hs_bindgen_c0820759e235b8e4

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_GetEnvironmentVariable@
foreign import ccall unsafe "hs_bindgen_a475668aa4ab4369"
  hs_bindgen_a475668aa4ab4369_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_GetEnvironmentVariable@
hs_bindgen_a475668aa4ab4369
  :: IO
       (BG.FunPtr (BG.Ptr SDL_Environment -> PtrConst.PtrConst BG.CChar -> IO (PtrConst.PtrConst BG.CChar)))
hs_bindgen_a475668aa4ab4369 =
  BG.fromFFIType hs_bindgen_a475668aa4ab4369_base

{-# NOINLINE sDL_GetEnvironmentVariable #-}

-- | Get the value of a variable in the environment.
--
--     [@env@]: the environment to query.
--
--     [@name@]: the name of the variable to get.
--
--     [Returns]: a pointer to the value of the variable or NULL if it can\'t be found.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetEnvironment', 'sDL_CreateEnvironment', 'sDL_GetEnvironmentVariables', 'sDL_SetEnvironmentVariable', 'sDL_UnsetEnvironmentVariable'
--
--     [C declaration]: @SDL_GetEnvironmentVariable@, defined at @SDL3\/SDL_stdinc.h 1714:42@
sDL_GetEnvironmentVariable
  :: BG.FunPtr (BG.Ptr SDL_Environment -> PtrConst.PtrConst BG.CChar -> IO (PtrConst.PtrConst BG.CChar))
sDL_GetEnvironmentVariable =
  BG.unsafePerformIO hs_bindgen_a475668aa4ab4369

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_GetEnvironmentVariables@
foreign import ccall unsafe "hs_bindgen_9fb7038d3656b96c"
  hs_bindgen_9fb7038d3656b96c_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_GetEnvironmentVariables@
hs_bindgen_9fb7038d3656b96c
  :: IO (BG.FunPtr (BG.Ptr SDL_Environment -> IO (BG.Ptr (BG.Ptr BG.CChar))))
hs_bindgen_9fb7038d3656b96c =
  BG.fromFFIType hs_bindgen_9fb7038d3656b96c_base

{-# NOINLINE sDL_GetEnvironmentVariables #-}

-- | Get all variables in the environment.
--
--     [@env@]: the environment to query.
--
--     [Returns]: a NULL terminated array of pointers to environment variables in the form \"variable=value\" or NULL on failure; call SDL_GetError() for more information. This is a single allocation that should be freed with @SDL_free()@ when it is no longer needed.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetEnvironment', 'sDL_CreateEnvironment', 'sDL_GetEnvironmentVariables', 'sDL_SetEnvironmentVariable', 'sDL_UnsetEnvironmentVariable'
--
--     [C declaration]: @SDL_GetEnvironmentVariables@, defined at @SDL3\/SDL_stdinc.h 1735:37@
sDL_GetEnvironmentVariables :: BG.FunPtr (BG.Ptr SDL_Environment -> IO (BG.Ptr (BG.Ptr BG.CChar)))
sDL_GetEnvironmentVariables =
  BG.unsafePerformIO hs_bindgen_9fb7038d3656b96c

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_SetEnvironmentVariable@
foreign import ccall unsafe "hs_bindgen_a99329e2f1a82258"
  hs_bindgen_a99329e2f1a82258_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_SetEnvironmentVariable@
hs_bindgen_a99329e2f1a82258
  :: IO
       ( BG.FunPtr
           ( BG.Ptr SDL_Environment
             -> PtrConst.PtrConst BG.CChar
             -> PtrConst.PtrConst BG.CChar
             -> BG.CBool
             -> IO BG.CBool
           )
       )
hs_bindgen_a99329e2f1a82258 =
  BG.fromFFIType hs_bindgen_a99329e2f1a82258_base

{-# NOINLINE sDL_SetEnvironmentVariable #-}

-- | Set the value of a variable in the environment.
--
--     [@env@]: the environment to modify.
--
--     [@name@]: the name of the variable to set.
--
--     [@value@]: the value of the variable to set.
--
--     [@overwrite@]: true to overwrite the variable if it exists, false to return success without setting the variable if it already exists.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetEnvironment', 'sDL_CreateEnvironment', 'sDL_GetEnvironmentVariable', 'sDL_GetEnvironmentVariables', 'sDL_UnsetEnvironmentVariable'
--
--     [C declaration]: @SDL_SetEnvironmentVariable@, defined at @SDL3\/SDL_stdinc.h 1759:34@
sDL_SetEnvironmentVariable
  :: BG.FunPtr
       ( BG.Ptr SDL_Environment
         -> PtrConst.PtrConst BG.CChar
         -> PtrConst.PtrConst BG.CChar
         -> BG.CBool
         -> IO BG.CBool
       )
sDL_SetEnvironmentVariable =
  BG.unsafePerformIO hs_bindgen_a99329e2f1a82258

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_UnsetEnvironmentVariable@
foreign import ccall unsafe "hs_bindgen_c6a62ea65fc9d622"
  hs_bindgen_c6a62ea65fc9d622_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_UnsetEnvironmentVariable@
hs_bindgen_c6a62ea65fc9d622
  :: IO (BG.FunPtr (BG.Ptr SDL_Environment -> PtrConst.PtrConst BG.CChar -> IO BG.CBool))
hs_bindgen_c6a62ea65fc9d622 =
  BG.fromFFIType hs_bindgen_c6a62ea65fc9d622_base

{-# NOINLINE sDL_UnsetEnvironmentVariable #-}

-- | Clear a variable from the environment.
--
--     [@env@]: the environment to modify.
--
--     [@name@]: the name of the variable to unset.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetEnvironment', 'sDL_CreateEnvironment', 'sDL_GetEnvironmentVariable', 'sDL_GetEnvironmentVariables', 'sDL_SetEnvironmentVariable', 'sDL_UnsetEnvironmentVariable'
--
--     [C declaration]: @SDL_UnsetEnvironmentVariable@, defined at @SDL3\/SDL_stdinc.h 1780:34@
sDL_UnsetEnvironmentVariable
  :: BG.FunPtr (BG.Ptr SDL_Environment -> PtrConst.PtrConst BG.CChar -> IO BG.CBool)
sDL_UnsetEnvironmentVariable =
  BG.unsafePerformIO hs_bindgen_c6a62ea65fc9d622

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_DestroyEnvironment@
foreign import ccall unsafe "hs_bindgen_e750bb904f747388"
  hs_bindgen_e750bb904f747388_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_DestroyEnvironment@
hs_bindgen_e750bb904f747388 :: IO (BG.FunPtr (BG.Ptr SDL_Environment -> IO ()))
hs_bindgen_e750bb904f747388 =
  BG.fromFFIType hs_bindgen_e750bb904f747388_base

{-# NOINLINE sDL_DestroyEnvironment #-}

-- | Destroy a set of environment variables.
--
--     [@env@]: the environment to destroy.
--
--     [Thread safety]: It is safe to call this function from any thread, as long as the environment is no longer in use.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_CreateEnvironment'
--
--     [C declaration]: @SDL_DestroyEnvironment@, defined at @SDL3\/SDL_stdinc.h 1794:34@
sDL_DestroyEnvironment :: BG.FunPtr (BG.Ptr SDL_Environment -> IO ())
sDL_DestroyEnvironment =
  BG.unsafePerformIO hs_bindgen_e750bb904f747388

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_getenv@
foreign import ccall unsafe "hs_bindgen_b563cf6799d5c876"
  hs_bindgen_b563cf6799d5c876_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_getenv@
hs_bindgen_b563cf6799d5c876
  :: IO (BG.FunPtr (PtrConst.PtrConst BG.CChar -> IO (PtrConst.PtrConst BG.CChar)))
hs_bindgen_b563cf6799d5c876 =
  BG.fromFFIType hs_bindgen_b563cf6799d5c876_base

{-# NOINLINE sDL_getenv #-}

-- | Get the value of a variable in the environment.
--
--     This function uses SDL\'s cached copy of the environment and is thread-safe.
--
--     [@name@]: the name of the variable to get.
--
--     [Returns]: a pointer to the value of the variable or NULL if it can\'t be found.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_getenv@, defined at @SDL3\/SDL_stdinc.h 1809:42@
sDL_getenv :: BG.FunPtr (PtrConst.PtrConst BG.CChar -> IO (PtrConst.PtrConst BG.CChar))
sDL_getenv =
  BG.unsafePerformIO hs_bindgen_b563cf6799d5c876

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_getenv_unsafe@
foreign import ccall unsafe "hs_bindgen_e6077a375be5ae63"
  hs_bindgen_e6077a375be5ae63_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_getenv_unsafe@
hs_bindgen_e6077a375be5ae63
  :: IO (BG.FunPtr (PtrConst.PtrConst BG.CChar -> IO (PtrConst.PtrConst BG.CChar)))
hs_bindgen_e6077a375be5ae63 =
  BG.fromFFIType hs_bindgen_e6077a375be5ae63_base

{-# NOINLINE sDL_getenv_unsafe #-}

-- | Get the value of a variable in the environment.
--
--     This function bypasses SDL\'s cached copy of the environment and is not thread-safe.
--
--     [@name@]: the name of the variable to get.
--
--     [Returns]: a pointer to the value of the variable or NULL if it can\'t be found.
--
--     [Thread safety]: This function is not thread safe, consider using @SDL_getenv()@ instead.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_getenv'
--
--     [C declaration]: @SDL_getenv_unsafe@, defined at @SDL3\/SDL_stdinc.h 1828:42@
sDL_getenv_unsafe :: BG.FunPtr (PtrConst.PtrConst BG.CChar -> IO (PtrConst.PtrConst BG.CChar))
sDL_getenv_unsafe =
  BG.unsafePerformIO hs_bindgen_e6077a375be5ae63

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_setenv_unsafe@
foreign import ccall unsafe "hs_bindgen_aaf5efc0afa93f4f"
  hs_bindgen_aaf5efc0afa93f4f_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_setenv_unsafe@
hs_bindgen_aaf5efc0afa93f4f
  :: IO (BG.FunPtr (PtrConst.PtrConst BG.CChar -> PtrConst.PtrConst BG.CChar -> BG.CInt -> IO BG.CInt))
hs_bindgen_aaf5efc0afa93f4f =
  BG.fromFFIType hs_bindgen_aaf5efc0afa93f4f_base

{-# NOINLINE sDL_setenv_unsafe #-}

-- | Set the value of a variable in the environment.
--
--     [@name@]: the name of the variable to set.
--
--     [@value@]: the value of the variable to set.
--
--     [@overwrite@]: 1 to overwrite the variable if it exists, 0 to return success without setting the variable if it already exists.
--
--     [Returns]: 0 on success, -1 on error.
--
--     [Thread safety]: This function is not thread safe, consider using @SDL_SetEnvironmentVariable()@ instead.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_SetEnvironmentVariable'
--
--     [C declaration]: @SDL_setenv_unsafe@, defined at @SDL3\/SDL_stdinc.h 1846:33@
sDL_setenv_unsafe
  :: BG.FunPtr (PtrConst.PtrConst BG.CChar -> PtrConst.PtrConst BG.CChar -> BG.CInt -> IO BG.CInt)
sDL_setenv_unsafe =
  BG.unsafePerformIO hs_bindgen_aaf5efc0afa93f4f

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_unsetenv_unsafe@
foreign import ccall unsafe "hs_bindgen_519fb9e8ee876013"
  hs_bindgen_519fb9e8ee876013_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_unsetenv_unsafe@
hs_bindgen_519fb9e8ee876013 :: IO (BG.FunPtr (PtrConst.PtrConst BG.CChar -> IO BG.CInt))
hs_bindgen_519fb9e8ee876013 =
  BG.fromFFIType hs_bindgen_519fb9e8ee876013_base

{-# NOINLINE sDL_unsetenv_unsafe #-}

-- | Clear a variable from the environment.
--
--     [@name@]: the name of the variable to unset.
--
--     [Returns]: 0 on success, -1 on error.
--
--     [Thread safety]: This function is not thread safe, consider using @SDL_UnsetEnvironmentVariable()@ instead.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_UnsetEnvironmentVariable'
--
--     [C declaration]: @SDL_unsetenv_unsafe@, defined at @SDL3\/SDL_stdinc.h 1861:33@
sDL_unsetenv_unsafe :: BG.FunPtr (PtrConst.PtrConst BG.CChar -> IO BG.CInt)
sDL_unsetenv_unsafe =
  BG.unsafePerformIO hs_bindgen_519fb9e8ee876013

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_qsort@
foreign import ccall unsafe "hs_bindgen_fd5cea92e3ba7b16"
  hs_bindgen_fd5cea92e3ba7b16_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_qsort@
hs_bindgen_fd5cea92e3ba7b16
  :: IO
       ( BG.FunPtr
           ( BG.Ptr BG.Void
             -> HsBindgen.Runtime.LibC.CSize
             -> HsBindgen.Runtime.LibC.CSize
             -> SDL_CompareCallback
             -> IO ()
           )
       )
hs_bindgen_fd5cea92e3ba7b16 =
  BG.fromFFIType hs_bindgen_fd5cea92e3ba7b16_base

{-# NOINLINE sDL_qsort #-}

-- | Sort an array.
--
--     For example:
--
--     @
--     typedef struct {
--         int key;
--         const char *string;
--     } data;
--
--     int SDLCALL compare(const void *a, const void *b)
--     {
--         const data *A = (const data *)a;
--         const data *B = (const data *)b;
--
--         if (A->n \< B->n) {
--             return -1;
--         } else if (B->n \< A->n) {
--             return 1;
--         } else {
--             return 0;
--         }
--     }
--
--     data values[] = {
--         { 3, \"third\" }, { 1, \"first\" }, { 2, \"second\" }
--     };
--
--     SDL_qsort(values, SDL_arraysize(values), sizeof(values[0]), compare);
--     @
--
--     [@base@]: a pointer to the start of the array.
--
--     [@nmemb@]: the number of elements in the array.
--
--     [@size@]: the size of the elements in the array.
--
--     [@compare@]: a function used to compare elements in the array.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_bsearch', 'sDL_qsort_r'
--
--     [C declaration]: @SDL_qsort@, defined at @SDL3\/SDL_stdinc.h 1923:34@
sDL_qsort
  :: BG.FunPtr
       ( BG.Ptr BG.Void
         -> HsBindgen.Runtime.LibC.CSize
         -> HsBindgen.Runtime.LibC.CSize
         -> SDL_CompareCallback
         -> IO ()
       )
sDL_qsort =
  BG.unsafePerformIO hs_bindgen_fd5cea92e3ba7b16

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_bsearch@
foreign import ccall unsafe "hs_bindgen_00f02cc97cc6b9fd"
  hs_bindgen_00f02cc97cc6b9fd_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_bsearch@
hs_bindgen_00f02cc97cc6b9fd
  :: IO
       ( BG.FunPtr
           ( PtrConst.PtrConst BG.Void
             -> PtrConst.PtrConst BG.Void
             -> HsBindgen.Runtime.LibC.CSize
             -> HsBindgen.Runtime.LibC.CSize
             -> SDL_CompareCallback
             -> IO (BG.Ptr BG.Void)
           )
       )
hs_bindgen_00f02cc97cc6b9fd =
  BG.fromFFIType hs_bindgen_00f02cc97cc6b9fd_base

{-# NOINLINE sDL_bsearch #-}

-- | Perform a binary search on a previously sorted array.
--
--     For example:
--
--     @
--     typedef struct {
--         int key;
--         const char *string;
--     } data;
--
--     int SDLCALL compare(const void *a, const void *b)
--     {
--         const data *A = (const data *)a;
--         const data *B = (const data *)b;
--
--         if (A->n \< B->n) {
--             return -1;
--         } else if (B->n \< A->n) {
--             return 1;
--         } else {
--             return 0;
--         }
--     }
--
--     data values[] = {
--         { 1, \"first\" }, { 2, \"second\" }, { 3, \"third\" }
--     };
--     data key = { 2, NULL };
--
--     data *result = SDL_bsearch(&key, values, SDL_arraysize(values), sizeof(values[0]), compare);
--     @
--
--     [@key@]: a pointer to a key equal to the element being searched for.
--
--     [@base@]: a pointer to the start of the array.
--
--     [@nmemb@]: the number of elements in the array.
--
--     [@size@]: the size of the elements in the array.
--
--     [@compare@]: a function used to compare elements in the array.
--
--     [Returns]: a pointer to the matching element in the array, or NULL if not found.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_bsearch_r', 'sDL_qsort'
--
--     [C declaration]: @SDL_bsearch@, defined at @SDL3\/SDL_stdinc.h 1973:36@
sDL_bsearch
  :: BG.FunPtr
       ( PtrConst.PtrConst BG.Void
         -> PtrConst.PtrConst BG.Void
         -> HsBindgen.Runtime.LibC.CSize
         -> HsBindgen.Runtime.LibC.CSize
         -> SDL_CompareCallback
         -> IO (BG.Ptr BG.Void)
       )
sDL_bsearch =
  BG.unsafePerformIO hs_bindgen_00f02cc97cc6b9fd

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_qsort_r@
foreign import ccall unsafe "hs_bindgen_271b6eff10a288b3"
  hs_bindgen_271b6eff10a288b3_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_qsort_r@
hs_bindgen_271b6eff10a288b3
  :: IO
       ( BG.FunPtr
           ( BG.Ptr BG.Void
             -> HsBindgen.Runtime.LibC.CSize
             -> HsBindgen.Runtime.LibC.CSize
             -> SDL_CompareCallback_r
             -> BG.Ptr BG.Void
             -> IO ()
           )
       )
hs_bindgen_271b6eff10a288b3 =
  BG.fromFFIType hs_bindgen_271b6eff10a288b3_base

{-# NOINLINE sDL_qsort_r #-}

-- | Sort an array, passing a userdata pointer to the compare function.
--
--     For example:
--
--     @
--     typedef enum {
--         sort_increasing,
--         sort_decreasing,
--     } sort_method;
--
--     typedef struct {
--         int key;
--         const char *string;
--     } data;
--
--     int SDLCALL compare(const void *userdata, const void *a, const void *b)
--     {
--         sort_method method = (sort_method)(uintptr_t)userdata;
--         const data *A = (const data *)a;
--         const data *B = (const data *)b;
--
--         if (A->key \< B->key) {
--             return (method == sort_increasing) ? -1 : 1;
--         } else if (B->key \< A->key) {
--             return (method == sort_increasing) ? 1 : -1;
--         } else {
--             return 0;
--         }
--     }
--
--     data values[] = {
--         { 3, \"third\" }, { 1, \"first\" }, { 2, \"second\" }
--     };
--
--     SDL_qsort_r(values, SDL_arraysize(values), sizeof(values[0]), compare, (const void *)(uintptr_t)sort_increasing);
--     @
--
--     [@base@]: a pointer to the start of the array.
--
--     [@nmemb@]: the number of elements in the array.
--
--     [@size@]: the size of the elements in the array.
--
--     [@compare@]: a function used to compare elements in the array.
--
--     [@userdata@]: a pointer to pass to the compare function.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_bsearch_r', 'sDL_qsort'
--
--     [C declaration]: @SDL_qsort_r@, defined at @SDL3\/SDL_stdinc.h 2043:34@
sDL_qsort_r
  :: BG.FunPtr
       ( BG.Ptr BG.Void
         -> HsBindgen.Runtime.LibC.CSize
         -> HsBindgen.Runtime.LibC.CSize
         -> SDL_CompareCallback_r
         -> BG.Ptr BG.Void
         -> IO ()
       )
sDL_qsort_r =
  BG.unsafePerformIO hs_bindgen_271b6eff10a288b3

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_bsearch_r@
foreign import ccall unsafe "hs_bindgen_39f0a8a8445979b1"
  hs_bindgen_39f0a8a8445979b1_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_bsearch_r@
hs_bindgen_39f0a8a8445979b1
  :: IO
       ( BG.FunPtr
           ( PtrConst.PtrConst BG.Void
             -> PtrConst.PtrConst BG.Void
             -> HsBindgen.Runtime.LibC.CSize
             -> HsBindgen.Runtime.LibC.CSize
             -> SDL_CompareCallback_r
             -> BG.Ptr BG.Void
             -> IO (BG.Ptr BG.Void)
           )
       )
hs_bindgen_39f0a8a8445979b1 =
  BG.fromFFIType hs_bindgen_39f0a8a8445979b1_base

{-# NOINLINE sDL_bsearch_r #-}

-- | Perform a binary search on a previously sorted array, passing a userdata pointer to the compare function.
--
--     For example:
--
--     @
--     typedef enum {
--         sort_increasing,
--         sort_decreasing,
--     } sort_method;
--
--     typedef struct {
--         int key;
--         const char *string;
--     } data;
--
--     int SDLCALL compare(const void *userdata, const void *a, const void *b)
--     {
--         sort_method method = (sort_method)(uintptr_t)userdata;
--         const data *A = (const data *)a;
--         const data *B = (const data *)b;
--
--         if (A->key \< B->key) {
--             return (method == sort_increasing) ? -1 : 1;
--         } else if (B->key \< A->key) {
--             return (method == sort_increasing) ? 1 : -1;
--         } else {
--             return 0;
--         }
--     }
--
--     data values[] = {
--         { 1, \"first\" }, { 2, \"second\" }, { 3, \"third\" }
--     };
--     data key = { 2, NULL };
--
--     data *result = SDL_bsearch_r(&key, values, SDL_arraysize(values), sizeof(values[0]), compare, (const void *)(uintptr_t)sort_increasing);
--     @
--
--     [@key@]: a pointer to a key equal to the element being searched for.
--
--     [@base@]: a pointer to the start of the array.
--
--     [@nmemb@]: the number of elements in the array.
--
--     [@size@]: the size of the elements in the array.
--
--     [@compare@]: a function used to compare elements in the array.
--
--     [@userdata@]: a pointer to pass to the compare function.
--
--     [Returns]: a pointer to the matching element in the array, or NULL if not found.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_bsearch', 'sDL_qsort_r'
--
--     [C declaration]: @SDL_bsearch_r@, defined at @SDL3\/SDL_stdinc.h 2101:36@
sDL_bsearch_r
  :: BG.FunPtr
       ( PtrConst.PtrConst BG.Void
         -> PtrConst.PtrConst BG.Void
         -> HsBindgen.Runtime.LibC.CSize
         -> HsBindgen.Runtime.LibC.CSize
         -> SDL_CompareCallback_r
         -> BG.Ptr BG.Void
         -> IO (BG.Ptr BG.Void)
       )
sDL_bsearch_r =
  BG.unsafePerformIO hs_bindgen_39f0a8a8445979b1

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_abs@
foreign import ccall unsafe "hs_bindgen_955d92475ad359d8"
  hs_bindgen_955d92475ad359d8_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_abs@
hs_bindgen_955d92475ad359d8 :: IO (BG.FunPtr (BG.CInt -> IO BG.CInt))
hs_bindgen_955d92475ad359d8 =
  BG.fromFFIType hs_bindgen_955d92475ad359d8_base

{-# NOINLINE sDL_abs #-}

-- | Compute the absolute value of @x@.
--
--     [@x@]: an integer value.
--
--     [Returns]: the absolute value of x.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_abs@, defined at @SDL3\/SDL_stdinc.h 2113:33@
sDL_abs :: BG.FunPtr (BG.CInt -> IO BG.CInt)
sDL_abs =
  BG.unsafePerformIO hs_bindgen_955d92475ad359d8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_isalpha@
foreign import ccall unsafe "hs_bindgen_8e8018b5d5d8d98f"
  hs_bindgen_8e8018b5d5d8d98f_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_isalpha@
hs_bindgen_8e8018b5d5d8d98f :: IO (BG.FunPtr (BG.CInt -> IO BG.CInt))
hs_bindgen_8e8018b5d5d8d98f =
  BG.fromFFIType hs_bindgen_8e8018b5d5d8d98f_base

{-# NOINLINE sDL_isalpha #-}

-- | Query if a character is alphabetic (a letter).
--
--     __WARNING__: Regardless of system locale, this will only treat ASCII values for English \'a-z\' and \'A-Z\' as true.
--
--     [@x@]: character value to check.
--
--     [Returns]: non-zero if x falls within the character class, zero otherwise.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_isalpha@, defined at @SDL3\/SDL_stdinc.h 2188:33@
sDL_isalpha :: BG.FunPtr (BG.CInt -> IO BG.CInt)
sDL_isalpha =
  BG.unsafePerformIO hs_bindgen_8e8018b5d5d8d98f

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_isalnum@
foreign import ccall unsafe "hs_bindgen_a52d45d106787b27"
  hs_bindgen_a52d45d106787b27_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_isalnum@
hs_bindgen_a52d45d106787b27 :: IO (BG.FunPtr (BG.CInt -> IO BG.CInt))
hs_bindgen_a52d45d106787b27 =
  BG.fromFFIType hs_bindgen_a52d45d106787b27_base

{-# NOINLINE sDL_isalnum #-}

-- | Query if a character is alphabetic (a letter) or a number.
--
--     __WARNING__: Regardless of system locale, this will only treat ASCII values for English \'a-z\', \'A-Z\', and \'0-9\' as true.
--
--     [@x@]: character value to check.
--
--     [Returns]: non-zero if x falls within the character class, zero otherwise.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_isalnum@, defined at @SDL3\/SDL_stdinc.h 2203:33@
sDL_isalnum :: BG.FunPtr (BG.CInt -> IO BG.CInt)
sDL_isalnum =
  BG.unsafePerformIO hs_bindgen_a52d45d106787b27

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_isblank@
foreign import ccall unsafe "hs_bindgen_0c075721ec100ff5"
  hs_bindgen_0c075721ec100ff5_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_isblank@
hs_bindgen_0c075721ec100ff5 :: IO (BG.FunPtr (BG.CInt -> IO BG.CInt))
hs_bindgen_0c075721ec100ff5 =
  BG.fromFFIType hs_bindgen_0c075721ec100ff5_base

{-# NOINLINE sDL_isblank #-}

-- | Report if a character is blank (a space or tab).
--
--     __WARNING__: Regardless of system locale, this will only treat ASCII values 0x20 (space) or 0x9 (tab) as true.
--
--     [@x@]: character value to check.
--
--     [Returns]: non-zero if x falls within the character class, zero otherwise.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_isblank@, defined at @SDL3\/SDL_stdinc.h 2218:33@
sDL_isblank :: BG.FunPtr (BG.CInt -> IO BG.CInt)
sDL_isblank =
  BG.unsafePerformIO hs_bindgen_0c075721ec100ff5

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_iscntrl@
foreign import ccall unsafe "hs_bindgen_de902558496e469f"
  hs_bindgen_de902558496e469f_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_iscntrl@
hs_bindgen_de902558496e469f :: IO (BG.FunPtr (BG.CInt -> IO BG.CInt))
hs_bindgen_de902558496e469f =
  BG.fromFFIType hs_bindgen_de902558496e469f_base

{-# NOINLINE sDL_iscntrl #-}

-- | Report if a character is a control character.
--
--     __WARNING__: Regardless of system locale, this will only treat ASCII values 0 through 0x1F, and 0x7F, as true.
--
--     [@x@]: character value to check.
--
--     [Returns]: non-zero if x falls within the character class, zero otherwise.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_iscntrl@, defined at @SDL3\/SDL_stdinc.h 2233:33@
sDL_iscntrl :: BG.FunPtr (BG.CInt -> IO BG.CInt)
sDL_iscntrl =
  BG.unsafePerformIO hs_bindgen_de902558496e469f

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_isdigit@
foreign import ccall unsafe "hs_bindgen_61af141b860ceb41"
  hs_bindgen_61af141b860ceb41_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_isdigit@
hs_bindgen_61af141b860ceb41 :: IO (BG.FunPtr (BG.CInt -> IO BG.CInt))
hs_bindgen_61af141b860ceb41 =
  BG.fromFFIType hs_bindgen_61af141b860ceb41_base

{-# NOINLINE sDL_isdigit #-}

-- | Report if a character is a numeric digit.
--
--     __WARNING__: Regardless of system locale, this will only treat ASCII values \'0\' (0x30) through \'9\' (0x39), as true.
--
--     [@x@]: character value to check.
--
--     [Returns]: non-zero if x falls within the character class, zero otherwise.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_isdigit@, defined at @SDL3\/SDL_stdinc.h 2248:33@
sDL_isdigit :: BG.FunPtr (BG.CInt -> IO BG.CInt)
sDL_isdigit =
  BG.unsafePerformIO hs_bindgen_61af141b860ceb41

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_isxdigit@
foreign import ccall unsafe "hs_bindgen_c17beb32f0f1fd52"
  hs_bindgen_c17beb32f0f1fd52_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_isxdigit@
hs_bindgen_c17beb32f0f1fd52 :: IO (BG.FunPtr (BG.CInt -> IO BG.CInt))
hs_bindgen_c17beb32f0f1fd52 =
  BG.fromFFIType hs_bindgen_c17beb32f0f1fd52_base

{-# NOINLINE sDL_isxdigit #-}

-- | Report if a character is a hexadecimal digit.
--
--     __WARNING__: Regardless of system locale, this will only treat ASCII values \'A\' through \'F\', \'a\' through \'f\', and \'0\' through \'9\', as true.
--
--     [@x@]: character value to check.
--
--     [Returns]: non-zero if x falls within the character class, zero otherwise.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_isxdigit@, defined at @SDL3\/SDL_stdinc.h 2263:33@
sDL_isxdigit :: BG.FunPtr (BG.CInt -> IO BG.CInt)
sDL_isxdigit =
  BG.unsafePerformIO hs_bindgen_c17beb32f0f1fd52

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_ispunct@
foreign import ccall unsafe "hs_bindgen_a88a9667ca4e8aa7"
  hs_bindgen_a88a9667ca4e8aa7_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_ispunct@
hs_bindgen_a88a9667ca4e8aa7 :: IO (BG.FunPtr (BG.CInt -> IO BG.CInt))
hs_bindgen_a88a9667ca4e8aa7 =
  BG.fromFFIType hs_bindgen_a88a9667ca4e8aa7_base

{-# NOINLINE sDL_ispunct #-}

-- | Report if a character is a punctuation mark.
--
--     __WARNING__: Regardless of system locale, this is equivalent to @((SDL_isgraph(x)) && (!SDL_isalnum(x)))@.
--
--     [@x@]: character value to check.
--
--     [Returns]: non-zero if x falls within the character class, zero otherwise.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_isgraph', 'sDL_isalnum'
--
--     [C declaration]: @SDL_ispunct@, defined at @SDL3\/SDL_stdinc.h 2281:33@
sDL_ispunct :: BG.FunPtr (BG.CInt -> IO BG.CInt)
sDL_ispunct =
  BG.unsafePerformIO hs_bindgen_a88a9667ca4e8aa7

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_isspace@
foreign import ccall unsafe "hs_bindgen_02457e0c40d5e057"
  hs_bindgen_02457e0c40d5e057_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_isspace@
hs_bindgen_02457e0c40d5e057 :: IO (BG.FunPtr (BG.CInt -> IO BG.CInt))
hs_bindgen_02457e0c40d5e057 =
  BG.fromFFIType hs_bindgen_02457e0c40d5e057_base

{-# NOINLINE sDL_isspace #-}

-- | Report if a character is whitespace.
--
--     __WARNING__: Regardless of system locale, this will only treat the following ASCII values as true:
--
--     * space (0x20)
--
--     * tab (0x09)
--
--     * newline (0x0A)
--
--     * vertical tab (0x0B)
--
--     * form feed (0x0C)
--
--     * return (0x0D)
--
--     [@x@]: character value to check.
--
--     [Returns]: non-zero if x falls within the character class, zero otherwise.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_isspace@, defined at @SDL3\/SDL_stdinc.h 2303:33@
sDL_isspace :: BG.FunPtr (BG.CInt -> IO BG.CInt)
sDL_isspace =
  BG.unsafePerformIO hs_bindgen_02457e0c40d5e057

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_isupper@
foreign import ccall unsafe "hs_bindgen_0f55cc5ba611a3f2"
  hs_bindgen_0f55cc5ba611a3f2_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_isupper@
hs_bindgen_0f55cc5ba611a3f2 :: IO (BG.FunPtr (BG.CInt -> IO BG.CInt))
hs_bindgen_0f55cc5ba611a3f2 =
  BG.fromFFIType hs_bindgen_0f55cc5ba611a3f2_base

{-# NOINLINE sDL_isupper #-}

-- | Report if a character is upper case.
--
--     __WARNING__: Regardless of system locale, this will only treat ASCII values \'A\' through \'Z\' as true.
--
--     [@x@]: character value to check.
--
--     [Returns]: non-zero if x falls within the character class, zero otherwise.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_isupper@, defined at @SDL3\/SDL_stdinc.h 2318:33@
sDL_isupper :: BG.FunPtr (BG.CInt -> IO BG.CInt)
sDL_isupper =
  BG.unsafePerformIO hs_bindgen_0f55cc5ba611a3f2

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_islower@
foreign import ccall unsafe "hs_bindgen_f681ed21a8e1349a"
  hs_bindgen_f681ed21a8e1349a_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_islower@
hs_bindgen_f681ed21a8e1349a :: IO (BG.FunPtr (BG.CInt -> IO BG.CInt))
hs_bindgen_f681ed21a8e1349a =
  BG.fromFFIType hs_bindgen_f681ed21a8e1349a_base

{-# NOINLINE sDL_islower #-}

-- | Report if a character is lower case.
--
--     __WARNING__: Regardless of system locale, this will only treat ASCII values \'a\' through \'z\' as true.
--
--     [@x@]: character value to check.
--
--     [Returns]: non-zero if x falls within the character class, zero otherwise.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_islower@, defined at @SDL3\/SDL_stdinc.h 2333:33@
sDL_islower :: BG.FunPtr (BG.CInt -> IO BG.CInt)
sDL_islower =
  BG.unsafePerformIO hs_bindgen_f681ed21a8e1349a

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_isprint@
foreign import ccall unsafe "hs_bindgen_991fe49732021ccb"
  hs_bindgen_991fe49732021ccb_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_isprint@
hs_bindgen_991fe49732021ccb :: IO (BG.FunPtr (BG.CInt -> IO BG.CInt))
hs_bindgen_991fe49732021ccb =
  BG.fromFFIType hs_bindgen_991fe49732021ccb_base

{-# NOINLINE sDL_isprint #-}

-- | Report if a character is \"printable\".
--
--     Be advised that \"printable\" has a definition that goes back to text terminals from the dawn of computing, making this a sort of special case function that is not suitable for Unicode (or most any) text management.
--
--     __WARNING__: Regardless of system locale, this will only treat ASCII values \' \' (0x20) through \'~\' (0x7E) as true.
--
--     [@x@]: character value to check.
--
--     [Returns]: non-zero if x falls within the character class, zero otherwise.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_isprint@, defined at @SDL3\/SDL_stdinc.h 2352:33@
sDL_isprint :: BG.FunPtr (BG.CInt -> IO BG.CInt)
sDL_isprint =
  BG.unsafePerformIO hs_bindgen_991fe49732021ccb

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_isgraph@
foreign import ccall unsafe "hs_bindgen_192487d885c8ab5a"
  hs_bindgen_192487d885c8ab5a_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_isgraph@
hs_bindgen_192487d885c8ab5a :: IO (BG.FunPtr (BG.CInt -> IO BG.CInt))
hs_bindgen_192487d885c8ab5a =
  BG.fromFFIType hs_bindgen_192487d885c8ab5a_base

{-# NOINLINE sDL_isgraph #-}

-- | Report if a character is any \"printable\" except space.
--
--     Be advised that \"printable\" has a definition that goes back to text terminals from the dawn of computing, making this a sort of special case function that is not suitable for Unicode (or most any) text management.
--
--     __WARNING__: Regardless of system locale, this is equivalent to @(SDL_isprint(x)) && ((x) != \' \')@.
--
--     [@x@]: character value to check.
--
--     [Returns]: non-zero if x falls within the character class, zero otherwise.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_isprint'
--
--     [C declaration]: @SDL_isgraph@, defined at @SDL3\/SDL_stdinc.h 2373:33@
sDL_isgraph :: BG.FunPtr (BG.CInt -> IO BG.CInt)
sDL_isgraph =
  BG.unsafePerformIO hs_bindgen_192487d885c8ab5a

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_toupper@
foreign import ccall unsafe "hs_bindgen_ffb5de4d18c52c67"
  hs_bindgen_ffb5de4d18c52c67_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_toupper@
hs_bindgen_ffb5de4d18c52c67 :: IO (BG.FunPtr (BG.CInt -> IO BG.CInt))
hs_bindgen_ffb5de4d18c52c67 =
  BG.fromFFIType hs_bindgen_ffb5de4d18c52c67_base

{-# NOINLINE sDL_toupper #-}

-- | Convert low-ASCII English letters to uppercase.
--
--     __WARNING__: Regardless of system locale, this will only convert ASCII values \'a\' through \'z\' to uppercase.
--
--     This function returns the uppercase equivalent of @x@. If a character cannot be converted, or is already uppercase, this function returns @x@.
--
--     [@x@]: character value to check.
--
--     [Returns]: capitalized version of x, or x if no conversion available.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_toupper@, defined at @SDL3\/SDL_stdinc.h 2391:33@
sDL_toupper :: BG.FunPtr (BG.CInt -> IO BG.CInt)
sDL_toupper =
  BG.unsafePerformIO hs_bindgen_ffb5de4d18c52c67

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_tolower@
foreign import ccall unsafe "hs_bindgen_9f7c4f835baa2ffa"
  hs_bindgen_9f7c4f835baa2ffa_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_tolower@
hs_bindgen_9f7c4f835baa2ffa :: IO (BG.FunPtr (BG.CInt -> IO BG.CInt))
hs_bindgen_9f7c4f835baa2ffa =
  BG.fromFFIType hs_bindgen_9f7c4f835baa2ffa_base

{-# NOINLINE sDL_tolower #-}

-- | Convert low-ASCII English letters to lowercase.
--
--     __WARNING__: Regardless of system locale, this will only convert ASCII values \'A\' through \'Z\' to lowercase.
--
--     This function returns the lowercase equivalent of @x@. If a character cannot be converted, or is already lowercase, this function returns @x@.
--
--     [@x@]: character value to check.
--
--     [Returns]: lowercase version of x, or x if no conversion available.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_tolower@, defined at @SDL3\/SDL_stdinc.h 2409:33@
sDL_tolower :: BG.FunPtr (BG.CInt -> IO BG.CInt)
sDL_tolower =
  BG.unsafePerformIO hs_bindgen_9f7c4f835baa2ffa

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_crc16@
foreign import ccall unsafe "hs_bindgen_a900454baab74e94"
  hs_bindgen_a900454baab74e94_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_crc16@
hs_bindgen_a900454baab74e94
  :: IO (BG.FunPtr (Uint16 -> PtrConst.PtrConst BG.Void -> HsBindgen.Runtime.LibC.CSize -> IO Uint16))
hs_bindgen_a900454baab74e94 =
  BG.fromFFIType hs_bindgen_a900454baab74e94_base

{-# NOINLINE sDL_crc16 #-}

-- | Calculate a CRC-16 value.
--
--     [https:\/\/en.wikipedia.org\/wiki\/Cyclic_redundancy_check](https://en.wikipedia.org/wiki/Cyclic_redundancy_check)
--
--     This function can be called multiple times, to stream data to be checksummed in blocks. Each call must provide the previous CRC-16 return value to be updated with the next block. The first call to this function for a set of blocks should pass in a zero CRC value.
--
--     [@crc@]: the current checksum for this data set, or 0 for a new data set.
--
--     [@data@]: a new block of data to add to the checksum.
--
--     [@len@]: the size, in bytes, of the new block of data.
--
--     [Returns]: a CRC-16 checksum value of all blocks in the data set.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_crc16@, defined at @SDL3\/SDL_stdinc.h 2430:36@
sDL_crc16
  :: BG.FunPtr (Uint16 -> PtrConst.PtrConst BG.Void -> HsBindgen.Runtime.LibC.CSize -> IO Uint16)
sDL_crc16 =
  BG.unsafePerformIO hs_bindgen_a900454baab74e94

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_crc32@
foreign import ccall unsafe "hs_bindgen_ce720b59f82b140a"
  hs_bindgen_ce720b59f82b140a_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_crc32@
hs_bindgen_ce720b59f82b140a
  :: IO (BG.FunPtr (Uint32 -> PtrConst.PtrConst BG.Void -> HsBindgen.Runtime.LibC.CSize -> IO Uint32))
hs_bindgen_ce720b59f82b140a =
  BG.fromFFIType hs_bindgen_ce720b59f82b140a_base

{-# NOINLINE sDL_crc32 #-}

-- | Calculate a CRC-32 value.
--
--     [https:\/\/en.wikipedia.org\/wiki\/Cyclic_redundancy_check](https://en.wikipedia.org/wiki/Cyclic_redundancy_check)
--
--     This function can be called multiple times, to stream data to be checksummed in blocks. Each call must provide the previous CRC-32 return value to be updated with the next block. The first call to this function for a set of blocks should pass in a zero CRC value.
--
--     [@crc@]: the current checksum for this data set, or 0 for a new data set.
--
--     [@data@]: a new block of data to add to the checksum.
--
--     [@len@]: the size, in bytes, of the new block of data.
--
--     [Returns]: a CRC-32 checksum value of all blocks in the data set.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_crc32@, defined at @SDL3\/SDL_stdinc.h 2451:36@
sDL_crc32
  :: BG.FunPtr (Uint32 -> PtrConst.PtrConst BG.Void -> HsBindgen.Runtime.LibC.CSize -> IO Uint32)
sDL_crc32 =
  BG.unsafePerformIO hs_bindgen_ce720b59f82b140a

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_murmur3_32@
foreign import ccall unsafe "hs_bindgen_fe133a77578cb1aa"
  hs_bindgen_fe133a77578cb1aa_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_murmur3_32@
hs_bindgen_fe133a77578cb1aa
  :: IO (BG.FunPtr (PtrConst.PtrConst BG.Void -> HsBindgen.Runtime.LibC.CSize -> Uint32 -> IO Uint32))
hs_bindgen_fe133a77578cb1aa =
  BG.fromFFIType hs_bindgen_fe133a77578cb1aa_base

{-# NOINLINE sDL_murmur3_32 #-}

-- | Calculate a 32-bit MurmurHash3 value for a block of data.
--
--     [https:\/\/en.wikipedia.org\/wiki\/MurmurHash](https://en.wikipedia.org/wiki/MurmurHash)
--
--     A seed may be specified, which changes the final results consistently, but this does not work like SDL_crc16 and SDL_crc32: you can\'t feed a previous result from this function back into itself as the next seed value to calculate a hash in chunks; it won\'t produce the same hash as it would if the same data was provided in a single call.
--
--     If you aren\'t sure what to provide for a seed, zero is fine. Murmur3 is not cryptographically secure, so it shouldn\'t be used for hashing top-secret data.
--
--     [@data@]: the data to be hashed.
--
--     [@len@]: the size of data, in bytes.
--
--     [@seed@]: a value that alters the final hash value.
--
--     [Returns]: a Murmur3 32-bit hash value.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_murmur3_32@, defined at @SDL3\/SDL_stdinc.h 2477:36@
sDL_murmur3_32
  :: BG.FunPtr (PtrConst.PtrConst BG.Void -> HsBindgen.Runtime.LibC.CSize -> Uint32 -> IO Uint32)
sDL_murmur3_32 =
  BG.unsafePerformIO hs_bindgen_fe133a77578cb1aa

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_memset4@
foreign import ccall unsafe "hs_bindgen_45d6fa96a2a35062"
  hs_bindgen_45d6fa96a2a35062_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_memset4@
hs_bindgen_45d6fa96a2a35062
  :: IO (BG.FunPtr (BG.Ptr BG.Void -> Uint32 -> HsBindgen.Runtime.LibC.CSize -> IO (BG.Ptr BG.Void)))
hs_bindgen_45d6fa96a2a35062 =
  BG.fromFFIType hs_bindgen_45d6fa96a2a35062_base

{-# NOINLINE sDL_memset4 #-}

-- | Initialize all 32-bit words of buffer of memory to a specific value.
--
--     This function will set a buffer of @dwords@ 'Uint32' values, pointed to by @dst@, to the value specified in @val@.
--
--     Unlike SDL_memset, this sets 32-bit values, not bytes, so it\'s not limited to a range of 0-255.
--
--     [@dst@]: the destination memory region. Must not be NULL.
--
--     [@val@]: the 'Uint32' value to set.
--
--     [@dwords@]: the number of 'Uint32' values to set in @dst@.
--
--     [Returns]: @dst@.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_memset4@, defined at @SDL3\/SDL_stdinc.h 2601:36@
sDL_memset4
  :: BG.FunPtr (BG.Ptr BG.Void -> Uint32 -> HsBindgen.Runtime.LibC.CSize -> IO (BG.Ptr BG.Void))
sDL_memset4 =
  BG.unsafePerformIO hs_bindgen_45d6fa96a2a35062

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_memcmp@
foreign import ccall unsafe "hs_bindgen_d8af51803c9c5c62"
  hs_bindgen_d8af51803c9c5c62_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_memcmp@
hs_bindgen_d8af51803c9c5c62
  :: IO
       ( BG.FunPtr
           (PtrConst.PtrConst BG.Void -> PtrConst.PtrConst BG.Void -> HsBindgen.Runtime.LibC.CSize -> IO BG.CInt)
       )
hs_bindgen_d8af51803c9c5c62 =
  BG.fromFFIType hs_bindgen_d8af51803c9c5c62_base

{-# NOINLINE sDL_memcmp #-}

-- | Compare two buffers of memory.
--
--     [@s1@]: the first buffer to compare. NULL is not permitted!
--
--     [@s2@]: the second buffer to compare. NULL is not permitted!
--
--     [@len@]: the number of bytes to compare between the buffers.
--
--     [Returns]: less than zero if s1 is \"less than\" s2, greater than zero if s1 is \"greater than\" s2, and zero if the buffers match exactly for @len@ bytes.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_memcmp@, defined at @SDL3\/SDL_stdinc.h 2683:33@
sDL_memcmp
  :: BG.FunPtr
       (PtrConst.PtrConst BG.Void -> PtrConst.PtrConst BG.Void -> HsBindgen.Runtime.LibC.CSize -> IO BG.CInt)
sDL_memcmp =
  BG.unsafePerformIO hs_bindgen_d8af51803c9c5c62

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_wcslen@
foreign import ccall unsafe "hs_bindgen_b1d053429f9e09c3"
  hs_bindgen_b1d053429f9e09c3_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_wcslen@
hs_bindgen_b1d053429f9e09c3
  :: IO (BG.FunPtr (PtrConst.PtrConst HsBindgen.Runtime.LibC.CWchar -> IO HsBindgen.Runtime.LibC.CSize))
hs_bindgen_b1d053429f9e09c3 =
  BG.fromFFIType hs_bindgen_b1d053429f9e09c3_base

{-# NOINLINE sDL_wcslen #-}

-- | This works exactly like wcslen() but doesn\'t require access to a C runtime.
--
--     Counts the number of wchar_t values in @wstr@, excluding the null terminator.
--
--     Like SDL_strlen only counts bytes and not codepoints in a UTF-8 string, this counts wchar_t values in a string, even if the string\'s encoding is of variable width, like UTF-16.
--
--     Also be aware that wchar_t is different sizes on different platforms (4 bytes on Linux, 2 on Windows, etc).
--
--     [@wstr@]: The null-terminated wide string to read. Must not be NULL.
--
--     [Returns]: the length (in wchar_t values, excluding the null terminator) of @wstr@.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_wcsnlen', 'sDL_utf8strlen', 'sDL_utf8strnlen'
--
--     [C declaration]: @SDL_wcslen@, defined at @SDL3\/SDL_stdinc.h 2710:36@
sDL_wcslen
  :: BG.FunPtr (PtrConst.PtrConst HsBindgen.Runtime.LibC.CWchar -> IO HsBindgen.Runtime.LibC.CSize)
sDL_wcslen =
  BG.unsafePerformIO hs_bindgen_b1d053429f9e09c3

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_wcsnlen@
foreign import ccall unsafe "hs_bindgen_ce1645bc94a325e1"
  hs_bindgen_ce1645bc94a325e1_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_wcsnlen@
hs_bindgen_ce1645bc94a325e1
  :: IO
       ( BG.FunPtr
           ( PtrConst.PtrConst HsBindgen.Runtime.LibC.CWchar
             -> HsBindgen.Runtime.LibC.CSize
             -> IO HsBindgen.Runtime.LibC.CSize
           )
       )
hs_bindgen_ce1645bc94a325e1 =
  BG.fromFFIType hs_bindgen_ce1645bc94a325e1_base

{-# NOINLINE sDL_wcsnlen #-}

-- | This works exactly like wcsnlen() but doesn\'t require access to a C runtime.
--
--     Counts up to a maximum of @maxlen@ wchar_t values in @wstr@, excluding the null terminator.
--
--     Like SDL_strnlen only counts bytes and not codepoints in a UTF-8 string, this counts wchar_t values in a string, even if the string\'s encoding is of variable width, like UTF-16.
--
--     Also be aware that wchar_t is different sizes on different platforms (4 bytes on Linux, 2 on Windows, etc).
--
--     Also, @maxlen@ is a count of wide characters, not bytes!
--
--     [@wstr@]: The null-terminated wide string to read. Must not be NULL.
--
--     [@maxlen@]: The maximum amount of wide characters to count.
--
--     [Returns]: the length (in wide characters, excluding the null terminator) of @wstr@ but never more than @maxlen@.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_wcslen', 'sDL_utf8strlen', 'sDL_utf8strnlen'
--
--     [C declaration]: @SDL_wcsnlen@, defined at @SDL3\/SDL_stdinc.h 2741:36@
sDL_wcsnlen
  :: BG.FunPtr
       ( PtrConst.PtrConst HsBindgen.Runtime.LibC.CWchar
         -> HsBindgen.Runtime.LibC.CSize
         -> IO HsBindgen.Runtime.LibC.CSize
       )
sDL_wcsnlen =
  BG.unsafePerformIO hs_bindgen_ce1645bc94a325e1

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_wcslcpy@
foreign import ccall unsafe "hs_bindgen_11ca43711b8baf20"
  hs_bindgen_11ca43711b8baf20_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_wcslcpy@
hs_bindgen_11ca43711b8baf20
  :: IO
       ( BG.FunPtr
           ( BG.Ptr HsBindgen.Runtime.LibC.CWchar
             -> PtrConst.PtrConst HsBindgen.Runtime.LibC.CWchar
             -> HsBindgen.Runtime.LibC.CSize
             -> IO HsBindgen.Runtime.LibC.CSize
           )
       )
hs_bindgen_11ca43711b8baf20 =
  BG.fromFFIType hs_bindgen_11ca43711b8baf20_base

{-# NOINLINE sDL_wcslcpy #-}

-- | Copy a wide string.
--
--     This function copies @maxlen@ - 1 wide characters from @src@ to @dst@, then appends a null terminator.
--
--     @src@ and @dst@ must not overlap.
--
--     If @maxlen@ is 0, no wide characters are copied and no null terminator is written.
--
--     [@dst@]: The destination buffer. Must not be NULL, and must not overlap with @src@.
--
--     [@src@]: The null-terminated wide string to copy. Must not be NULL, and must not overlap with @dst@.
--
--     [@maxlen@]: The length (in wide characters) of the destination buffer.
--
--     [Returns]: the length (in wide characters, excluding the null terminator) of @src@.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_wcslcat'
--
--     [C declaration]: @SDL_wcslcpy@, defined at @SDL3\/SDL_stdinc.h 2768:36@
sDL_wcslcpy
  :: BG.FunPtr
       ( BG.Ptr HsBindgen.Runtime.LibC.CWchar
         -> PtrConst.PtrConst HsBindgen.Runtime.LibC.CWchar
         -> HsBindgen.Runtime.LibC.CSize
         -> IO HsBindgen.Runtime.LibC.CSize
       )
sDL_wcslcpy =
  BG.unsafePerformIO hs_bindgen_11ca43711b8baf20

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_wcslcat@
foreign import ccall unsafe "hs_bindgen_7e7896cd495dd344"
  hs_bindgen_7e7896cd495dd344_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_wcslcat@
hs_bindgen_7e7896cd495dd344
  :: IO
       ( BG.FunPtr
           ( BG.Ptr HsBindgen.Runtime.LibC.CWchar
             -> PtrConst.PtrConst HsBindgen.Runtime.LibC.CWchar
             -> HsBindgen.Runtime.LibC.CSize
             -> IO HsBindgen.Runtime.LibC.CSize
           )
       )
hs_bindgen_7e7896cd495dd344 =
  BG.fromFFIType hs_bindgen_7e7896cd495dd344_base

{-# NOINLINE sDL_wcslcat #-}

-- | Concatenate wide strings.
--
--     This function appends up to @maxlen@ - SDL_wcslen(dst) - 1 wide characters from @src@ to the end of the wide string in @dst@, then appends a null terminator.
--
--     @src@ and @dst@ must not overlap.
--
--     If @maxlen@ - SDL_wcslen(dst) - 1 is less than or equal to 0, then @dst@ is unmodified.
--
--     [@dst@]: The destination buffer already containing the first null-terminated wide string. Must not be NULL and must not overlap with @src@.
--
--     [@src@]: The second null-terminated wide string. Must not be NULL, and must not overlap with @dst@.
--
--     [@maxlen@]: The length (in wide characters) of the destination buffer.
--
--     [Returns]: the length (in wide characters, excluding the null terminator) of the string in @dst@ plus the length of @src@.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_wcslcpy'
--
--     [C declaration]: @SDL_wcslcat@, defined at @SDL3\/SDL_stdinc.h 2797:36@
sDL_wcslcat
  :: BG.FunPtr
       ( BG.Ptr HsBindgen.Runtime.LibC.CWchar
         -> PtrConst.PtrConst HsBindgen.Runtime.LibC.CWchar
         -> HsBindgen.Runtime.LibC.CSize
         -> IO HsBindgen.Runtime.LibC.CSize
       )
sDL_wcslcat =
  BG.unsafePerformIO hs_bindgen_7e7896cd495dd344

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_wcsdup@
foreign import ccall unsafe "hs_bindgen_9ab91a86c489d607"
  hs_bindgen_9ab91a86c489d607_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_wcsdup@
hs_bindgen_9ab91a86c489d607
  :: IO
       ( BG.FunPtr
           (PtrConst.PtrConst HsBindgen.Runtime.LibC.CWchar -> IO (BG.Ptr HsBindgen.Runtime.LibC.CWchar))
       )
hs_bindgen_9ab91a86c489d607 =
  BG.fromFFIType hs_bindgen_9ab91a86c489d607_base

{-# NOINLINE sDL_wcsdup #-}

-- | Allocate a copy of a wide string.
--
--     This allocates enough space for a null-terminated copy of @wstr@, using SDL_malloc, and then makes a copy of the string into this space.
--
--     The returned string is owned by the caller, and should be passed to SDL_free when no longer needed.
--
--     [@wstr@]: the string to copy.
--
--     [Returns]: a pointer to the newly-allocated wide string.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_wcsdup@, defined at @SDL3\/SDL_stdinc.h 2815:39@
sDL_wcsdup
  :: BG.FunPtr
       (PtrConst.PtrConst HsBindgen.Runtime.LibC.CWchar -> IO (BG.Ptr HsBindgen.Runtime.LibC.CWchar))
sDL_wcsdup =
  BG.unsafePerformIO hs_bindgen_9ab91a86c489d607

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_wcsstr@
foreign import ccall unsafe "hs_bindgen_e5c78fe942e46a5f"
  hs_bindgen_e5c78fe942e46a5f_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_wcsstr@
hs_bindgen_e5c78fe942e46a5f
  :: IO
       ( BG.FunPtr
           ( PtrConst.PtrConst HsBindgen.Runtime.LibC.CWchar
             -> PtrConst.PtrConst HsBindgen.Runtime.LibC.CWchar
             -> IO (BG.Ptr HsBindgen.Runtime.LibC.CWchar)
           )
       )
hs_bindgen_e5c78fe942e46a5f =
  BG.fromFFIType hs_bindgen_e5c78fe942e46a5f_base

{-# NOINLINE sDL_wcsstr #-}

-- | Search a wide string for the first instance of a specific substring.
--
--     The search ends once it finds the requested substring, or a null terminator byte to end the string.
--
--     Note that this looks for strings of /wide characters/, not /codepoints/, so it\'s legal to search for malformed and incomplete UTF-16 sequences.
--
--     [@haystack@]: the wide string to search. Must not be NULL.
--
--     [@needle@]: the wide string to search for. Must not be NULL.
--
--     [Returns]: a pointer to the first instance of @needle@ in the string, or NULL if not found.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_wcsstr@, defined at @SDL3\/SDL_stdinc.h 2835:39@
sDL_wcsstr
  :: BG.FunPtr
       ( PtrConst.PtrConst HsBindgen.Runtime.LibC.CWchar
         -> PtrConst.PtrConst HsBindgen.Runtime.LibC.CWchar
         -> IO (BG.Ptr HsBindgen.Runtime.LibC.CWchar)
       )
sDL_wcsstr =
  BG.unsafePerformIO hs_bindgen_e5c78fe942e46a5f

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_wcsnstr@
foreign import ccall unsafe "hs_bindgen_2dc934c7f1856237"
  hs_bindgen_2dc934c7f1856237_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_wcsnstr@
hs_bindgen_2dc934c7f1856237
  :: IO
       ( BG.FunPtr
           ( PtrConst.PtrConst HsBindgen.Runtime.LibC.CWchar
             -> PtrConst.PtrConst HsBindgen.Runtime.LibC.CWchar
             -> HsBindgen.Runtime.LibC.CSize
             -> IO (BG.Ptr HsBindgen.Runtime.LibC.CWchar)
           )
       )
hs_bindgen_2dc934c7f1856237 =
  BG.fromFFIType hs_bindgen_2dc934c7f1856237_base

{-# NOINLINE sDL_wcsnstr #-}

-- | Search a wide string, up to n wide chars, for the first instance of a specific substring.
--
--     The search ends once it finds the requested substring, or a null terminator value to end the string, or @maxlen@ wide character have been examined. It is possible to use this function on a wide string without a null terminator.
--
--     Note that this looks for strings of /wide characters/, not /codepoints/, so it\'s legal to search for malformed and incomplete UTF-16 sequences.
--
--     [@haystack@]: the wide string to search. Must not be NULL.
--
--     [@needle@]: the wide string to search for. Must not be NULL.
--
--     [@maxlen@]: the maximum number of wide characters to search in @haystack@.
--
--     [Returns]: a pointer to the first instance of @needle@ in the string, or NULL if not found.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_wcsnstr@, defined at @SDL3\/SDL_stdinc.h 2860:39@
sDL_wcsnstr
  :: BG.FunPtr
       ( PtrConst.PtrConst HsBindgen.Runtime.LibC.CWchar
         -> PtrConst.PtrConst HsBindgen.Runtime.LibC.CWchar
         -> HsBindgen.Runtime.LibC.CSize
         -> IO (BG.Ptr HsBindgen.Runtime.LibC.CWchar)
       )
sDL_wcsnstr =
  BG.unsafePerformIO hs_bindgen_2dc934c7f1856237

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_wcscmp@
foreign import ccall unsafe "hs_bindgen_759b9046679b686f"
  hs_bindgen_759b9046679b686f_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_wcscmp@
hs_bindgen_759b9046679b686f
  :: IO
       ( BG.FunPtr
           ( PtrConst.PtrConst HsBindgen.Runtime.LibC.CWchar
             -> PtrConst.PtrConst HsBindgen.Runtime.LibC.CWchar
             -> IO BG.CInt
           )
       )
hs_bindgen_759b9046679b686f =
  BG.fromFFIType hs_bindgen_759b9046679b686f_base

{-# NOINLINE sDL_wcscmp #-}

-- | Compare two null-terminated wide strings.
--
--     This only compares wchar_t values until it hits a null-terminating character; it does not care if the string is well-formed UTF-16 (or UTF-32, depending on your platform\'s wchar_t size), or uses valid Unicode values.
--
--     [@str1@]: the first string to compare. NULL is not permitted!
--
--     [@str2@]: the second string to compare. NULL is not permitted!
--
--     [Returns]: less than zero if str1 is \"less than\" str2, greater than zero if str1 is \"greater than\" str2, and zero if the strings match exactly.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_wcscmp@, defined at @SDL3\/SDL_stdinc.h 2879:33@
sDL_wcscmp
  :: BG.FunPtr
       ( PtrConst.PtrConst HsBindgen.Runtime.LibC.CWchar
         -> PtrConst.PtrConst HsBindgen.Runtime.LibC.CWchar
         -> IO BG.CInt
       )
sDL_wcscmp =
  BG.unsafePerformIO hs_bindgen_759b9046679b686f

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_wcsncmp@
foreign import ccall unsafe "hs_bindgen_c5ac0e330fb4ae45"
  hs_bindgen_c5ac0e330fb4ae45_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_wcsncmp@
hs_bindgen_c5ac0e330fb4ae45
  :: IO
       ( BG.FunPtr
           ( PtrConst.PtrConst HsBindgen.Runtime.LibC.CWchar
             -> PtrConst.PtrConst HsBindgen.Runtime.LibC.CWchar
             -> HsBindgen.Runtime.LibC.CSize
             -> IO BG.CInt
           )
       )
hs_bindgen_c5ac0e330fb4ae45 =
  BG.fromFFIType hs_bindgen_c5ac0e330fb4ae45_base

{-# NOINLINE sDL_wcsncmp #-}

-- | Compare two wide strings up to a number of wchar_t values.
--
--     This only compares wchar_t values; it does not care if the string is well-formed UTF-16 (or UTF-32, depending on your platform\'s wchar_t size), or uses valid Unicode values.
--
--     Note that while this function is intended to be used with UTF-16 (or UTF-32, depending on your platform\'s definition of wchar_t), it is comparing raw wchar_t values and not Unicode codepoints: @maxlen@ specifies a wchar_t limit! If the limit lands in the middle of a multi-wchar UTF-16 sequence, it will only compare a portion of the final character.
--
--     @maxlen@ specifies a maximum number of wchar_t to compare; if the strings match to this number of wide chars (or both have matched to a null-terminator character before this count), they will be considered equal.
--
--     [@str1@]: the first string to compare. NULL is not permitted!
--
--     [@str2@]: the second string to compare. NULL is not permitted!
--
--     [@maxlen@]: the maximum number of wchar_t to compare.
--
--     [Returns]: less than zero if str1 is \"less than\" str2, greater than zero if str1 is \"greater than\" str2, and zero if the strings match exactly.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_wcsncmp@, defined at @SDL3\/SDL_stdinc.h 2910:33@
sDL_wcsncmp
  :: BG.FunPtr
       ( PtrConst.PtrConst HsBindgen.Runtime.LibC.CWchar
         -> PtrConst.PtrConst HsBindgen.Runtime.LibC.CWchar
         -> HsBindgen.Runtime.LibC.CSize
         -> IO BG.CInt
       )
sDL_wcsncmp =
  BG.unsafePerformIO hs_bindgen_c5ac0e330fb4ae45

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_wcscasecmp@
foreign import ccall unsafe "hs_bindgen_fb42c136f5dd392f"
  hs_bindgen_fb42c136f5dd392f_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_wcscasecmp@
hs_bindgen_fb42c136f5dd392f
  :: IO
       ( BG.FunPtr
           ( PtrConst.PtrConst HsBindgen.Runtime.LibC.CWchar
             -> PtrConst.PtrConst HsBindgen.Runtime.LibC.CWchar
             -> IO BG.CInt
           )
       )
hs_bindgen_fb42c136f5dd392f =
  BG.fromFFIType hs_bindgen_fb42c136f5dd392f_base

{-# NOINLINE sDL_wcscasecmp #-}

-- | Compare two null-terminated wide strings, case-insensitively.
--
--     This will work with Unicode strings, using a technique called \"case-folding\" to handle the vast majority of case-sensitive human languages regardless of system locale. It can deal with expanding values: a German Eszett character can compare against two ASCII \'s\' chars and be considered a match, for example. A notable exception: it does not handle the Turkish \'i\' character; human language is complicated!
--
--     Depending on your platform, \"wchar_t\" might be 2 bytes, and expected to be UTF-16 encoded (like Windows), or 4 bytes in UTF-32 format. Since this handles Unicode, it expects the string to be well-formed and not a null-terminated string of arbitrary bytes. Characters that are not valid UTF-16 (or UTF-32) are treated as Unicode character U+FFFD (REPLACEMENT CHARACTER), which is to say two strings of random bits may turn out to match if they convert to the same amount of replacement characters.
--
--     [@str1@]: the first string to compare. NULL is not permitted!
--
--     [@str2@]: the second string to compare. NULL is not permitted!
--
--     [Returns]: less than zero if str1 is \"less than\" str2, greater than zero if str1 is \"greater than\" str2, and zero if the strings match exactly.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_wcscasecmp@, defined at @SDL3\/SDL_stdinc.h 2940:33@
sDL_wcscasecmp
  :: BG.FunPtr
       ( PtrConst.PtrConst HsBindgen.Runtime.LibC.CWchar
         -> PtrConst.PtrConst HsBindgen.Runtime.LibC.CWchar
         -> IO BG.CInt
       )
sDL_wcscasecmp =
  BG.unsafePerformIO hs_bindgen_fb42c136f5dd392f

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_wcsncasecmp@
foreign import ccall unsafe "hs_bindgen_fcc719df5ea9c486"
  hs_bindgen_fcc719df5ea9c486_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_wcsncasecmp@
hs_bindgen_fcc719df5ea9c486
  :: IO
       ( BG.FunPtr
           ( PtrConst.PtrConst HsBindgen.Runtime.LibC.CWchar
             -> PtrConst.PtrConst HsBindgen.Runtime.LibC.CWchar
             -> HsBindgen.Runtime.LibC.CSize
             -> IO BG.CInt
           )
       )
hs_bindgen_fcc719df5ea9c486 =
  BG.fromFFIType hs_bindgen_fcc719df5ea9c486_base

{-# NOINLINE sDL_wcsncasecmp #-}

-- | Compare two wide strings, case-insensitively, up to a number of wchar_t.
--
--     This will work with Unicode strings, using a technique called \"case-folding\" to handle the vast majority of case-sensitive human languages regardless of system locale. It can deal with expanding values: a German Eszett character can compare against two ASCII \'s\' chars and be considered a match, for example. A notable exception: it does not handle the Turkish \'i\' character; human language is complicated!
--
--     Depending on your platform, \"wchar_t\" might be 2 bytes, and expected to be UTF-16 encoded (like Windows), or 4 bytes in UTF-32 format. Since this handles Unicode, it expects the string to be well-formed and not a null-terminated string of arbitrary bytes. Characters that are not valid UTF-16 (or UTF-32) are treated as Unicode character U+FFFD (REPLACEMENT CHARACTER), which is to say two strings of random bits may turn out to match if they convert to the same amount of replacement characters.
--
--     Note that while this function might deal with variable-sized characters, @maxlen@ specifies a /wchar/ limit! If the limit lands in the middle of a multi-byte UTF-16 sequence, it may convert a portion of the final character to one or more Unicode character U+FFFD (REPLACEMENT CHARACTER) so as not to overflow a buffer.
--
--     @maxlen@ specifies a maximum number of wchar_t values to compare; if the strings match to this number of wchar_t (or both have matched to a null-terminator character before this number of bytes), they will be considered equal.
--
--     [@str1@]: the first string to compare. NULL is not permitted!
--
--     [@str2@]: the second string to compare. NULL is not permitted!
--
--     [@maxlen@]: the maximum number of wchar_t values to compare.
--
--     [Returns]: less than zero if str1 is \"less than\" str2, greater than zero if str1 is \"greater than\" str2, and zero if the strings match exactly.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_wcsncasecmp@, defined at @SDL3\/SDL_stdinc.h 2982:33@
sDL_wcsncasecmp
  :: BG.FunPtr
       ( PtrConst.PtrConst HsBindgen.Runtime.LibC.CWchar
         -> PtrConst.PtrConst HsBindgen.Runtime.LibC.CWchar
         -> HsBindgen.Runtime.LibC.CSize
         -> IO BG.CInt
       )
sDL_wcsncasecmp =
  BG.unsafePerformIO hs_bindgen_fcc719df5ea9c486

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_strlen@
foreign import ccall unsafe "hs_bindgen_7f2511e625836c60"
  hs_bindgen_7f2511e625836c60_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_strlen@
hs_bindgen_7f2511e625836c60
  :: IO (BG.FunPtr (PtrConst.PtrConst BG.CChar -> IO HsBindgen.Runtime.LibC.CSize))
hs_bindgen_7f2511e625836c60 =
  BG.fromFFIType hs_bindgen_7f2511e625836c60_base

{-# NOINLINE sDL_strlen #-}

-- | This works exactly like strlen() but doesn\'t require access to a C runtime.
--
--     Counts the bytes in @str@, excluding the null terminator.
--
--     If you need the length of a UTF-8 string, consider using @SDL_utf8strlen()@.
--
--     [@str@]: The null-terminated string to read. Must not be NULL.
--
--     [Returns]: the length (in bytes, excluding the null terminator) of @src@.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_strnlen', 'sDL_utf8strlen', 'sDL_utf8strnlen'
--
--     [C declaration]: @SDL_strlen@, defined at @SDL3\/SDL_stdinc.h 3029:36@
sDL_strlen :: BG.FunPtr (PtrConst.PtrConst BG.CChar -> IO HsBindgen.Runtime.LibC.CSize)
sDL_strlen =
  BG.unsafePerformIO hs_bindgen_7f2511e625836c60

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_strnlen@
foreign import ccall unsafe "hs_bindgen_f4143204114af698"
  hs_bindgen_f4143204114af698_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_strnlen@
hs_bindgen_f4143204114af698
  :: IO
       ( BG.FunPtr
           (PtrConst.PtrConst BG.CChar -> HsBindgen.Runtime.LibC.CSize -> IO HsBindgen.Runtime.LibC.CSize)
       )
hs_bindgen_f4143204114af698 =
  BG.fromFFIType hs_bindgen_f4143204114af698_base

{-# NOINLINE sDL_strnlen #-}

-- | This works exactly like strnlen() but doesn\'t require access to a C runtime.
--
--     Counts up to a maximum of @maxlen@ bytes in @str@, excluding the null terminator.
--
--     If you need the length of a UTF-8 string, consider using @SDL_utf8strnlen()@.
--
--     [@str@]: The null-terminated string to read. Must not be NULL.
--
--     [@maxlen@]: The maximum amount of bytes to count.
--
--     [Returns]: the length (in bytes, excluding the null terminator) of @src@ but never more than @maxlen@.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_strlen', 'sDL_utf8strlen', 'sDL_utf8strnlen'
--
--     [C declaration]: @SDL_strnlen@, defined at @SDL3\/SDL_stdinc.h 3053:36@
sDL_strnlen
  :: BG.FunPtr
       (PtrConst.PtrConst BG.CChar -> HsBindgen.Runtime.LibC.CSize -> IO HsBindgen.Runtime.LibC.CSize)
sDL_strnlen =
  BG.unsafePerformIO hs_bindgen_f4143204114af698

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_strlcpy@
foreign import ccall unsafe "hs_bindgen_7640410395c54d89"
  hs_bindgen_7640410395c54d89_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_strlcpy@
hs_bindgen_7640410395c54d89
  :: IO
       ( BG.FunPtr
           ( BG.Ptr BG.CChar
             -> PtrConst.PtrConst BG.CChar
             -> HsBindgen.Runtime.LibC.CSize
             -> IO HsBindgen.Runtime.LibC.CSize
           )
       )
hs_bindgen_7640410395c54d89 =
  BG.fromFFIType hs_bindgen_7640410395c54d89_base

{-# NOINLINE sDL_strlcpy #-}

-- | Copy a string.
--
--     This function copies up to @maxlen@ - 1 characters from @src@ to @dst@, then appends a null terminator.
--
--     If @maxlen@ is 0, no characters are copied and no null terminator is written.
--
--     If you want to copy an UTF-8 string but need to ensure that multi-byte sequences are not truncated, consider using @SDL_utf8strlcpy()@.
--
--     [@dst@]: The destination buffer. Must not be NULL, and must not overlap with @src@.
--
--     [@src@]: The null-terminated string to copy. Must not be NULL, and must not overlap with @dst@.
--
--     [@maxlen@]: The length (in characters) of the destination buffer.
--
--     [Returns]: the length (in characters, excluding the null terminator) of @src@.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_strlcat', 'sDL_utf8strlcpy'
--
--     [C declaration]: @SDL_strlcpy@, defined at @SDL3\/SDL_stdinc.h 3082:36@
sDL_strlcpy
  :: BG.FunPtr
       ( BG.Ptr BG.CChar
         -> PtrConst.PtrConst BG.CChar
         -> HsBindgen.Runtime.LibC.CSize
         -> IO HsBindgen.Runtime.LibC.CSize
       )
sDL_strlcpy =
  BG.unsafePerformIO hs_bindgen_7640410395c54d89

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_utf8strlcpy@
foreign import ccall unsafe "hs_bindgen_a2badcf2b044ea50"
  hs_bindgen_a2badcf2b044ea50_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_utf8strlcpy@
hs_bindgen_a2badcf2b044ea50
  :: IO
       ( BG.FunPtr
           ( BG.Ptr BG.CChar
             -> PtrConst.PtrConst BG.CChar
             -> HsBindgen.Runtime.LibC.CSize
             -> IO HsBindgen.Runtime.LibC.CSize
           )
       )
hs_bindgen_a2badcf2b044ea50 =
  BG.fromFFIType hs_bindgen_a2badcf2b044ea50_base

{-# NOINLINE sDL_utf8strlcpy #-}

-- | Copy an UTF-8 string.
--
--     This function copies up to @dst_bytes@ - 1 bytes from @src@ to @dst@ while also ensuring that the string written to @dst@ does not end in a truncated multi-byte sequence. Finally, it appends a null terminator.
--
--     @src@ and @dst@ must not overlap.
--
--     Note that unlike @SDL_strlcpy()@, this function returns the number of bytes written, not the length of @src@.
--
--     [@dst@]: The destination buffer. Must not be NULL, and must not overlap with @src@.
--
--     [@src@]: The null-terminated UTF-8 string to copy. Must not be NULL, and must not overlap with @dst@.
--
--     [@dst_bytes@]: The length (in bytes) of the destination buffer. Must not be 0.
--
--     [Returns]: the number of bytes written, excluding the null terminator.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_strlcpy'
--
--     [C declaration]: @SDL_utf8strlcpy@, defined at @SDL3\/SDL_stdinc.h 3110:36@
sDL_utf8strlcpy
  :: BG.FunPtr
       ( BG.Ptr BG.CChar
         -> PtrConst.PtrConst BG.CChar
         -> HsBindgen.Runtime.LibC.CSize
         -> IO HsBindgen.Runtime.LibC.CSize
       )
sDL_utf8strlcpy =
  BG.unsafePerformIO hs_bindgen_a2badcf2b044ea50

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_strlcat@
foreign import ccall unsafe "hs_bindgen_26754eda643124d0"
  hs_bindgen_26754eda643124d0_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_strlcat@
hs_bindgen_26754eda643124d0
  :: IO
       ( BG.FunPtr
           ( BG.Ptr BG.CChar
             -> PtrConst.PtrConst BG.CChar
             -> HsBindgen.Runtime.LibC.CSize
             -> IO HsBindgen.Runtime.LibC.CSize
           )
       )
hs_bindgen_26754eda643124d0 =
  BG.fromFFIType hs_bindgen_26754eda643124d0_base

{-# NOINLINE sDL_strlcat #-}

-- | Concatenate strings.
--
--     This function appends up to @maxlen@ - SDL_strlen(dst) - 1 characters from @src@ to the end of the string in @dst@, then appends a null terminator.
--
--     @src@ and @dst@ must not overlap.
--
--     If @maxlen@ - SDL_strlen(dst) - 1 is less than or equal to 0, then @dst@ is unmodified.
--
--     [@dst@]: The destination buffer already containing the first null-terminated string. Must not be NULL and must not overlap with @src@.
--
--     [@src@]: The second null-terminated string. Must not be NULL, and must not overlap with @dst@.
--
--     [@maxlen@]: The length (in characters) of the destination buffer.
--
--     [Returns]: the length (in characters, excluding the null terminator) of the string in @dst@ plus the length of @src@.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_strlcpy'
--
--     [C declaration]: @SDL_strlcat@, defined at @SDL3\/SDL_stdinc.h 3138:36@
sDL_strlcat
  :: BG.FunPtr
       ( BG.Ptr BG.CChar
         -> PtrConst.PtrConst BG.CChar
         -> HsBindgen.Runtime.LibC.CSize
         -> IO HsBindgen.Runtime.LibC.CSize
       )
sDL_strlcat =
  BG.unsafePerformIO hs_bindgen_26754eda643124d0

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_strdup@
foreign import ccall unsafe "hs_bindgen_71b06acdd2d314be"
  hs_bindgen_71b06acdd2d314be_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_strdup@
hs_bindgen_71b06acdd2d314be :: IO (BG.FunPtr (PtrConst.PtrConst BG.CChar -> IO (BG.Ptr BG.CChar)))
hs_bindgen_71b06acdd2d314be =
  BG.fromFFIType hs_bindgen_71b06acdd2d314be_base

{-# NOINLINE sDL_strdup #-}

-- | Allocate a copy of a string.
--
--     This allocates enough space for a null-terminated copy of @str@, using SDL_malloc, and then makes a copy of the string into this space.
--
--     The returned string is owned by the caller, and should be passed to SDL_free when no longer needed.
--
--     [@str@]: the string to copy.
--
--     [Returns]: a pointer to the newly-allocated string.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_strdup@, defined at @SDL3\/SDL_stdinc.h 3156:47@
sDL_strdup :: BG.FunPtr (PtrConst.PtrConst BG.CChar -> IO (BG.Ptr BG.CChar))
sDL_strdup =
  BG.unsafePerformIO hs_bindgen_71b06acdd2d314be

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_strndup@
foreign import ccall unsafe "hs_bindgen_fd797c695710e05f"
  hs_bindgen_fd797c695710e05f_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_strndup@
hs_bindgen_fd797c695710e05f
  :: IO (BG.FunPtr (PtrConst.PtrConst BG.CChar -> HsBindgen.Runtime.LibC.CSize -> IO (BG.Ptr BG.CChar)))
hs_bindgen_fd797c695710e05f =
  BG.fromFFIType hs_bindgen_fd797c695710e05f_base

{-# NOINLINE sDL_strndup #-}

-- | Allocate a copy of a string, up to n characters.
--
--     This allocates enough space for a null-terminated copy of @str@, up to @maxlen@ bytes, using SDL_malloc, and then makes a copy of the string into this space.
--
--     If the string is longer than @maxlen@ bytes, the returned string will be @maxlen@ bytes long, plus a null-terminator character that isn\'t included in the count.
--
--     The returned string is owned by the caller, and should be passed to SDL_free when no longer needed.
--
--     [@str@]: the string to copy.
--
--     [@maxlen@]: the maximum length of the copied string, not counting the null-terminator character.
--
--     [Returns]: a pointer to the newly-allocated string.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_strndup@, defined at @SDL3\/SDL_stdinc.h 3181:47@
sDL_strndup
  :: BG.FunPtr (PtrConst.PtrConst BG.CChar -> HsBindgen.Runtime.LibC.CSize -> IO (BG.Ptr BG.CChar))
sDL_strndup =
  BG.unsafePerformIO hs_bindgen_fd797c695710e05f

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_strrev@
foreign import ccall unsafe "hs_bindgen_ffc5b79b6b976433"
  hs_bindgen_ffc5b79b6b976433_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_strrev@
hs_bindgen_ffc5b79b6b976433 :: IO (BG.FunPtr (BG.Ptr BG.CChar -> IO (BG.Ptr BG.CChar)))
hs_bindgen_ffc5b79b6b976433 =
  BG.fromFFIType hs_bindgen_ffc5b79b6b976433_base

{-# NOINLINE sDL_strrev #-}

-- | Reverse a string\'s contents.
--
--     This reverses a null-terminated string in-place. Only the content of the string is reversed; the null-terminator character remains at the end of the reversed string.
--
--     __WARNING__: This function reverses the /bytes/ of the string, not the codepoints. If @str@ is a UTF-8 string with Unicode codepoints > 127, this will ruin the string data. You should only use this function on strings that are completely comprised of low ASCII characters.
--
--     [@str@]: the string to reverse.
--
--     [Returns]: @str@.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_strrev@, defined at @SDL3\/SDL_stdinc.h 3202:36@
sDL_strrev :: BG.FunPtr (BG.Ptr BG.CChar -> IO (BG.Ptr BG.CChar))
sDL_strrev =
  BG.unsafePerformIO hs_bindgen_ffc5b79b6b976433

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_strupr@
foreign import ccall unsafe "hs_bindgen_ca97edf7bfcb6705"
  hs_bindgen_ca97edf7bfcb6705_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_strupr@
hs_bindgen_ca97edf7bfcb6705 :: IO (BG.FunPtr (BG.Ptr BG.CChar -> IO (BG.Ptr BG.CChar)))
hs_bindgen_ca97edf7bfcb6705 =
  BG.fromFFIType hs_bindgen_ca97edf7bfcb6705_base

{-# NOINLINE sDL_strupr #-}

-- | Convert a string to uppercase.
--
--     __WARNING__: Regardless of system locale, this will only convert ASCII values \'A\' through \'Z\' to uppercase.
--
--     This function operates on a null-terminated string of bytes even if it is malformed UTF-8! and converts ASCII characters \'a\' through \'z\' to their uppercase equivalents in-place, returning the original @str@ pointer.
--
--     [@str@]: the string to convert in-place. Can not be NULL.
--
--     [Returns]: the @str@ pointer passed into this function.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_strlwr'
--
--     [C declaration]: @SDL_strupr@, defined at @SDL3\/SDL_stdinc.h 3223:36@
sDL_strupr :: BG.FunPtr (BG.Ptr BG.CChar -> IO (BG.Ptr BG.CChar))
sDL_strupr =
  BG.unsafePerformIO hs_bindgen_ca97edf7bfcb6705

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_strlwr@
foreign import ccall unsafe "hs_bindgen_d78a5116cc6d3f71"
  hs_bindgen_d78a5116cc6d3f71_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_strlwr@
hs_bindgen_d78a5116cc6d3f71 :: IO (BG.FunPtr (BG.Ptr BG.CChar -> IO (BG.Ptr BG.CChar)))
hs_bindgen_d78a5116cc6d3f71 =
  BG.fromFFIType hs_bindgen_d78a5116cc6d3f71_base

{-# NOINLINE sDL_strlwr #-}

-- | Convert a string to lowercase.
--
--     __WARNING__: Regardless of system locale, this will only convert ASCII values \'A\' through \'Z\' to lowercase.
--
--     This function operates on a null-terminated string of bytes even if it is malformed UTF-8! and converts ASCII characters \'A\' through \'Z\' to their lowercase equivalents in-place, returning the original @str@ pointer.
--
--     [@str@]: the string to convert in-place. Can not be NULL.
--
--     [Returns]: the @str@ pointer passed into this function.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_strupr'
--
--     [C declaration]: @SDL_strlwr@, defined at @SDL3\/SDL_stdinc.h 3244:36@
sDL_strlwr :: BG.FunPtr (BG.Ptr BG.CChar -> IO (BG.Ptr BG.CChar))
sDL_strlwr =
  BG.unsafePerformIO hs_bindgen_d78a5116cc6d3f71

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_strchr@
foreign import ccall unsafe "hs_bindgen_6ce9f7bacdf27653"
  hs_bindgen_6ce9f7bacdf27653_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_strchr@
hs_bindgen_6ce9f7bacdf27653
  :: IO (BG.FunPtr (PtrConst.PtrConst BG.CChar -> BG.CInt -> IO (BG.Ptr BG.CChar)))
hs_bindgen_6ce9f7bacdf27653 =
  BG.fromFFIType hs_bindgen_6ce9f7bacdf27653_base

{-# NOINLINE sDL_strchr #-}

-- | Search a string for the first instance of a specific byte.
--
--     The search ends once it finds the requested byte value, or a null terminator byte to end the string.
--
--     Note that this looks for /bytes/, not /characters/, so you cannot match against a Unicode codepoint > 255, regardless of character encoding.
--
--     [@str@]: the string to search. Must not be NULL.
--
--     [@c@]: the byte value to search for.
--
--     [Returns]: a pointer to the first instance of @c@ in the string, or NULL if not found.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_strchr@, defined at @SDL3\/SDL_stdinc.h 3264:36@
sDL_strchr :: BG.FunPtr (PtrConst.PtrConst BG.CChar -> BG.CInt -> IO (BG.Ptr BG.CChar))
sDL_strchr =
  BG.unsafePerformIO hs_bindgen_6ce9f7bacdf27653

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_strrchr@
foreign import ccall unsafe "hs_bindgen_d2538022eb73bf53"
  hs_bindgen_d2538022eb73bf53_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_strrchr@
hs_bindgen_d2538022eb73bf53
  :: IO (BG.FunPtr (PtrConst.PtrConst BG.CChar -> BG.CInt -> IO (BG.Ptr BG.CChar)))
hs_bindgen_d2538022eb73bf53 =
  BG.fromFFIType hs_bindgen_d2538022eb73bf53_base

{-# NOINLINE sDL_strrchr #-}

-- | Search a string for the last instance of a specific byte.
--
--     The search must go until it finds a null terminator byte to end the string.
--
--     Note that this looks for /bytes/, not /characters/, so you cannot match against a Unicode codepoint > 255, regardless of character encoding.
--
--     [@str@]: the string to search. Must not be NULL.
--
--     [@c@]: the byte value to search for.
--
--     [Returns]: a pointer to the last instance of @c@ in the string, or NULL if not found.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_strrchr@, defined at @SDL3\/SDL_stdinc.h 3283:36@
sDL_strrchr :: BG.FunPtr (PtrConst.PtrConst BG.CChar -> BG.CInt -> IO (BG.Ptr BG.CChar))
sDL_strrchr =
  BG.unsafePerformIO hs_bindgen_d2538022eb73bf53

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_strstr@
foreign import ccall unsafe "hs_bindgen_b07cb6fe84d9cf1e"
  hs_bindgen_b07cb6fe84d9cf1e_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_strstr@
hs_bindgen_b07cb6fe84d9cf1e
  :: IO (BG.FunPtr (PtrConst.PtrConst BG.CChar -> PtrConst.PtrConst BG.CChar -> IO (BG.Ptr BG.CChar)))
hs_bindgen_b07cb6fe84d9cf1e =
  BG.fromFFIType hs_bindgen_b07cb6fe84d9cf1e_base

{-# NOINLINE sDL_strstr #-}

-- | Search a string for the first instance of a specific substring.
--
--     The search ends once it finds the requested substring, or a null terminator byte to end the string.
--
--     Note that this looks for strings of /bytes/, not /characters/, so it\'s legal to search for malformed and incomplete UTF-8 sequences.
--
--     [@haystack@]: the string to search. Must not be NULL.
--
--     [@needle@]: the string to search for. Must not be NULL.
--
--     [Returns]: a pointer to the first instance of @needle@ in the string, or NULL if not found.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_strstr@, defined at @SDL3\/SDL_stdinc.h 3303:36@
sDL_strstr
  :: BG.FunPtr (PtrConst.PtrConst BG.CChar -> PtrConst.PtrConst BG.CChar -> IO (BG.Ptr BG.CChar))
sDL_strstr =
  BG.unsafePerformIO hs_bindgen_b07cb6fe84d9cf1e

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_strnstr@
foreign import ccall unsafe "hs_bindgen_c3b37921fa630595"
  hs_bindgen_c3b37921fa630595_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_strnstr@
hs_bindgen_c3b37921fa630595
  :: IO
       ( BG.FunPtr
           ( PtrConst.PtrConst BG.CChar
             -> PtrConst.PtrConst BG.CChar
             -> HsBindgen.Runtime.LibC.CSize
             -> IO (BG.Ptr BG.CChar)
           )
       )
hs_bindgen_c3b37921fa630595 =
  BG.fromFFIType hs_bindgen_c3b37921fa630595_base

{-# NOINLINE sDL_strnstr #-}

-- | Search a string, up to n bytes, for the first instance of a specific substring.
--
--     The search ends once it finds the requested substring, or a null terminator byte to end the string, or @maxlen@ bytes have been examined. It is possible to use this function on a string without a null terminator.
--
--     Note that this looks for strings of /bytes/, not /characters/, so it\'s legal to search for malformed and incomplete UTF-8 sequences.
--
--     [@haystack@]: the string to search. Must not be NULL.
--
--     [@needle@]: the string to search for. Must not be NULL.
--
--     [@maxlen@]: the maximum number of bytes to search in @haystack@.
--
--     [Returns]: a pointer to the first instance of @needle@ in the string, or NULL if not found.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_strnstr@, defined at @SDL3\/SDL_stdinc.h 3326:36@
sDL_strnstr
  :: BG.FunPtr
       ( PtrConst.PtrConst BG.CChar
         -> PtrConst.PtrConst BG.CChar
         -> HsBindgen.Runtime.LibC.CSize
         -> IO (BG.Ptr BG.CChar)
       )
sDL_strnstr =
  BG.unsafePerformIO hs_bindgen_c3b37921fa630595

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_strcasestr@
foreign import ccall unsafe "hs_bindgen_3b1f9973e35be364"
  hs_bindgen_3b1f9973e35be364_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_strcasestr@
hs_bindgen_3b1f9973e35be364
  :: IO (BG.FunPtr (PtrConst.PtrConst BG.CChar -> PtrConst.PtrConst BG.CChar -> IO (BG.Ptr BG.CChar)))
hs_bindgen_3b1f9973e35be364 =
  BG.fromFFIType hs_bindgen_3b1f9973e35be364_base

{-# NOINLINE sDL_strcasestr #-}

-- | Search a UTF-8 string for the first instance of a specific substring, case-insensitively.
--
--     This will work with Unicode strings, using a technique called \"case-folding\" to handle the vast majority of case-sensitive human languages regardless of system locale. It can deal with expanding values: a German Eszett character can compare against two ASCII \'s\' chars and be considered a match, for example. A notable exception: it does not handle the Turkish \'i\' character; human language is complicated!
--
--     Since this handles Unicode, it expects the strings to be well-formed UTF-8 and not a null-terminated string of arbitrary bytes. Bytes that are not valid UTF-8 are treated as Unicode character U+FFFD (REPLACEMENT CHARACTER), which is to say two strings of random bits may turn out to match if they convert to the same amount of replacement characters.
--
--     [@haystack@]: the string to search. Must not be NULL.
--
--     [@needle@]: the string to search for. Must not be NULL.
--
--     [Returns]: a pointer to the first instance of @needle@ in the string, or NULL if not found.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_strcasestr@, defined at @SDL3\/SDL_stdinc.h 3354:36@
sDL_strcasestr
  :: BG.FunPtr (PtrConst.PtrConst BG.CChar -> PtrConst.PtrConst BG.CChar -> IO (BG.Ptr BG.CChar))
sDL_strcasestr =
  BG.unsafePerformIO hs_bindgen_3b1f9973e35be364

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_strtok_r@
foreign import ccall unsafe "hs_bindgen_99a1a0af797e8aad"
  hs_bindgen_99a1a0af797e8aad_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_strtok_r@
hs_bindgen_99a1a0af797e8aad
  :: IO
       ( BG.FunPtr
           (BG.Ptr BG.CChar -> PtrConst.PtrConst BG.CChar -> BG.Ptr (BG.Ptr BG.CChar) -> IO (BG.Ptr BG.CChar))
       )
hs_bindgen_99a1a0af797e8aad =
  BG.fromFFIType hs_bindgen_99a1a0af797e8aad_base

{-# NOINLINE sDL_strtok_r #-}

-- | This works exactly like strtok_r() but doesn\'t require access to a C runtime.
--
--     Break a string up into a series of tokens.
--
--     To start tokenizing a new string, @str@ should be the non-NULL address of the string to start tokenizing. Future calls to get the next token from the same string should specify a NULL.
--
--     Note that this function will overwrite pieces of @str@ with null chars to split it into tokens. This function cannot be used with const\/read-only strings!
--
--     @saveptr@ just needs to point to a @char *@ that can be overwritten; SDL will use this to save tokenizing state between calls. It is initialized if @str@ is non-NULL, and used to resume tokenizing when @str@ is NULL.
--
--     [@str@]: the string to tokenize, or NULL to continue tokenizing.
--
--     [@delim@]: the delimiter string that separates tokens.
--
--     [@saveptr@]: pointer to a char *, used for ongoing state.
--
--     [Returns]: A pointer to the next token, or NULL if no tokens remain.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_strtok_r@, defined at @SDL3\/SDL_stdinc.h 3383:36@
sDL_strtok_r
  :: BG.FunPtr
       (BG.Ptr BG.CChar -> PtrConst.PtrConst BG.CChar -> BG.Ptr (BG.Ptr BG.CChar) -> IO (BG.Ptr BG.CChar))
sDL_strtok_r =
  BG.unsafePerformIO hs_bindgen_99a1a0af797e8aad

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_utf8strlen@
foreign import ccall unsafe "hs_bindgen_fdd33f5a5e9573d8"
  hs_bindgen_fdd33f5a5e9573d8_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_utf8strlen@
hs_bindgen_fdd33f5a5e9573d8
  :: IO (BG.FunPtr (PtrConst.PtrConst BG.CChar -> IO HsBindgen.Runtime.LibC.CSize))
hs_bindgen_fdd33f5a5e9573d8 =
  BG.fromFFIType hs_bindgen_fdd33f5a5e9573d8_base

{-# NOINLINE sDL_utf8strlen #-}

-- | Count the number of codepoints in a UTF-8 string.
--
--     Counts the /codepoints/, not /bytes/, in @str@, excluding the null terminator.
--
--     If you need to count the bytes in a string instead, consider using @SDL_strlen()@.
--
--     Since this handles Unicode, it expects the strings to be well-formed UTF-8 and not a null-terminated string of arbitrary bytes. Bytes that are not valid UTF-8 are treated as Unicode character U+FFFD (REPLACEMENT CHARACTER), so a malformed or incomplete UTF-8 sequence might increase the count by several replacement characters.
--
--     [@str@]: The null-terminated UTF-8 string to read. Must not be NULL.
--
--     [Returns]: The length (in codepoints, excluding the null terminator) of @src@.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_utf8strnlen', 'sDL_strlen'
--
--     [C declaration]: @SDL_utf8strlen@, defined at @SDL3\/SDL_stdinc.h 3411:36@
sDL_utf8strlen :: BG.FunPtr (PtrConst.PtrConst BG.CChar -> IO HsBindgen.Runtime.LibC.CSize)
sDL_utf8strlen =
  BG.unsafePerformIO hs_bindgen_fdd33f5a5e9573d8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_utf8strnlen@
foreign import ccall unsafe "hs_bindgen_1e79ccdd40706b8d"
  hs_bindgen_1e79ccdd40706b8d_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_utf8strnlen@
hs_bindgen_1e79ccdd40706b8d
  :: IO
       ( BG.FunPtr
           (PtrConst.PtrConst BG.CChar -> HsBindgen.Runtime.LibC.CSize -> IO HsBindgen.Runtime.LibC.CSize)
       )
hs_bindgen_1e79ccdd40706b8d =
  BG.fromFFIType hs_bindgen_1e79ccdd40706b8d_base

{-# NOINLINE sDL_utf8strnlen #-}

-- | Count the number of codepoints in a UTF-8 string, up to n bytes.
--
--     Counts the /codepoints/, not /bytes/, in @str@, excluding the null terminator.
--
--     If you need to count the bytes in a string instead, consider using @SDL_strnlen()@.
--
--     The counting stops at @bytes@ bytes (not codepoints!). This seems counterintuitive, but makes it easy to express the total size of the string\'s buffer.
--
--     Since this handles Unicode, it expects the strings to be well-formed UTF-8 and not a null-terminated string of arbitrary bytes. Bytes that are not valid UTF-8 are treated as Unicode character U+FFFD (REPLACEMENT CHARACTER), so a malformed or incomplete UTF-8 sequence might increase the count by several replacement characters.
--
--     [@str@]: The null-terminated UTF-8 string to read. Must not be NULL.
--
--     [@bytes@]: The maximum amount of bytes to count.
--
--     [Returns]: The length (in codepoints, excluding the null terminator) of @src@ but never more than @maxlen@.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_utf8strlen', 'sDL_strnlen'
--
--     [C declaration]: @SDL_utf8strnlen@, defined at @SDL3\/SDL_stdinc.h 3444:36@
sDL_utf8strnlen
  :: BG.FunPtr
       (PtrConst.PtrConst BG.CChar -> HsBindgen.Runtime.LibC.CSize -> IO HsBindgen.Runtime.LibC.CSize)
sDL_utf8strnlen =
  BG.unsafePerformIO hs_bindgen_1e79ccdd40706b8d

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_itoa@
foreign import ccall unsafe "hs_bindgen_4cfc9a356cf1014c"
  hs_bindgen_4cfc9a356cf1014c_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_itoa@
hs_bindgen_4cfc9a356cf1014c
  :: IO (BG.FunPtr (BG.CInt -> BG.Ptr BG.CChar -> BG.CInt -> IO (BG.Ptr BG.CChar)))
hs_bindgen_4cfc9a356cf1014c =
  BG.fromFFIType hs_bindgen_4cfc9a356cf1014c_base

{-# NOINLINE sDL_itoa #-}

-- | Convert an integer into a string.
--
--     This requires a radix to specified for string format. Specifying 10 produces a decimal number, 16 hexadecimal, etc. Must be in the range of 2 to 36.
--
--     Note that this function will overflow a buffer if @str@ is not large enough to hold the output! It may be safer to use SDL_snprintf to clamp output, or SDL_asprintf to allocate a buffer. Otherwise, it doesn\'t hurt to allocate much more space than you expect to use (and don\'t forget possible negative signs, null terminator bytes, etc).
--
--     [@value@]: the integer to convert.
--
--     [@str@]: the buffer to write the string into.
--
--     [@radix@]: the radix to use for string generation.
--
--     [Returns]: @str@.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_uitoa', @SDL_ltoa@, 'sDL_lltoa'
--
--     [C declaration]: @SDL_itoa@, defined at @SDL3\/SDL_stdinc.h 3472:36@
sDL_itoa :: BG.FunPtr (BG.CInt -> BG.Ptr BG.CChar -> BG.CInt -> IO (BG.Ptr BG.CChar))
sDL_itoa =
  BG.unsafePerformIO hs_bindgen_4cfc9a356cf1014c

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_uitoa@
foreign import ccall unsafe "hs_bindgen_e052861370ec1ea4"
  hs_bindgen_e052861370ec1ea4_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_uitoa@
hs_bindgen_e052861370ec1ea4
  :: IO (BG.FunPtr (BG.CUInt -> BG.Ptr BG.CChar -> BG.CInt -> IO (BG.Ptr BG.CChar)))
hs_bindgen_e052861370ec1ea4 =
  BG.fromFFIType hs_bindgen_e052861370ec1ea4_base

{-# NOINLINE sDL_uitoa #-}

-- | Convert an unsigned integer into a string.
--
--     This requires a radix to specified for string format. Specifying 10 produces a decimal number, 16 hexadecimal, etc. Must be in the range of 2 to 36.
--
--     Note that this function will overflow a buffer if @str@ is not large enough to hold the output! It may be safer to use SDL_snprintf to clamp output, or SDL_asprintf to allocate a buffer. Otherwise, it doesn\'t hurt to allocate much more space than you expect to use (and don\'t forget null terminator bytes, etc).
--
--     [@value@]: the unsigned integer to convert.
--
--     [@str@]: the buffer to write the string into.
--
--     [@radix@]: the radix to use for string generation.
--
--     [Returns]: @str@.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_itoa', @SDL_ultoa@, 'sDL_ulltoa'
--
--     [C declaration]: @SDL_uitoa@, defined at @SDL3\/SDL_stdinc.h 3500:36@
sDL_uitoa :: BG.FunPtr (BG.CUInt -> BG.Ptr BG.CChar -> BG.CInt -> IO (BG.Ptr BG.CChar))
sDL_uitoa =
  BG.unsafePerformIO hs_bindgen_e052861370ec1ea4

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_lltoa@
foreign import ccall unsafe "hs_bindgen_9c5155b926feaa3f"
  hs_bindgen_9c5155b926feaa3f_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_lltoa@
hs_bindgen_9c5155b926feaa3f
  :: IO (BG.FunPtr (BG.CLLong -> BG.Ptr BG.CChar -> BG.CInt -> IO (BG.Ptr BG.CChar)))
hs_bindgen_9c5155b926feaa3f =
  BG.fromFFIType hs_bindgen_9c5155b926feaa3f_base

{-# NOINLINE sDL_lltoa #-}

-- | Convert a long long integer into a string.
--
--     This requires a radix to specified for string format. Specifying 10 produces a decimal number, 16 hexadecimal, etc. Must be in the range of 2 to 36.
--
--     Note that this function will overflow a buffer if @str@ is not large enough to hold the output! It may be safer to use SDL_snprintf to clamp output, or SDL_asprintf to allocate a buffer. Otherwise, it doesn\'t hurt to allocate much more space than you expect to use (and don\'t forget possible negative signs, null terminator bytes, etc).
--
--     [@value@]: the long long integer to convert.
--
--     [@str@]: the buffer to write the string into.
--
--     [@radix@]: the radix to use for string generation.
--
--     [Returns]: @str@.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_ulltoa', 'sDL_itoa', @SDL_ltoa@
--
--     [C declaration]: @SDL_lltoa@, defined at @SDL3\/SDL_stdinc.h 3586:36@
sDL_lltoa :: BG.FunPtr (BG.CLLong -> BG.Ptr BG.CChar -> BG.CInt -> IO (BG.Ptr BG.CChar))
sDL_lltoa =
  BG.unsafePerformIO hs_bindgen_9c5155b926feaa3f

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_ulltoa@
foreign import ccall unsafe "hs_bindgen_a3b3fdde6f9a0142"
  hs_bindgen_a3b3fdde6f9a0142_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_ulltoa@
hs_bindgen_a3b3fdde6f9a0142
  :: IO (BG.FunPtr (BG.CULLong -> BG.Ptr BG.CChar -> BG.CInt -> IO (BG.Ptr BG.CChar)))
hs_bindgen_a3b3fdde6f9a0142 =
  BG.fromFFIType hs_bindgen_a3b3fdde6f9a0142_base

{-# NOINLINE sDL_ulltoa #-}

-- | Convert an unsigned long long integer into a string.
--
--     This requires a radix to specified for string format. Specifying 10 produces a decimal number, 16 hexadecimal, etc. Must be in the range of 2 to 36.
--
--     Note that this function will overflow a buffer if @str@ is not large enough to hold the output! It may be safer to use SDL_snprintf to clamp output, or SDL_asprintf to allocate a buffer. Otherwise, it doesn\'t hurt to allocate much more space than you expect to use (and don\'t forget null terminator bytes, etc).
--
--     [@value@]: the unsigned long long integer to convert.
--
--     [@str@]: the buffer to write the string into.
--
--     [@radix@]: the radix to use for string generation.
--
--     [Returns]: @str@.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_lltoa', 'sDL_uitoa', @SDL_ultoa@
--
--     [C declaration]: @SDL_ulltoa@, defined at @SDL3\/SDL_stdinc.h 3614:36@
sDL_ulltoa :: BG.FunPtr (BG.CULLong -> BG.Ptr BG.CChar -> BG.CInt -> IO (BG.Ptr BG.CChar))
sDL_ulltoa =
  BG.unsafePerformIO hs_bindgen_a3b3fdde6f9a0142

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_atoi@
foreign import ccall unsafe "hs_bindgen_9a3e9e2b67b916a2"
  hs_bindgen_9a3e9e2b67b916a2_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_atoi@
hs_bindgen_9a3e9e2b67b916a2 :: IO (BG.FunPtr (PtrConst.PtrConst BG.CChar -> IO BG.CInt))
hs_bindgen_9a3e9e2b67b916a2 =
  BG.fromFFIType hs_bindgen_9a3e9e2b67b916a2_base

{-# NOINLINE sDL_atoi #-}

-- | Parse an @int@ from a string.
--
--     The result of calling @SDL_atoi(str)@ is equivalent to @(int)SDL_strtol(str, NULL, 10)@.
--
--     [@str@]: The null-terminated string to read. Must not be NULL.
--
--     [Returns]: the parsed @int@.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_atof', @SDL_strtol@, @SDL_strtoul@, 'sDL_strtoll', 'sDL_strtoull', 'sDL_strtod', 'sDL_itoa'
--
--     [C declaration]: @SDL_atoi@, defined at @SDL3\/SDL_stdinc.h 3638:33@
sDL_atoi :: BG.FunPtr (PtrConst.PtrConst BG.CChar -> IO BG.CInt)
sDL_atoi =
  BG.unsafePerformIO hs_bindgen_9a3e9e2b67b916a2

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_atof@
foreign import ccall unsafe "hs_bindgen_2804d8be78ed3cae"
  hs_bindgen_2804d8be78ed3cae_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_atof@
hs_bindgen_2804d8be78ed3cae :: IO (BG.FunPtr (PtrConst.PtrConst BG.CChar -> IO BG.CDouble))
hs_bindgen_2804d8be78ed3cae =
  BG.fromFFIType hs_bindgen_2804d8be78ed3cae_base

{-# NOINLINE sDL_atof #-}

-- | Parse a @double@ from a string.
--
--     The result of calling @SDL_atof(str)@ is equivalent to @SDL_strtod(str, NULL)@.
--
--     [@str@]: The null-terminated string to read. Must not be NULL.
--
--     [Returns]: the parsed @double@.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_atoi', @SDL_strtol@, @SDL_strtoul@, 'sDL_strtoll', 'sDL_strtoull', 'sDL_strtod'
--
--     [C declaration]: @SDL_atof@, defined at @SDL3\/SDL_stdinc.h 3660:36@
sDL_atof :: BG.FunPtr (PtrConst.PtrConst BG.CChar -> IO BG.CDouble)
sDL_atof =
  BG.unsafePerformIO hs_bindgen_2804d8be78ed3cae

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_strtoll@
foreign import ccall unsafe "hs_bindgen_6e1c8dc5ccea4653"
  hs_bindgen_6e1c8dc5ccea4653_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_strtoll@
hs_bindgen_6e1c8dc5ccea4653
  :: IO (BG.FunPtr (PtrConst.PtrConst BG.CChar -> BG.Ptr (BG.Ptr BG.CChar) -> BG.CInt -> IO BG.CLLong))
hs_bindgen_6e1c8dc5ccea4653 =
  BG.fromFFIType hs_bindgen_6e1c8dc5ccea4653_base

{-# NOINLINE sDL_strtoll #-}

-- | Parse a @long long@ from a string.
--
--     If @str@ starts with whitespace, then those whitespace characters are skipped before attempting to parse the number.
--
--     If the parsed number does not fit inside a @long long@, the result is clamped to the minimum and maximum representable @long long@ values.
--
--     [@str@]: The null-terminated string to read. Must not be NULL.
--
--     [@endp@]: If not NULL, the address of the first invalid character (i.e. the next character after the parsed number) will be written to this pointer.
--
--     [@base@]: The base of the integer to read. Supported values are 0 and 2 to 36 inclusive. If 0, the base will be inferred from the number\'s prefix (0x for hexadecimal, 0 for octal, decimal otherwise).
--
--     [Returns]: the parsed @long long@, or 0 if no number could be parsed.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_atoi', 'sDL_atof', @SDL_strtol@, @SDL_strtoul@, 'sDL_strtoull', 'sDL_strtod', 'sDL_lltoa'
--
--     [C declaration]: @SDL_strtoll@, defined at @SDL3\/SDL_stdinc.h 3762:39@
sDL_strtoll
  :: BG.FunPtr (PtrConst.PtrConst BG.CChar -> BG.Ptr (BG.Ptr BG.CChar) -> BG.CInt -> IO BG.CLLong)
sDL_strtoll =
  BG.unsafePerformIO hs_bindgen_6e1c8dc5ccea4653

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_strtoull@
foreign import ccall unsafe "hs_bindgen_f81f822f17549fa4"
  hs_bindgen_f81f822f17549fa4_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_strtoull@
hs_bindgen_f81f822f17549fa4
  :: IO (BG.FunPtr (PtrConst.PtrConst BG.CChar -> BG.Ptr (BG.Ptr BG.CChar) -> BG.CInt -> IO BG.CULLong))
hs_bindgen_f81f822f17549fa4 =
  BG.fromFFIType hs_bindgen_f81f822f17549fa4_base

{-# NOINLINE sDL_strtoull #-}

-- | Parse an @unsigned long long@ from a string.
--
--     If @str@ starts with whitespace, then those whitespace characters are skipped before attempting to parse the number.
--
--     If the parsed number does not fit inside an @unsigned long long@, the result is clamped to the maximum representable @unsigned long long@ value.
--
--     [@str@]: The null-terminated string to read. Must not be NULL.
--
--     [@endp@]: If not NULL, the address of the first invalid character (i.e. the next character after the parsed number) will be written to this pointer.
--
--     [@base@]: The base of the integer to read. Supported values are 0 and 2 to 36 inclusive. If 0, the base will be inferred from the number\'s prefix (0x for hexadecimal, 0 for octal, decimal otherwise).
--
--     [Returns]: the parsed @unsigned long long@, or 0 if no number could be parsed.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_atoi', 'sDL_atof', @SDL_strtol@, 'sDL_strtoll', @SDL_strtoul@, 'sDL_strtod', 'sDL_ulltoa'
--
--     [C declaration]: @SDL_strtoull@, defined at @SDL3\/SDL_stdinc.h 3796:48@
sDL_strtoull
  :: BG.FunPtr (PtrConst.PtrConst BG.CChar -> BG.Ptr (BG.Ptr BG.CChar) -> BG.CInt -> IO BG.CULLong)
sDL_strtoull =
  BG.unsafePerformIO hs_bindgen_f81f822f17549fa4

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_strtod@
foreign import ccall unsafe "hs_bindgen_6ab6327bbf86f171"
  hs_bindgen_6ab6327bbf86f171_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_strtod@
hs_bindgen_6ab6327bbf86f171
  :: IO (BG.FunPtr (PtrConst.PtrConst BG.CChar -> BG.Ptr (BG.Ptr BG.CChar) -> IO BG.CDouble))
hs_bindgen_6ab6327bbf86f171 =
  BG.fromFFIType hs_bindgen_6ab6327bbf86f171_base

{-# NOINLINE sDL_strtod #-}

-- | Parse a @double@ from a string.
--
--     This function makes fewer guarantees than the C runtime @strtod@:
--
--     * Only decimal notation is guaranteed to be supported. The handling of scientific and hexadecimal notation is unspecified.
--
--     * Whether or not INF and NAN can be parsed is unspecified.
--
--     * The precision of the result is unspecified.
--
--     [@str@]: the null-terminated string to read. Must not be NULL.
--
--     [@endp@]: if not NULL, the address of the first invalid character (i.e. the next character after the parsed number) will be written to this pointer.
--
--     [Returns]: the parsed @double@, or 0 if no number could be parsed.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_atoi', 'sDL_atof', @SDL_strtol@, 'sDL_strtoll', @SDL_strtoul@, 'sDL_strtoull'
--
--     [C declaration]: @SDL_strtod@, defined at @SDL3\/SDL_stdinc.h 3826:36@
sDL_strtod :: BG.FunPtr (PtrConst.PtrConst BG.CChar -> BG.Ptr (BG.Ptr BG.CChar) -> IO BG.CDouble)
sDL_strtod =
  BG.unsafePerformIO hs_bindgen_6ab6327bbf86f171

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_strcmp@
foreign import ccall unsafe "hs_bindgen_fc45ddd2c1f0219e"
  hs_bindgen_fc45ddd2c1f0219e_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_strcmp@
hs_bindgen_fc45ddd2c1f0219e
  :: IO (BG.FunPtr (PtrConst.PtrConst BG.CChar -> PtrConst.PtrConst BG.CChar -> IO BG.CInt))
hs_bindgen_fc45ddd2c1f0219e =
  BG.fromFFIType hs_bindgen_fc45ddd2c1f0219e_base

{-# NOINLINE sDL_strcmp #-}

-- | Compare two null-terminated UTF-8 strings.
--
--     Due to the nature of UTF-8 encoding, this will work with Unicode strings, since effectively this function just compares bytes until it hits a null-terminating character. Also due to the nature of UTF-8, this can be used with @SDL_qsort()@ to put strings in (roughly) alphabetical order.
--
--     [@str1@]: the first string to compare. NULL is not permitted!
--
--     [@str2@]: the second string to compare. NULL is not permitted!
--
--     [Returns]: less than zero if str1 is \"less than\" str2, greater than zero if str1 is \"greater than\" str2, and zero if the strings match exactly.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_strcmp@, defined at @SDL3\/SDL_stdinc.h 3846:33@
sDL_strcmp :: BG.FunPtr (PtrConst.PtrConst BG.CChar -> PtrConst.PtrConst BG.CChar -> IO BG.CInt)
sDL_strcmp =
  BG.unsafePerformIO hs_bindgen_fc45ddd2c1f0219e

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_strncmp@
foreign import ccall unsafe "hs_bindgen_18f45fe45a42c194"
  hs_bindgen_18f45fe45a42c194_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_strncmp@
hs_bindgen_18f45fe45a42c194
  :: IO
       ( BG.FunPtr
           ( PtrConst.PtrConst BG.CChar
             -> PtrConst.PtrConst BG.CChar
             -> HsBindgen.Runtime.LibC.CSize
             -> IO BG.CInt
           )
       )
hs_bindgen_18f45fe45a42c194 =
  BG.fromFFIType hs_bindgen_18f45fe45a42c194_base

{-# NOINLINE sDL_strncmp #-}

-- | Compare two UTF-8 strings up to a number of bytes.
--
--     Due to the nature of UTF-8 encoding, this will work with Unicode strings, since effectively this function just compares bytes until it hits a null-terminating character. Also due to the nature of UTF-8, this can be used with @SDL_qsort()@ to put strings in (roughly) alphabetical order.
--
--     Note that while this function is intended to be used with UTF-8, it is doing a bytewise comparison, and @maxlen@ specifies a /byte/ limit! If the limit lands in the middle of a multi-byte UTF-8 sequence, it will only compare a portion of the final character.
--
--     @maxlen@ specifies a maximum number of bytes to compare; if the strings match to this number of bytes (or both have matched to a null-terminator character before this number of bytes), they will be considered equal.
--
--     [@str1@]: the first string to compare. NULL is not permitted!
--
--     [@str2@]: the second string to compare. NULL is not permitted!
--
--     [@maxlen@]: the maximum number of /bytes/ to compare.
--
--     [Returns]: less than zero if str1 is \"less than\" str2, greater than zero if str1 is \"greater than\" str2, and zero if the strings match exactly.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_strncmp@, defined at @SDL3\/SDL_stdinc.h 3876:33@
sDL_strncmp
  :: BG.FunPtr
       ( PtrConst.PtrConst BG.CChar
         -> PtrConst.PtrConst BG.CChar
         -> HsBindgen.Runtime.LibC.CSize
         -> IO BG.CInt
       )
sDL_strncmp =
  BG.unsafePerformIO hs_bindgen_18f45fe45a42c194

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_strcasecmp@
foreign import ccall unsafe "hs_bindgen_2996562bf0a4585e"
  hs_bindgen_2996562bf0a4585e_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_strcasecmp@
hs_bindgen_2996562bf0a4585e
  :: IO (BG.FunPtr (PtrConst.PtrConst BG.CChar -> PtrConst.PtrConst BG.CChar -> IO BG.CInt))
hs_bindgen_2996562bf0a4585e =
  BG.fromFFIType hs_bindgen_2996562bf0a4585e_base

{-# NOINLINE sDL_strcasecmp #-}

-- | Compare two null-terminated UTF-8 strings, case-insensitively.
--
--     This will work with Unicode strings, using a technique called \"case-folding\" to handle the vast majority of case-sensitive human languages regardless of system locale. It can deal with expanding values: a German Eszett character can compare against two ASCII \'s\' chars and be considered a match, for example. A notable exception: it does not handle the Turkish \'i\' character; human language is complicated!
--
--     Since this handles Unicode, it expects the string to be well-formed UTF-8 and not a null-terminated string of arbitrary bytes. Bytes that are not valid UTF-8 are treated as Unicode character U+FFFD (REPLACEMENT CHARACTER), which is to say two strings of random bits may turn out to match if they convert to the same amount of replacement characters.
--
--     [@str1@]: the first string to compare. NULL is not permitted!
--
--     [@str2@]: the second string to compare. NULL is not permitted!
--
--     [Returns]: less than zero if str1 is \"less than\" str2, greater than zero if str1 is \"greater than\" str2, and zero if the strings match exactly.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_strcasecmp@, defined at @SDL3\/SDL_stdinc.h 3904:33@
sDL_strcasecmp :: BG.FunPtr (PtrConst.PtrConst BG.CChar -> PtrConst.PtrConst BG.CChar -> IO BG.CInt)
sDL_strcasecmp =
  BG.unsafePerformIO hs_bindgen_2996562bf0a4585e

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_strncasecmp@
foreign import ccall unsafe "hs_bindgen_28d4c90d056ca0bb"
  hs_bindgen_28d4c90d056ca0bb_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_strncasecmp@
hs_bindgen_28d4c90d056ca0bb
  :: IO
       ( BG.FunPtr
           ( PtrConst.PtrConst BG.CChar
             -> PtrConst.PtrConst BG.CChar
             -> HsBindgen.Runtime.LibC.CSize
             -> IO BG.CInt
           )
       )
hs_bindgen_28d4c90d056ca0bb =
  BG.fromFFIType hs_bindgen_28d4c90d056ca0bb_base

{-# NOINLINE sDL_strncasecmp #-}

-- | Compare two UTF-8 strings, case-insensitively, up to a number of bytes.
--
--     This will work with Unicode strings, using a technique called \"case-folding\" to handle the vast majority of case-sensitive human languages regardless of system locale. It can deal with expanding values: a German Eszett character can compare against two ASCII \'s\' chars and be considered a match, for example. A notable exception: it does not handle the Turkish \'i\' character; human language is complicated!
--
--     Since this handles Unicode, it expects the string to be well-formed UTF-8 and not a null-terminated string of arbitrary bytes. Bytes that are not valid UTF-8 are treated as Unicode character U+FFFD (REPLACEMENT CHARACTER), which is to say two strings of random bits may turn out to match if they convert to the same amount of replacement characters.
--
--     Note that while this function is intended to be used with UTF-8, @maxlen@ specifies a /byte/ limit! If the limit lands in the middle of a multi-byte UTF-8 sequence, it may convert a portion of the final character to one or more Unicode character U+FFFD (REPLACEMENT CHARACTER) so as not to overflow a buffer.
--
--     @maxlen@ specifies a maximum number of bytes to compare; if the strings match to this number of bytes (or both have matched to a null-terminator character before this number of bytes), they will be considered equal.
--
--     [@str1@]: the first string to compare. NULL is not permitted!
--
--     [@str2@]: the second string to compare. NULL is not permitted!
--
--     [@maxlen@]: the maximum number of bytes to compare.
--
--     [Returns]: less than zero if str1 is \"less than\" str2, greater than zero if str1 is \"greater than\" str2, and zero if the strings match exactly.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_strncasecmp@, defined at @SDL3\/SDL_stdinc.h 3944:33@
sDL_strncasecmp
  :: BG.FunPtr
       ( PtrConst.PtrConst BG.CChar
         -> PtrConst.PtrConst BG.CChar
         -> HsBindgen.Runtime.LibC.CSize
         -> IO BG.CInt
       )
sDL_strncasecmp =
  BG.unsafePerformIO hs_bindgen_28d4c90d056ca0bb

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_strpbrk@
foreign import ccall unsafe "hs_bindgen_65f684850b2f315d"
  hs_bindgen_65f684850b2f315d_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_strpbrk@
hs_bindgen_65f684850b2f315d
  :: IO (BG.FunPtr (PtrConst.PtrConst BG.CChar -> PtrConst.PtrConst BG.CChar -> IO (BG.Ptr BG.CChar)))
hs_bindgen_65f684850b2f315d =
  BG.fromFFIType hs_bindgen_65f684850b2f315d_base

{-# NOINLINE sDL_strpbrk #-}

-- | Searches a string for the first occurrence of any character contained in a breakset, and returns a pointer from the string to that character.
--
--     [@str@]: The null-terminated string to be searched. Must not be NULL, and must not overlap with @breakset@.
--
--     [@breakset@]: A null-terminated string containing the list of characters to look for. Must not be NULL, and must not overlap with @str@.
--
--     [Returns]: A pointer to the location, in str, of the first occurrence of a character present in the breakset, or NULL if none is found.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_strpbrk@, defined at @SDL3\/SDL_stdinc.h 3962:36@
sDL_strpbrk
  :: BG.FunPtr (PtrConst.PtrConst BG.CChar -> PtrConst.PtrConst BG.CChar -> IO (BG.Ptr BG.CChar))
sDL_strpbrk =
  BG.unsafePerformIO hs_bindgen_65f684850b2f315d

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_StepUTF8@
foreign import ccall unsafe "hs_bindgen_0907aee5a9e22b6c"
  hs_bindgen_0907aee5a9e22b6c_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_StepUTF8@
hs_bindgen_0907aee5a9e22b6c
  :: IO
       (BG.FunPtr (BG.Ptr (PtrConst.PtrConst BG.CChar) -> BG.Ptr HsBindgen.Runtime.LibC.CSize -> IO Uint32))
hs_bindgen_0907aee5a9e22b6c =
  BG.fromFFIType hs_bindgen_0907aee5a9e22b6c_base

{-# NOINLINE sDL_StepUTF8 #-}

-- | Decode a UTF-8 string, one Unicode codepoint at a time.
--
--     This will return the first Unicode codepoint in the UTF-8 encoded string in @*pstr@, and then advance @*pstr@ past any consumed bytes before returning.
--
--     It will not access more than @*pslen@ bytes from the string. @*pslen@ will be adjusted, as well, subtracting the number of bytes consumed.
--
--     @pslen@ is allowed to be NULL, in which case the string /must/ be NULL-terminated, as the function will blindly read until it sees the NULL char.
--
--     if @*pslen@ is zero, it assumes the end of string is reached and returns a zero codepoint regardless of the contents of the string buffer.
--
--     If the resulting codepoint is zero (a NULL terminator), or @*pslen@ is zero, it will not advance @*pstr@ or @*pslen@ at all.
--
--     Generally this function is called in a loop until it returns zero, adjusting its parameters each iteration.
--
--     If an invalid UTF-8 sequence is encountered, this function returns SDL_INVALID_UNICODE_CODEPOINT and advances the string\/length by one byte (which is to say, a multibyte sequence might produce several SDL_INVALID_UNICODE_CODEPOINT returns before it syncs to the next valid UTF-8 sequence).
--
--     Several things can generate invalid UTF-8 sequences, including overlong encodings, the use of UTF-16 surrogate values, and truncated data. Please refer to [RFC3629](https://www.ietf.org/rfc/rfc3629.txt) for details.
--
--     [@pstr@]: a pointer to a UTF-8 string pointer to be read and adjusted.
--
--     [@pslen@]: a pointer to the number of bytes in the string, to be read and adjusted. NULL is allowed.
--
--     [Returns]: the first Unicode codepoint in the string.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_StepUTF8@, defined at @SDL3\/SDL_stdinc.h 4022:36@
sDL_StepUTF8
  :: BG.FunPtr (BG.Ptr (PtrConst.PtrConst BG.CChar) -> BG.Ptr HsBindgen.Runtime.LibC.CSize -> IO Uint32)
sDL_StepUTF8 =
  BG.unsafePerformIO hs_bindgen_0907aee5a9e22b6c

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_StepBackUTF8@
foreign import ccall unsafe "hs_bindgen_ccaed4cafbb7e45b"
  hs_bindgen_ccaed4cafbb7e45b_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_StepBackUTF8@
hs_bindgen_ccaed4cafbb7e45b
  :: IO (BG.FunPtr (PtrConst.PtrConst BG.CChar -> BG.Ptr (PtrConst.PtrConst BG.CChar) -> IO Uint32))
hs_bindgen_ccaed4cafbb7e45b =
  BG.fromFFIType hs_bindgen_ccaed4cafbb7e45b_base

{-# NOINLINE sDL_StepBackUTF8 #-}

-- | Decode a UTF-8 string in reverse, one Unicode codepoint at a time.
--
--     This will go to the start of the previous Unicode codepoint in the string, move @*pstr@ to that location and return that codepoint.
--
--     If @*pstr@ is already at the start of the string), it will not advance @*pstr@ at all.
--
--     Generally this function is called in a loop until it returns zero, adjusting its parameter each iteration.
--
--     If an invalid UTF-8 sequence is encountered, this function returns SDL_INVALID_UNICODE_CODEPOINT.
--
--     Several things can generate invalid UTF-8 sequences, including overlong encodings, the use of UTF-16 surrogate values, and truncated data. Please refer to [RFC3629](https://www.ietf.org/rfc/rfc3629.txt) for details.
--
--     [@start@]: a pointer to the beginning of the UTF-8 string.
--
--     [@pstr@]: a pointer to a UTF-8 string pointer to be read and adjusted.
--
--     [Returns]: the previous Unicode codepoint in the string.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_StepBackUTF8@, defined at @SDL3\/SDL_stdinc.h 4053:36@
sDL_StepBackUTF8
  :: BG.FunPtr (PtrConst.PtrConst BG.CChar -> BG.Ptr (PtrConst.PtrConst BG.CChar) -> IO Uint32)
sDL_StepBackUTF8 =
  BG.unsafePerformIO hs_bindgen_ccaed4cafbb7e45b

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_UCS4ToUTF8@
foreign import ccall unsafe "hs_bindgen_d8d90fbed44bffa4"
  hs_bindgen_d8d90fbed44bffa4_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_UCS4ToUTF8@
hs_bindgen_d8d90fbed44bffa4 :: IO (BG.FunPtr (Uint32 -> BG.Ptr BG.CChar -> IO (BG.Ptr BG.CChar)))
hs_bindgen_d8d90fbed44bffa4 =
  BG.fromFFIType hs_bindgen_d8d90fbed44bffa4_base

{-# NOINLINE sDL_UCS4ToUTF8 #-}

-- | Convert a single Unicode codepoint to UTF-8.
--
--     The buffer pointed to by @dst@ must be at least 4 bytes long, as this function may generate between 1 and 4 bytes of output.
--
--     This function returns the first byte /after/ the newly-written UTF-8 sequence, which is useful for encoding multiple codepoints in a loop, or knowing where to write a NULL-terminator character to end the string (in either case, plan to have a buffer of /more/ than 4 bytes!).
--
--     If @codepoint@ is an invalid value (outside the Unicode range, or a UTF-16 surrogate value, etc), this will use U+FFFD (REPLACEMENT CHARACTER) for the codepoint instead, and not set an error.
--
--     If @dst@ is NULL, this returns NULL immediately without writing to the pointer and without setting an error.
--
--     [@codepoint@]: a Unicode codepoint to convert to UTF-8.
--
--     [@dst@]: the location to write the encoded UTF-8. Must point to at least 4 bytes!
--
--     [Returns]: the first byte past the newly-written UTF-8 sequence.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_UCS4ToUTF8@, defined at @SDL3\/SDL_stdinc.h 4082:36@
sDL_UCS4ToUTF8 :: BG.FunPtr (Uint32 -> BG.Ptr BG.CChar -> IO (BG.Ptr BG.CChar))
sDL_UCS4ToUTF8 =
  BG.unsafePerformIO hs_bindgen_d8d90fbed44bffa4

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_srand@
foreign import ccall unsafe "hs_bindgen_da73119d08a07679"
  hs_bindgen_da73119d08a07679_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_srand@
hs_bindgen_da73119d08a07679 :: IO (BG.FunPtr (Uint64 -> IO ()))
hs_bindgen_da73119d08a07679 =
  BG.fromFFIType hs_bindgen_da73119d08a07679_base

{-# NOINLINE sDL_srand #-}

-- | Seeds the pseudo-random number generator.
--
--     Reusing the seed number will cause @SDL_rand()@ to repeat the same stream of \'random\' numbers.
--
--     [@seed@]: the value to use as a random number seed, or 0 to use SDL_GetPerformanceCounter().
--
--     [Thread safety]: This should be called on the same thread that calls @SDL_rand()@
--
--     @since 3.2.0
--
--     [See also]: 'sDL_rand', 'sDL_rand_bits', 'sDL_randf'
--
--     [C declaration]: @SDL_srand@, defined at @SDL3\/SDL_stdinc.h 4294:34@
sDL_srand :: BG.FunPtr (Uint64 -> IO ())
sDL_srand =
  BG.unsafePerformIO hs_bindgen_da73119d08a07679

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_rand@
foreign import ccall unsafe "hs_bindgen_4e5afaafc53503d2"
  hs_bindgen_4e5afaafc53503d2_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_rand@
hs_bindgen_4e5afaafc53503d2 :: IO (BG.FunPtr (Sint32 -> IO Sint32))
hs_bindgen_4e5afaafc53503d2 =
  BG.fromFFIType hs_bindgen_4e5afaafc53503d2_base

{-# NOINLINE sDL_rand #-}

-- | Generate a pseudo-random number less than n for positive n
--
--     The method used is faster and of better quality than @rand() % n@. Odds are roughly 99.9% even for n = 1 million. Evenness is better for smaller n, and much worse as n gets bigger.
--
--     Example: to simulate a d6 use @SDL_rand(6) + 1@ The +1 converts 0..5 to 1..6
--
--     If you want to generate a pseudo-random number in the full range of 'Sint32', you should use: ('Sint32') @SDL_rand_bits()@
--
--     If you want reproducible output, be sure to initialize with @SDL_srand()@ first.
--
--     There are no guarantees as to the quality of the random sequence produced, and this should not be used for security (cryptography, passwords) or where money is on the line (loot-boxes, casinos). There are many random number libraries available with different characteristics and you should pick one of those to meet any serious needs.
--
--     [@n@]: the number of possible outcomes. n must be positive.
--
--     [Returns]: a random value in the range of [0 .. n-1].
--
--     [Thread safety]: All calls should be made from a single thread
--
--     @since 3.2.0
--
--     [See also]: 'sDL_srand', 'sDL_randf'
--
--     [C declaration]: @SDL_rand@, defined at @SDL3\/SDL_stdinc.h 4328:36@
sDL_rand :: BG.FunPtr (Sint32 -> IO Sint32)
sDL_rand =
  BG.unsafePerformIO hs_bindgen_4e5afaafc53503d2

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_randf@
foreign import ccall unsafe "hs_bindgen_e6a11f5c2731e306"
  hs_bindgen_e6a11f5c2731e306_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_randf@
hs_bindgen_e6a11f5c2731e306 :: IO (BG.FunPtr (IO BG.CFloat))
hs_bindgen_e6a11f5c2731e306 =
  BG.fromFFIType hs_bindgen_e6a11f5c2731e306_base

{-# NOINLINE sDL_randf #-}

-- | Generate a uniform pseudo-random floating point number less than 1.0
--
--     If you want reproducible output, be sure to initialize with @SDL_srand()@ first.
--
--     There are no guarantees as to the quality of the random sequence produced, and this should not be used for security (cryptography, passwords) or where money is on the line (loot-boxes, casinos). There are many random number libraries available with different characteristics and you should pick one of those to meet any serious needs.
--
--     [Returns]: a random value in the range of [0.0, 1.0).
--
--     [Thread safety]: All calls should be made from a single thread
--
--     @since 3.2.0
--
--     [See also]: 'sDL_srand', 'sDL_rand'
--
--     [C declaration]: @SDL_randf@, defined at @SDL3\/SDL_stdinc.h 4351:35@
sDL_randf :: BG.FunPtr (IO BG.CFloat)
sDL_randf =
  BG.unsafePerformIO hs_bindgen_e6a11f5c2731e306

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_rand_bits@
foreign import ccall unsafe "hs_bindgen_1b4a072c67be4b47"
  hs_bindgen_1b4a072c67be4b47_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_rand_bits@
hs_bindgen_1b4a072c67be4b47 :: IO (BG.FunPtr (IO Uint32))
hs_bindgen_1b4a072c67be4b47 =
  BG.fromFFIType hs_bindgen_1b4a072c67be4b47_base

{-# NOINLINE sDL_rand_bits #-}

-- | Generate 32 pseudo-random bits.
--
--     You likely want to use @SDL_rand()@ to get a psuedo-random number instead.
--
--     There are no guarantees as to the quality of the random sequence produced, and this should not be used for security (cryptography, passwords) or where money is on the line (loot-boxes, casinos). There are many random number libraries available with different characteristics and you should pick one of those to meet any serious needs.
--
--     [Returns]: a random value in the range of [0-SDL_MAX_UINT32].
--
--     [Thread safety]: All calls should be made from a single thread
--
--     @since 3.2.0
--
--     [See also]: 'sDL_rand', 'sDL_randf', 'sDL_srand'
--
--     [C declaration]: @SDL_rand_bits@, defined at @SDL3\/SDL_stdinc.h 4374:36@
sDL_rand_bits :: BG.FunPtr (IO Uint32)
sDL_rand_bits =
  BG.unsafePerformIO hs_bindgen_1b4a072c67be4b47

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_rand_r@
foreign import ccall unsafe "hs_bindgen_b7805b04f67ee663"
  hs_bindgen_b7805b04f67ee663_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_rand_r@
hs_bindgen_b7805b04f67ee663 :: IO (BG.FunPtr (BG.Ptr Uint64 -> Sint32 -> IO Sint32))
hs_bindgen_b7805b04f67ee663 =
  BG.fromFFIType hs_bindgen_b7805b04f67ee663_base

{-# NOINLINE sDL_rand_r #-}

-- | Generate a pseudo-random number less than n for positive n
--
--     The method used is faster and of better quality than @rand() % n@. Odds are roughly 99.9% even for n = 1 million. Evenness is better for smaller n, and much worse as n gets bigger.
--
--     Example: to simulate a d6 use @SDL_rand_r(state, 6) + 1@ The +1 converts 0..5 to 1..6
--
--     If you want to generate a pseudo-random number in the full range of 'Sint32', you should use: ('Sint32')SDL_rand_bits_r(state)
--
--     There are no guarantees as to the quality of the random sequence produced, and this should not be used for security (cryptography, passwords) or where money is on the line (loot-boxes, casinos). There are many random number libraries available with different characteristics and you should pick one of those to meet any serious needs.
--
--     [@state@]: a pointer to the current random number state, this may not be NULL.
--
--     [@n@]: the number of possible outcomes. n must be positive.
--
--     [Returns]: a random value in the range of [0 .. n-1].
--
--     [Thread safety]: This function is thread-safe, as long as the state pointer isn\'t shared between threads.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_rand', 'sDL_rand_bits_r', 'sDL_randf_r'
--
--     [C declaration]: @SDL_rand_r@, defined at @SDL3\/SDL_stdinc.h 4409:36@
sDL_rand_r :: BG.FunPtr (BG.Ptr Uint64 -> Sint32 -> IO Sint32)
sDL_rand_r =
  BG.unsafePerformIO hs_bindgen_b7805b04f67ee663

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_randf_r@
foreign import ccall unsafe "hs_bindgen_2868c0dca829c12d"
  hs_bindgen_2868c0dca829c12d_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_randf_r@
hs_bindgen_2868c0dca829c12d :: IO (BG.FunPtr (BG.Ptr Uint64 -> IO BG.CFloat))
hs_bindgen_2868c0dca829c12d =
  BG.fromFFIType hs_bindgen_2868c0dca829c12d_base

{-# NOINLINE sDL_randf_r #-}

-- | Generate a uniform pseudo-random floating point number less than 1.0
--
--     If you want reproducible output, be sure to initialize with @SDL_srand()@ first.
--
--     There are no guarantees as to the quality of the random sequence produced, and this should not be used for security (cryptography, passwords) or where money is on the line (loot-boxes, casinos). There are many random number libraries available with different characteristics and you should pick one of those to meet any serious needs.
--
--     [@state@]: a pointer to the current random number state, this may not be NULL.
--
--     [Returns]: a random value in the range of [0.0, 1.0).
--
--     [Thread safety]: This function is thread-safe, as long as the state pointer isn\'t shared between threads.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_rand_bits_r', 'sDL_rand_r', 'sDL_randf'
--
--     [C declaration]: @SDL_randf_r@, defined at @SDL3\/SDL_stdinc.h 4436:35@
sDL_randf_r :: BG.FunPtr (BG.Ptr Uint64 -> IO BG.CFloat)
sDL_randf_r =
  BG.unsafePerformIO hs_bindgen_2868c0dca829c12d

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_rand_bits_r@
foreign import ccall unsafe "hs_bindgen_4f041e8bf307388e"
  hs_bindgen_4f041e8bf307388e_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_rand_bits_r@
hs_bindgen_4f041e8bf307388e :: IO (BG.FunPtr (BG.Ptr Uint64 -> IO Uint32))
hs_bindgen_4f041e8bf307388e =
  BG.fromFFIType hs_bindgen_4f041e8bf307388e_base

{-# NOINLINE sDL_rand_bits_r #-}

-- | Generate 32 pseudo-random bits.
--
--     You likely want to use @SDL_rand_r()@ to get a psuedo-random number instead.
--
--     There are no guarantees as to the quality of the random sequence produced, and this should not be used for security (cryptography, passwords) or where money is on the line (loot-boxes, casinos). There are many random number libraries available with different characteristics and you should pick one of those to meet any serious needs.
--
--     [@state@]: a pointer to the current random number state, this may not be NULL.
--
--     [Returns]: a random value in the range of [0-SDL_MAX_UINT32].
--
--     [Thread safety]: This function is thread-safe, as long as the state pointer isn\'t shared between threads.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_rand_r', 'sDL_randf_r'
--
--     [C declaration]: @SDL_rand_bits_r@, defined at @SDL3\/SDL_stdinc.h 4461:36@
sDL_rand_bits_r :: BG.FunPtr (BG.Ptr Uint64 -> IO Uint32)
sDL_rand_bits_r =
  BG.unsafePerformIO hs_bindgen_4f041e8bf307388e

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_acos@
foreign import ccall unsafe "hs_bindgen_fc7fee2483850ab3"
  hs_bindgen_fc7fee2483850ab3_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_acos@
hs_bindgen_fc7fee2483850ab3 :: IO (BG.FunPtr (BG.CDouble -> IO BG.CDouble))
hs_bindgen_fc7fee2483850ab3 =
  BG.fromFFIType hs_bindgen_fc7fee2483850ab3_base

{-# NOINLINE sDL_acos #-}

-- | Compute the arc cosine of @x@.
--
--     The definition of @y = acos(x)@ is @x = cos(y)@.
--
--     Domain: @-1 \<= x \<= 1@
--
--     Range: @0 \<= y \<= Pi@
--
--     This function operates on double-precision floating point values, use SDL_acosf for single-precision floats.
--
--     This function may use a different approximation across different versions, platforms and configurations. i.e, it can return a different value given the same input on different machines or operating systems, or if SDL is updated.
--
--     [@x@]: floating point value.
--
--     [Returns]: arc cosine of @x@, in radians.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_acosf', 'sDL_asin', 'sDL_cos'
--
--     [C declaration]: @SDL_acos@, defined at @SDL3\/SDL_stdinc.h 4515:36@
sDL_acos :: BG.FunPtr (BG.CDouble -> IO BG.CDouble)
sDL_acos =
  BG.unsafePerformIO hs_bindgen_fc7fee2483850ab3

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_acosf@
foreign import ccall unsafe "hs_bindgen_521ecf135cd97997"
  hs_bindgen_521ecf135cd97997_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_acosf@
hs_bindgen_521ecf135cd97997 :: IO (BG.FunPtr (BG.CFloat -> IO BG.CFloat))
hs_bindgen_521ecf135cd97997 =
  BG.fromFFIType hs_bindgen_521ecf135cd97997_base

{-# NOINLINE sDL_acosf #-}

-- | Compute the arc cosine of @x@.
--
--     The definition of @y = acos(x)@ is @x = cos(y)@.
--
--     Domain: @-1 \<= x \<= 1@
--
--     Range: @0 \<= y \<= Pi@
--
--     This function operates on single-precision floating point values, use SDL_acos for double-precision floats.
--
--     This function may use a different approximation across different versions, platforms and configurations. i.e, it can return a different value given the same input on different machines or operating systems, or if SDL is updated.
--
--     [@x@]: floating point value.
--
--     [Returns]: arc cosine of @x@, in radians.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_acos', 'sDL_asinf', 'sDL_cosf'
--
--     [C declaration]: @SDL_acosf@, defined at @SDL3\/SDL_stdinc.h 4545:35@
sDL_acosf :: BG.FunPtr (BG.CFloat -> IO BG.CFloat)
sDL_acosf =
  BG.unsafePerformIO hs_bindgen_521ecf135cd97997

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_asin@
foreign import ccall unsafe "hs_bindgen_0446975347dc0e74"
  hs_bindgen_0446975347dc0e74_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_asin@
hs_bindgen_0446975347dc0e74 :: IO (BG.FunPtr (BG.CDouble -> IO BG.CDouble))
hs_bindgen_0446975347dc0e74 =
  BG.fromFFIType hs_bindgen_0446975347dc0e74_base

{-# NOINLINE sDL_asin #-}

-- | Compute the arc sine of @x@.
--
--     The definition of @y = asin(x)@ is @x = sin(y)@.
--
--     Domain: @-1 \<= x \<= 1@
--
--     Range: @-Pi\/2 \<= y \<= Pi\/2@
--
--     This function operates on double-precision floating point values, use SDL_asinf for single-precision floats.
--
--     This function may use a different approximation across different versions, platforms and configurations. i.e, it can return a different value given the same input on different machines or operating systems, or if SDL is updated.
--
--     [@x@]: floating point value.
--
--     [Returns]: arc sine of @x@, in radians.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_asinf', 'sDL_acos', 'sDL_sin'
--
--     [C declaration]: @SDL_asin@, defined at @SDL3\/SDL_stdinc.h 4575:36@
sDL_asin :: BG.FunPtr (BG.CDouble -> IO BG.CDouble)
sDL_asin =
  BG.unsafePerformIO hs_bindgen_0446975347dc0e74

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_asinf@
foreign import ccall unsafe "hs_bindgen_6069a6cbf645d9a4"
  hs_bindgen_6069a6cbf645d9a4_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_asinf@
hs_bindgen_6069a6cbf645d9a4 :: IO (BG.FunPtr (BG.CFloat -> IO BG.CFloat))
hs_bindgen_6069a6cbf645d9a4 =
  BG.fromFFIType hs_bindgen_6069a6cbf645d9a4_base

{-# NOINLINE sDL_asinf #-}

-- | Compute the arc sine of @x@.
--
--     The definition of @y = asin(x)@ is @x = sin(y)@.
--
--     Domain: @-1 \<= x \<= 1@
--
--     Range: @-Pi\/2 \<= y \<= Pi\/2@
--
--     This function operates on single-precision floating point values, use SDL_asin for double-precision floats.
--
--     This function may use a different approximation across different versions, platforms and configurations. i.e, it can return a different value given the same input on different machines or operating systems, or if SDL is updated.
--
--     [@x@]: floating point value.
--
--     [Returns]: arc sine of @x@, in radians.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_asin', 'sDL_acosf', 'sDL_sinf'
--
--     [C declaration]: @SDL_asinf@, defined at @SDL3\/SDL_stdinc.h 4605:35@
sDL_asinf :: BG.FunPtr (BG.CFloat -> IO BG.CFloat)
sDL_asinf =
  BG.unsafePerformIO hs_bindgen_6069a6cbf645d9a4

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_atan@
foreign import ccall unsafe "hs_bindgen_eb9c094d5b8cc44a"
  hs_bindgen_eb9c094d5b8cc44a_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_atan@
hs_bindgen_eb9c094d5b8cc44a :: IO (BG.FunPtr (BG.CDouble -> IO BG.CDouble))
hs_bindgen_eb9c094d5b8cc44a =
  BG.fromFFIType hs_bindgen_eb9c094d5b8cc44a_base

{-# NOINLINE sDL_atan #-}

-- | Compute the arc tangent of @x@.
--
--     The definition of @y = atan(x)@ is @x = tan(y)@.
--
--     Domain: @-INF \<= x \<= INF@
--
--     Range: @-Pi\/2 \<= y \<= Pi\/2@
--
--     This function operates on double-precision floating point values, use SDL_atanf for single-precision floats.
--
--     To calculate the arc tangent of y \/ x, use SDL_atan2.
--
--     This function may use a different approximation across different versions, platforms and configurations. i.e, it can return a different value given the same input on different machines or operating systems, or if SDL is updated.
--
--     [@x@]: floating point value.
--
--     [Returns]: arc tangent of of @x@ in radians, or 0 if @x = 0@.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_atanf', 'sDL_atan2', 'sDL_tan'
--
--     [C declaration]: @SDL_atan@, defined at @SDL3\/SDL_stdinc.h 4637:36@
sDL_atan :: BG.FunPtr (BG.CDouble -> IO BG.CDouble)
sDL_atan =
  BG.unsafePerformIO hs_bindgen_eb9c094d5b8cc44a

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_atanf@
foreign import ccall unsafe "hs_bindgen_9807f179a4fbb908"
  hs_bindgen_9807f179a4fbb908_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_atanf@
hs_bindgen_9807f179a4fbb908 :: IO (BG.FunPtr (BG.CFloat -> IO BG.CFloat))
hs_bindgen_9807f179a4fbb908 =
  BG.fromFFIType hs_bindgen_9807f179a4fbb908_base

{-# NOINLINE sDL_atanf #-}

-- | Compute the arc tangent of @x@.
--
--     The definition of @y = atan(x)@ is @x = tan(y)@.
--
--     Domain: @-INF \<= x \<= INF@
--
--     Range: @-Pi\/2 \<= y \<= Pi\/2@
--
--     This function operates on single-precision floating point values, use SDL_atan for dboule-precision floats.
--
--     To calculate the arc tangent of y \/ x, use SDL_atan2f.
--
--     This function may use a different approximation across different versions, platforms and configurations. i.e, it can return a different value given the same input on different machines or operating systems, or if SDL is updated.
--
--     [@x@]: floating point value.
--
--     [Returns]: arc tangent of of @x@ in radians, or 0 if @x = 0@.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_atan', 'sDL_atan2f', 'sDL_tanf'
--
--     [C declaration]: @SDL_atanf@, defined at @SDL3\/SDL_stdinc.h 4669:35@
sDL_atanf :: BG.FunPtr (BG.CFloat -> IO BG.CFloat)
sDL_atanf =
  BG.unsafePerformIO hs_bindgen_9807f179a4fbb908

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_atan2@
foreign import ccall unsafe "hs_bindgen_c868e29b9251ada8"
  hs_bindgen_c868e29b9251ada8_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_atan2@
hs_bindgen_c868e29b9251ada8 :: IO (BG.FunPtr (BG.CDouble -> BG.CDouble -> IO BG.CDouble))
hs_bindgen_c868e29b9251ada8 =
  BG.fromFFIType hs_bindgen_c868e29b9251ada8_base

{-# NOINLINE sDL_atan2 #-}

-- | Compute the arc tangent of @y \/ x@, using the signs of x and y to adjust the result\'s quadrant.
--
--     The definition of @z = atan2(x, y)@ is @y = x tan(z)@, where the quadrant of z is determined based on the signs of x and y.
--
--     Domain: @-INF \<= x \<= INF@, @-INF \<= y \<= INF@
--
--     Range: @-Pi \<= y \<= Pi@
--
--     This function operates on double-precision floating point values, use SDL_atan2f for single-precision floats.
--
--     To calculate the arc tangent of a single value, use SDL_atan.
--
--     This function may use a different approximation across different versions, platforms and configurations. i.e, it can return a different value given the same input on different machines or operating systems, or if SDL is updated.
--
--     [@y@]: floating point value of the numerator (y coordinate).
--
--     [@x@]: floating point value of the denominator (x coordinate).
--
--     [Returns]: arc tangent of of @y \/ x@ in radians, or, if @x = 0@, either @-Pi\/2@, @0@, or @Pi\/2@, depending on the value of @y@.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_atan2f', 'sDL_atan', 'sDL_tan'
--
--     [C declaration]: @SDL_atan2@, defined at @SDL3\/SDL_stdinc.h 4705:36@
sDL_atan2 :: BG.FunPtr (BG.CDouble -> BG.CDouble -> IO BG.CDouble)
sDL_atan2 =
  BG.unsafePerformIO hs_bindgen_c868e29b9251ada8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_atan2f@
foreign import ccall unsafe "hs_bindgen_357a95d359b4aaad"
  hs_bindgen_357a95d359b4aaad_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_atan2f@
hs_bindgen_357a95d359b4aaad :: IO (BG.FunPtr (BG.CFloat -> BG.CFloat -> IO BG.CFloat))
hs_bindgen_357a95d359b4aaad =
  BG.fromFFIType hs_bindgen_357a95d359b4aaad_base

{-# NOINLINE sDL_atan2f #-}

-- | Compute the arc tangent of @y \/ x@, using the signs of x and y to adjust the result\'s quadrant.
--
--     The definition of @z = atan2(x, y)@ is @y = x tan(z)@, where the quadrant of z is determined based on the signs of x and y.
--
--     Domain: @-INF \<= x \<= INF@, @-INF \<= y \<= INF@
--
--     Range: @-Pi \<= y \<= Pi@
--
--     This function operates on single-precision floating point values, use SDL_atan2 for double-precision floats.
--
--     To calculate the arc tangent of a single value, use SDL_atanf.
--
--     This function may use a different approximation across different versions, platforms and configurations. i.e, it can return a different value given the same input on different machines or operating systems, or if SDL is updated.
--
--     [@y@]: floating point value of the numerator (y coordinate).
--
--     [@x@]: floating point value of the denominator (x coordinate).
--
--     [Returns]: arc tangent of of @y \/ x@ in radians, or, if @x = 0@, either @-Pi\/2@, @0@, or @Pi\/2@, depending on the value of @y@.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_atan2', 'sDL_atan', 'sDL_tan'
--
--     [C declaration]: @SDL_atan2f@, defined at @SDL3\/SDL_stdinc.h 4741:35@
sDL_atan2f :: BG.FunPtr (BG.CFloat -> BG.CFloat -> IO BG.CFloat)
sDL_atan2f =
  BG.unsafePerformIO hs_bindgen_357a95d359b4aaad

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_ceil@
foreign import ccall unsafe "hs_bindgen_51763cbf0b798de3"
  hs_bindgen_51763cbf0b798de3_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_ceil@
hs_bindgen_51763cbf0b798de3 :: IO (BG.FunPtr (BG.CDouble -> IO BG.CDouble))
hs_bindgen_51763cbf0b798de3 =
  BG.fromFFIType hs_bindgen_51763cbf0b798de3_base

{-# NOINLINE sDL_ceil #-}

-- | Compute the ceiling of @x@.
--
--     The ceiling of @x@ is the smallest integer @y@ such that @y >= x@, i.e @x@ rounded up to the nearest integer.
--
--     Domain: @-INF \<= x \<= INF@
--
--     Range: @-INF \<= y \<= INF@, y integer
--
--     This function operates on double-precision floating point values, use SDL_ceilf for single-precision floats.
--
--     [@x@]: floating point value.
--
--     [Returns]: the ceiling of @x@.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_ceilf', 'sDL_floor', 'sDL_trunc', 'sDL_round', @SDL_lround@
--
--     [C declaration]: @SDL_ceil@, defined at @SDL3\/SDL_stdinc.h 4769:36@
sDL_ceil :: BG.FunPtr (BG.CDouble -> IO BG.CDouble)
sDL_ceil =
  BG.unsafePerformIO hs_bindgen_51763cbf0b798de3

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_ceilf@
foreign import ccall unsafe "hs_bindgen_362325253c9b19f8"
  hs_bindgen_362325253c9b19f8_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_ceilf@
hs_bindgen_362325253c9b19f8 :: IO (BG.FunPtr (BG.CFloat -> IO BG.CFloat))
hs_bindgen_362325253c9b19f8 =
  BG.fromFFIType hs_bindgen_362325253c9b19f8_base

{-# NOINLINE sDL_ceilf #-}

-- | Compute the ceiling of @x@.
--
--     The ceiling of @x@ is the smallest integer @y@ such that @y >= x@, i.e @x@ rounded up to the nearest integer.
--
--     Domain: @-INF \<= x \<= INF@
--
--     Range: @-INF \<= y \<= INF@, y integer
--
--     This function operates on single-precision floating point values, use SDL_ceil for double-precision floats.
--
--     [@x@]: floating point value.
--
--     [Returns]: the ceiling of @x@.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_ceil', 'sDL_floorf', 'sDL_truncf', 'sDL_roundf', @SDL_lroundf@
--
--     [C declaration]: @SDL_ceilf@, defined at @SDL3\/SDL_stdinc.h 4797:35@
sDL_ceilf :: BG.FunPtr (BG.CFloat -> IO BG.CFloat)
sDL_ceilf =
  BG.unsafePerformIO hs_bindgen_362325253c9b19f8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_copysign@
foreign import ccall unsafe "hs_bindgen_df3beaabf480a0d3"
  hs_bindgen_df3beaabf480a0d3_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_copysign@
hs_bindgen_df3beaabf480a0d3 :: IO (BG.FunPtr (BG.CDouble -> BG.CDouble -> IO BG.CDouble))
hs_bindgen_df3beaabf480a0d3 =
  BG.fromFFIType hs_bindgen_df3beaabf480a0d3_base

{-# NOINLINE sDL_copysign #-}

-- | Copy the sign of one floating-point value to another.
--
--     The definition of copysign is that @copysign(x, y) = abs(x) * sign(y)@.
--
--     Domain: @-INF \<= x \<= INF@, @-INF \<= y \<= f@
--
--     Range: @-INF \<= z \<= INF@
--
--     This function operates on double-precision floating point values, use SDL_copysignf for single-precision floats.
--
--     [@x@]: floating point value to use as the magnitude.
--
--     [@y@]: floating point value to use as the sign.
--
--     [Returns]: the floating point value with the sign of y and the magnitude of x.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_copysignf', 'sDL_fabs'
--
--     [C declaration]: @SDL_copysign@, defined at @SDL3\/SDL_stdinc.h 4823:36@
sDL_copysign :: BG.FunPtr (BG.CDouble -> BG.CDouble -> IO BG.CDouble)
sDL_copysign =
  BG.unsafePerformIO hs_bindgen_df3beaabf480a0d3

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_copysignf@
foreign import ccall unsafe "hs_bindgen_e6af77974ed5435f"
  hs_bindgen_e6af77974ed5435f_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_copysignf@
hs_bindgen_e6af77974ed5435f :: IO (BG.FunPtr (BG.CFloat -> BG.CFloat -> IO BG.CFloat))
hs_bindgen_e6af77974ed5435f =
  BG.fromFFIType hs_bindgen_e6af77974ed5435f_base

{-# NOINLINE sDL_copysignf #-}

-- | Copy the sign of one floating-point value to another.
--
--     The definition of copysign is that @copysign(x, y) = abs(x) * sign(y)@.
--
--     Domain: @-INF \<= x \<= INF@, @-INF \<= y \<= f@
--
--     Range: @-INF \<= z \<= INF@
--
--     This function operates on single-precision floating point values, use SDL_copysign for double-precision floats.
--
--     [@x@]: floating point value to use as the magnitude.
--
--     [@y@]: floating point value to use as the sign.
--
--     [Returns]: the floating point value with the sign of y and the magnitude of x.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_copysign', 'sDL_fabsf'
--
--     [C declaration]: @SDL_copysignf@, defined at @SDL3\/SDL_stdinc.h 4849:35@
sDL_copysignf :: BG.FunPtr (BG.CFloat -> BG.CFloat -> IO BG.CFloat)
sDL_copysignf =
  BG.unsafePerformIO hs_bindgen_e6af77974ed5435f

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_cos@
foreign import ccall unsafe "hs_bindgen_3d9b0e8a53288293"
  hs_bindgen_3d9b0e8a53288293_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_cos@
hs_bindgen_3d9b0e8a53288293 :: IO (BG.FunPtr (BG.CDouble -> IO BG.CDouble))
hs_bindgen_3d9b0e8a53288293 =
  BG.fromFFIType hs_bindgen_3d9b0e8a53288293_base

{-# NOINLINE sDL_cos #-}

-- | Compute the cosine of @x@.
--
--     Domain: @-INF \<= x \<= INF@
--
--     Range: @-1 \<= y \<= 1@
--
--     This function operates on double-precision floating point values, use SDL_cosf for single-precision floats.
--
--     This function may use a different approximation across different versions, platforms and configurations. i.e, it can return a different value given the same input on different machines or operating systems, or if SDL is updated.
--
--     [@x@]: floating point value, in radians.
--
--     [Returns]: cosine of @x@.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_cosf', 'sDL_acos', 'sDL_sin'
--
--     [C declaration]: @SDL_cos@, defined at @SDL3\/SDL_stdinc.h 4877:36@
sDL_cos :: BG.FunPtr (BG.CDouble -> IO BG.CDouble)
sDL_cos =
  BG.unsafePerformIO hs_bindgen_3d9b0e8a53288293

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_cosf@
foreign import ccall unsafe "hs_bindgen_8a6d19c21d08744f"
  hs_bindgen_8a6d19c21d08744f_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_cosf@
hs_bindgen_8a6d19c21d08744f :: IO (BG.FunPtr (BG.CFloat -> IO BG.CFloat))
hs_bindgen_8a6d19c21d08744f =
  BG.fromFFIType hs_bindgen_8a6d19c21d08744f_base

{-# NOINLINE sDL_cosf #-}

-- | Compute the cosine of @x@.
--
--     Domain: @-INF \<= x \<= INF@
--
--     Range: @-1 \<= y \<= 1@
--
--     This function operates on single-precision floating point values, use SDL_cos for double-precision floats.
--
--     This function may use a different approximation across different versions, platforms and configurations. i.e, it can return a different value given the same input on different machines or operating systems, or if SDL is updated.
--
--     [@x@]: floating point value, in radians.
--
--     [Returns]: cosine of @x@.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_cos', 'sDL_acosf', 'sDL_sinf'
--
--     [C declaration]: @SDL_cosf@, defined at @SDL3\/SDL_stdinc.h 4905:35@
sDL_cosf :: BG.FunPtr (BG.CFloat -> IO BG.CFloat)
sDL_cosf =
  BG.unsafePerformIO hs_bindgen_8a6d19c21d08744f

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_exp@
foreign import ccall unsafe "hs_bindgen_32a0ab5c8aca638e"
  hs_bindgen_32a0ab5c8aca638e_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_exp@
hs_bindgen_32a0ab5c8aca638e :: IO (BG.FunPtr (BG.CDouble -> IO BG.CDouble))
hs_bindgen_32a0ab5c8aca638e =
  BG.fromFFIType hs_bindgen_32a0ab5c8aca638e_base

{-# NOINLINE sDL_exp #-}

-- | Compute the exponential of @x@.
--
--     The definition of @y = exp(x)@ is @y = e^x@, where @e@ is the base of the natural logarithm. The inverse is the natural logarithm, SDL_log.
--
--     Domain: @-INF \<= x \<= INF@
--
--     Range: @0 \<= y \<= INF@
--
--     The output will overflow if @exp(x)@ is too large to be represented.
--
--     This function operates on double-precision floating point values, use SDL_expf for single-precision floats.
--
--     This function may use a different approximation across different versions, platforms and configurations. i.e, it can return a different value given the same input on different machines or operating systems, or if SDL is updated.
--
--     [@x@]: floating point value.
--
--     [Returns]: value of @e^x@.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_expf', 'sDL_log'
--
--     [C declaration]: @SDL_exp@, defined at @SDL3\/SDL_stdinc.h 4937:36@
sDL_exp :: BG.FunPtr (BG.CDouble -> IO BG.CDouble)
sDL_exp =
  BG.unsafePerformIO hs_bindgen_32a0ab5c8aca638e

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_expf@
foreign import ccall unsafe "hs_bindgen_e734b446bd66b310"
  hs_bindgen_e734b446bd66b310_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_expf@
hs_bindgen_e734b446bd66b310 :: IO (BG.FunPtr (BG.CFloat -> IO BG.CFloat))
hs_bindgen_e734b446bd66b310 =
  BG.fromFFIType hs_bindgen_e734b446bd66b310_base

{-# NOINLINE sDL_expf #-}

-- | Compute the exponential of @x@.
--
--     The definition of @y = exp(x)@ is @y = e^x@, where @e@ is the base of the natural logarithm. The inverse is the natural logarithm, SDL_logf.
--
--     Domain: @-INF \<= x \<= INF@
--
--     Range: @0 \<= y \<= INF@
--
--     The output will overflow if @exp(x)@ is too large to be represented.
--
--     This function operates on single-precision floating point values, use SDL_exp for double-precision floats.
--
--     This function may use a different approximation across different versions, platforms and configurations. i.e, it can return a different value given the same input on different machines or operating systems, or if SDL is updated.
--
--     [@x@]: floating point value.
--
--     [Returns]: value of @e^x@.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_exp', 'sDL_logf'
--
--     [C declaration]: @SDL_expf@, defined at @SDL3\/SDL_stdinc.h 4969:35@
sDL_expf :: BG.FunPtr (BG.CFloat -> IO BG.CFloat)
sDL_expf =
  BG.unsafePerformIO hs_bindgen_e734b446bd66b310

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_fabs@
foreign import ccall unsafe "hs_bindgen_0fe1f848b90d29bc"
  hs_bindgen_0fe1f848b90d29bc_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_fabs@
hs_bindgen_0fe1f848b90d29bc :: IO (BG.FunPtr (BG.CDouble -> IO BG.CDouble))
hs_bindgen_0fe1f848b90d29bc =
  BG.fromFFIType hs_bindgen_0fe1f848b90d29bc_base

{-# NOINLINE sDL_fabs #-}

-- | Compute the absolute value of @x@
--
--     Domain: @-INF \<= x \<= INF@
--
--     Range: @0 \<= y \<= INF@
--
--     This function operates on double-precision floating point values, use SDL_fabsf for single-precision floats.
--
--     [@x@]: floating point value to use as the magnitude.
--
--     [Returns]: the absolute value of @x@.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_fabsf'
--
--     [C declaration]: @SDL_fabs@, defined at @SDL3\/SDL_stdinc.h 4990:36@
sDL_fabs :: BG.FunPtr (BG.CDouble -> IO BG.CDouble)
sDL_fabs =
  BG.unsafePerformIO hs_bindgen_0fe1f848b90d29bc

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_fabsf@
foreign import ccall unsafe "hs_bindgen_1e189b3e959f375b"
  hs_bindgen_1e189b3e959f375b_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_fabsf@
hs_bindgen_1e189b3e959f375b :: IO (BG.FunPtr (BG.CFloat -> IO BG.CFloat))
hs_bindgen_1e189b3e959f375b =
  BG.fromFFIType hs_bindgen_1e189b3e959f375b_base

{-# NOINLINE sDL_fabsf #-}

-- | Compute the absolute value of @x@
--
--     Domain: @-INF \<= x \<= INF@
--
--     Range: @0 \<= y \<= INF@
--
--     This function operates on single-precision floating point values, use SDL_fabs for double-precision floats.
--
--     [@x@]: floating point value to use as the magnitude.
--
--     [Returns]: the absolute value of @x@.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_fabs'
--
--     [C declaration]: @SDL_fabsf@, defined at @SDL3\/SDL_stdinc.h 5011:35@
sDL_fabsf :: BG.FunPtr (BG.CFloat -> IO BG.CFloat)
sDL_fabsf =
  BG.unsafePerformIO hs_bindgen_1e189b3e959f375b

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_floor@
foreign import ccall unsafe "hs_bindgen_ae709679ac231e3a"
  hs_bindgen_ae709679ac231e3a_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_floor@
hs_bindgen_ae709679ac231e3a :: IO (BG.FunPtr (BG.CDouble -> IO BG.CDouble))
hs_bindgen_ae709679ac231e3a =
  BG.fromFFIType hs_bindgen_ae709679ac231e3a_base

{-# NOINLINE sDL_floor #-}

-- | Compute the floor of @x@.
--
--     The floor of @x@ is the largest integer @y@ such that @y \<= x@, i.e @x@ rounded down to the nearest integer.
--
--     Domain: @-INF \<= x \<= INF@
--
--     Range: @-INF \<= y \<= INF@, y integer
--
--     This function operates on double-precision floating point values, use SDL_floorf for single-precision floats.
--
--     [@x@]: floating point value.
--
--     [Returns]: the floor of @x@.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_floorf', 'sDL_ceil', 'sDL_trunc', 'sDL_round', @SDL_lround@
--
--     [C declaration]: @SDL_floor@, defined at @SDL3\/SDL_stdinc.h 5039:36@
sDL_floor :: BG.FunPtr (BG.CDouble -> IO BG.CDouble)
sDL_floor =
  BG.unsafePerformIO hs_bindgen_ae709679ac231e3a

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_floorf@
foreign import ccall unsafe "hs_bindgen_6bcbc045e8590408"
  hs_bindgen_6bcbc045e8590408_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_floorf@
hs_bindgen_6bcbc045e8590408 :: IO (BG.FunPtr (BG.CFloat -> IO BG.CFloat))
hs_bindgen_6bcbc045e8590408 =
  BG.fromFFIType hs_bindgen_6bcbc045e8590408_base

{-# NOINLINE sDL_floorf #-}

-- | Compute the floor of @x@.
--
--     The floor of @x@ is the largest integer @y@ such that @y \<= x@, i.e @x@ rounded down to the nearest integer.
--
--     Domain: @-INF \<= x \<= INF@
--
--     Range: @-INF \<= y \<= INF@, y integer
--
--     This function operates on single-precision floating point values, use SDL_floor for double-precision floats.
--
--     [@x@]: floating point value.
--
--     [Returns]: the floor of @x@.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_floor', 'sDL_ceilf', 'sDL_truncf', 'sDL_roundf', @SDL_lroundf@
--
--     [C declaration]: @SDL_floorf@, defined at @SDL3\/SDL_stdinc.h 5067:35@
sDL_floorf :: BG.FunPtr (BG.CFloat -> IO BG.CFloat)
sDL_floorf =
  BG.unsafePerformIO hs_bindgen_6bcbc045e8590408

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_trunc@
foreign import ccall unsafe "hs_bindgen_9ff826562c85b6db"
  hs_bindgen_9ff826562c85b6db_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_trunc@
hs_bindgen_9ff826562c85b6db :: IO (BG.FunPtr (BG.CDouble -> IO BG.CDouble))
hs_bindgen_9ff826562c85b6db =
  BG.fromFFIType hs_bindgen_9ff826562c85b6db_base

{-# NOINLINE sDL_trunc #-}

-- | Truncate @x@ to an integer.
--
--     Rounds @x@ to the next closest integer to 0. This is equivalent to removing the fractional part of @x@, leaving only the integer part.
--
--     Domain: @-INF \<= x \<= INF@
--
--     Range: @-INF \<= y \<= INF@, y integer
--
--     This function operates on double-precision floating point values, use SDL_truncf for single-precision floats.
--
--     [@x@]: floating point value.
--
--     [Returns]: @x@ truncated to an integer.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_truncf', 'sDL_fmod', 'sDL_ceil', 'sDL_floor', 'sDL_round', @SDL_lround@
--
--     [C declaration]: @SDL_trunc@, defined at @SDL3\/SDL_stdinc.h 5096:36@
sDL_trunc :: BG.FunPtr (BG.CDouble -> IO BG.CDouble)
sDL_trunc =
  BG.unsafePerformIO hs_bindgen_9ff826562c85b6db

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_truncf@
foreign import ccall unsafe "hs_bindgen_5afacbe63e710528"
  hs_bindgen_5afacbe63e710528_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_truncf@
hs_bindgen_5afacbe63e710528 :: IO (BG.FunPtr (BG.CFloat -> IO BG.CFloat))
hs_bindgen_5afacbe63e710528 =
  BG.fromFFIType hs_bindgen_5afacbe63e710528_base

{-# NOINLINE sDL_truncf #-}

-- | Truncate @x@ to an integer.
--
--     Rounds @x@ to the next closest integer to 0. This is equivalent to removing the fractional part of @x@, leaving only the integer part.
--
--     Domain: @-INF \<= x \<= INF@
--
--     Range: @-INF \<= y \<= INF@, y integer
--
--     This function operates on single-precision floating point values, use SDL_trunc for double-precision floats.
--
--     [@x@]: floating point value.
--
--     [Returns]: @x@ truncated to an integer.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_trunc', 'sDL_fmodf', 'sDL_ceilf', 'sDL_floorf', 'sDL_roundf', @SDL_lroundf@
--
--     [C declaration]: @SDL_truncf@, defined at @SDL3\/SDL_stdinc.h 5125:35@
sDL_truncf :: BG.FunPtr (BG.CFloat -> IO BG.CFloat)
sDL_truncf =
  BG.unsafePerformIO hs_bindgen_5afacbe63e710528

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_fmod@
foreign import ccall unsafe "hs_bindgen_3a93d2030ffd9ef3"
  hs_bindgen_3a93d2030ffd9ef3_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_fmod@
hs_bindgen_3a93d2030ffd9ef3 :: IO (BG.FunPtr (BG.CDouble -> BG.CDouble -> IO BG.CDouble))
hs_bindgen_3a93d2030ffd9ef3 =
  BG.fromFFIType hs_bindgen_3a93d2030ffd9ef3_base

{-# NOINLINE sDL_fmod #-}

-- | Return the floating-point remainder of @x \/ y@
--
--     Divides @x@ by @y@, and returns the remainder.
--
--     Domain: @-INF \<= x \<= INF@, @-INF \<= y \<= INF@, @y != 0@
--
--     Range: @-y \<= z \<= y@
--
--     This function operates on double-precision floating point values, use SDL_fmodf for single-precision floats.
--
--     [@x@]: the numerator.
--
--     [@y@]: the denominator. Must not be 0.
--
--     [Returns]: the remainder of @x \/ y@.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_fmodf', 'sDL_modf', 'sDL_trunc', 'sDL_ceil', 'sDL_floor', 'sDL_round', @SDL_lround@
--
--     [C declaration]: @SDL_fmod@, defined at @SDL3\/SDL_stdinc.h 5155:36@
sDL_fmod :: BG.FunPtr (BG.CDouble -> BG.CDouble -> IO BG.CDouble)
sDL_fmod =
  BG.unsafePerformIO hs_bindgen_3a93d2030ffd9ef3

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_fmodf@
foreign import ccall unsafe "hs_bindgen_a851844ef04e542d"
  hs_bindgen_a851844ef04e542d_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_fmodf@
hs_bindgen_a851844ef04e542d :: IO (BG.FunPtr (BG.CFloat -> BG.CFloat -> IO BG.CFloat))
hs_bindgen_a851844ef04e542d =
  BG.fromFFIType hs_bindgen_a851844ef04e542d_base

{-# NOINLINE sDL_fmodf #-}

-- | Return the floating-point remainder of @x \/ y@
--
--     Divides @x@ by @y@, and returns the remainder.
--
--     Domain: @-INF \<= x \<= INF@, @-INF \<= y \<= INF@, @y != 0@
--
--     Range: @-y \<= z \<= y@
--
--     This function operates on single-precision floating point values, use SDL_fmod for double-precision floats.
--
--     [@x@]: the numerator.
--
--     [@y@]: the denominator. Must not be 0.
--
--     [Returns]: the remainder of @x \/ y@.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_fmod', 'sDL_truncf', 'sDL_modff', 'sDL_ceilf', 'sDL_floorf', 'sDL_roundf', @SDL_lroundf@
--
--     [C declaration]: @SDL_fmodf@, defined at @SDL3\/SDL_stdinc.h 5185:35@
sDL_fmodf :: BG.FunPtr (BG.CFloat -> BG.CFloat -> IO BG.CFloat)
sDL_fmodf =
  BG.unsafePerformIO hs_bindgen_a851844ef04e542d

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_isinf@
foreign import ccall unsafe "hs_bindgen_d9346ba385534fdd"
  hs_bindgen_d9346ba385534fdd_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_isinf@
hs_bindgen_d9346ba385534fdd :: IO (BG.FunPtr (BG.CDouble -> IO BG.CInt))
hs_bindgen_d9346ba385534fdd =
  BG.fromFFIType hs_bindgen_d9346ba385534fdd_base

{-# NOINLINE sDL_isinf #-}

-- | Return whether the value is infinity.
--
--     [@x@]: double-precision floating point value.
--
--     [Returns]: non-zero if the value is infinity, 0 otherwise.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_isinff'
--
--     [C declaration]: @SDL_isinf@, defined at @SDL3\/SDL_stdinc.h 5199:33@
sDL_isinf :: BG.FunPtr (BG.CDouble -> IO BG.CInt)
sDL_isinf =
  BG.unsafePerformIO hs_bindgen_d9346ba385534fdd

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_isinff@
foreign import ccall unsafe "hs_bindgen_bfaf6777c1c350c3"
  hs_bindgen_bfaf6777c1c350c3_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_isinff@
hs_bindgen_bfaf6777c1c350c3 :: IO (BG.FunPtr (BG.CFloat -> IO BG.CInt))
hs_bindgen_bfaf6777c1c350c3 =
  BG.fromFFIType hs_bindgen_bfaf6777c1c350c3_base

{-# NOINLINE sDL_isinff #-}

-- | Return whether the value is infinity.
--
--     [@x@]: floating point value.
--
--     [Returns]: non-zero if the value is infinity, 0 otherwise.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_isinf'
--
--     [C declaration]: @SDL_isinff@, defined at @SDL3\/SDL_stdinc.h 5213:33@
sDL_isinff :: BG.FunPtr (BG.CFloat -> IO BG.CInt)
sDL_isinff =
  BG.unsafePerformIO hs_bindgen_bfaf6777c1c350c3

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_isnan@
foreign import ccall unsafe "hs_bindgen_006f33027be22f99"
  hs_bindgen_006f33027be22f99_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_isnan@
hs_bindgen_006f33027be22f99 :: IO (BG.FunPtr (BG.CDouble -> IO BG.CInt))
hs_bindgen_006f33027be22f99 =
  BG.fromFFIType hs_bindgen_006f33027be22f99_base

{-# NOINLINE sDL_isnan #-}

-- | Return whether the value is NaN.
--
--     [@x@]: double-precision floating point value.
--
--     [Returns]: non-zero if the value is NaN, 0 otherwise.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_isnanf'
--
--     [C declaration]: @SDL_isnan@, defined at @SDL3\/SDL_stdinc.h 5227:33@
sDL_isnan :: BG.FunPtr (BG.CDouble -> IO BG.CInt)
sDL_isnan =
  BG.unsafePerformIO hs_bindgen_006f33027be22f99

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_isnanf@
foreign import ccall unsafe "hs_bindgen_308e1efef7090245"
  hs_bindgen_308e1efef7090245_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_isnanf@
hs_bindgen_308e1efef7090245 :: IO (BG.FunPtr (BG.CFloat -> IO BG.CInt))
hs_bindgen_308e1efef7090245 =
  BG.fromFFIType hs_bindgen_308e1efef7090245_base

{-# NOINLINE sDL_isnanf #-}

-- | Return whether the value is NaN.
--
--     [@x@]: floating point value.
--
--     [Returns]: non-zero if the value is NaN, 0 otherwise.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_isnan'
--
--     [C declaration]: @SDL_isnanf@, defined at @SDL3\/SDL_stdinc.h 5241:33@
sDL_isnanf :: BG.FunPtr (BG.CFloat -> IO BG.CInt)
sDL_isnanf =
  BG.unsafePerformIO hs_bindgen_308e1efef7090245

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_log@
foreign import ccall unsafe "hs_bindgen_4f9418e7e4267684"
  hs_bindgen_4f9418e7e4267684_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_log@
hs_bindgen_4f9418e7e4267684 :: IO (BG.FunPtr (BG.CDouble -> IO BG.CDouble))
hs_bindgen_4f9418e7e4267684 =
  BG.fromFFIType hs_bindgen_4f9418e7e4267684_base

{-# NOINLINE sDL_log #-}

-- | Compute the natural logarithm of @x@.
--
--     Domain: @0 \< x \<= INF@
--
--     Range: @-INF \<= y \<= INF@
--
--     It is an error for @x@ to be less than or equal to 0.
--
--     This function operates on double-precision floating point values, use SDL_logf for single-precision floats.
--
--     This function may use a different approximation across different versions, platforms and configurations. i.e, it can return a different value given the same input on different machines or operating systems, or if SDL is updated.
--
--     [@x@]: floating point value. Must be greater than 0.
--
--     [Returns]: the natural logarithm of @x@.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_logf', 'sDL_log10', 'sDL_exp'
--
--     [C declaration]: @SDL_log@, defined at @SDL3\/SDL_stdinc.h 5271:36@
sDL_log :: BG.FunPtr (BG.CDouble -> IO BG.CDouble)
sDL_log =
  BG.unsafePerformIO hs_bindgen_4f9418e7e4267684

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_logf@
foreign import ccall unsafe "hs_bindgen_ab81f791c1e3e516"
  hs_bindgen_ab81f791c1e3e516_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_logf@
hs_bindgen_ab81f791c1e3e516 :: IO (BG.FunPtr (BG.CFloat -> IO BG.CFloat))
hs_bindgen_ab81f791c1e3e516 =
  BG.fromFFIType hs_bindgen_ab81f791c1e3e516_base

{-# NOINLINE sDL_logf #-}

-- | Compute the natural logarithm of @x@.
--
--     Domain: @0 \< x \<= INF@
--
--     Range: @-INF \<= y \<= INF@
--
--     It is an error for @x@ to be less than or equal to 0.
--
--     This function operates on single-precision floating point values, use SDL_log for double-precision floats.
--
--     This function may use a different approximation across different versions, platforms and configurations. i.e, it can return a different value given the same input on different machines or operating systems, or if SDL is updated.
--
--     [@x@]: floating point value. Must be greater than 0.
--
--     [Returns]: the natural logarithm of @x@.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_log', 'sDL_expf'
--
--     [C declaration]: @SDL_logf@, defined at @SDL3\/SDL_stdinc.h 5300:35@
sDL_logf :: BG.FunPtr (BG.CFloat -> IO BG.CFloat)
sDL_logf =
  BG.unsafePerformIO hs_bindgen_ab81f791c1e3e516

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_log10@
foreign import ccall unsafe "hs_bindgen_c9a4b45a046047ba"
  hs_bindgen_c9a4b45a046047ba_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_log10@
hs_bindgen_c9a4b45a046047ba :: IO (BG.FunPtr (BG.CDouble -> IO BG.CDouble))
hs_bindgen_c9a4b45a046047ba =
  BG.fromFFIType hs_bindgen_c9a4b45a046047ba_base

{-# NOINLINE sDL_log10 #-}

-- | Compute the base-10 logarithm of @x@.
--
--     Domain: @0 \< x \<= INF@
--
--     Range: @-INF \<= y \<= INF@
--
--     It is an error for @x@ to be less than or equal to 0.
--
--     This function operates on double-precision floating point values, use SDL_log10f for single-precision floats.
--
--     This function may use a different approximation across different versions, platforms and configurations. i.e, it can return a different value given the same input on different machines or operating systems, or if SDL is updated.
--
--     [@x@]: floating point value. Must be greater than 0.
--
--     [Returns]: the logarithm of @x@.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_log10f', 'sDL_log', 'sDL_pow'
--
--     [C declaration]: @SDL_log10@, defined at @SDL3\/SDL_stdinc.h 5330:36@
sDL_log10 :: BG.FunPtr (BG.CDouble -> IO BG.CDouble)
sDL_log10 =
  BG.unsafePerformIO hs_bindgen_c9a4b45a046047ba

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_log10f@
foreign import ccall unsafe "hs_bindgen_72ace8de925eb690"
  hs_bindgen_72ace8de925eb690_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_log10f@
hs_bindgen_72ace8de925eb690 :: IO (BG.FunPtr (BG.CFloat -> IO BG.CFloat))
hs_bindgen_72ace8de925eb690 =
  BG.fromFFIType hs_bindgen_72ace8de925eb690_base

{-# NOINLINE sDL_log10f #-}

-- | Compute the base-10 logarithm of @x@.
--
--     Domain: @0 \< x \<= INF@
--
--     Range: @-INF \<= y \<= INF@
--
--     It is an error for @x@ to be less than or equal to 0.
--
--     This function operates on single-precision floating point values, use SDL_log10 for double-precision floats.
--
--     This function may use a different approximation across different versions, platforms and configurations. i.e, it can return a different value given the same input on different machines or operating systems, or if SDL is updated.
--
--     [@x@]: floating point value. Must be greater than 0.
--
--     [Returns]: the logarithm of @x@.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_log10', 'sDL_logf', 'sDL_powf'
--
--     [C declaration]: @SDL_log10f@, defined at @SDL3\/SDL_stdinc.h 5360:35@
sDL_log10f :: BG.FunPtr (BG.CFloat -> IO BG.CFloat)
sDL_log10f =
  BG.unsafePerformIO hs_bindgen_72ace8de925eb690

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_modf@
foreign import ccall unsafe "hs_bindgen_b05adeb0cad2dab6"
  hs_bindgen_b05adeb0cad2dab6_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_modf@
hs_bindgen_b05adeb0cad2dab6 :: IO (BG.FunPtr (BG.CDouble -> BG.Ptr BG.CDouble -> IO BG.CDouble))
hs_bindgen_b05adeb0cad2dab6 =
  BG.fromFFIType hs_bindgen_b05adeb0cad2dab6_base

{-# NOINLINE sDL_modf #-}

-- | Split @x@ into integer and fractional parts
--
--     This function operates on double-precision floating point values, use SDL_modff for single-precision floats.
--
--     [@x@]: floating point value.
--
--     [@y@]: output pointer to store the integer part of @x@.
--
--     [Returns]: the fractional part of @x@.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_modff', 'sDL_trunc', 'sDL_fmod'
--
--     [C declaration]: @SDL_modf@, defined at @SDL3\/SDL_stdinc.h 5380:36@
sDL_modf :: BG.FunPtr (BG.CDouble -> BG.Ptr BG.CDouble -> IO BG.CDouble)
sDL_modf =
  BG.unsafePerformIO hs_bindgen_b05adeb0cad2dab6

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_modff@
foreign import ccall unsafe "hs_bindgen_59f3b87137ea46cd"
  hs_bindgen_59f3b87137ea46cd_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_modff@
hs_bindgen_59f3b87137ea46cd :: IO (BG.FunPtr (BG.CFloat -> BG.Ptr BG.CFloat -> IO BG.CFloat))
hs_bindgen_59f3b87137ea46cd =
  BG.fromFFIType hs_bindgen_59f3b87137ea46cd_base

{-# NOINLINE sDL_modff #-}

-- | Split @x@ into integer and fractional parts
--
--     This function operates on single-precision floating point values, use SDL_modf for double-precision floats.
--
--     [@x@]: floating point value.
--
--     [@y@]: output pointer to store the integer part of @x@.
--
--     [Returns]: the fractional part of @x@.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_modf', 'sDL_truncf', 'sDL_fmodf'
--
--     [C declaration]: @SDL_modff@, defined at @SDL3\/SDL_stdinc.h 5400:35@
sDL_modff :: BG.FunPtr (BG.CFloat -> BG.Ptr BG.CFloat -> IO BG.CFloat)
sDL_modff =
  BG.unsafePerformIO hs_bindgen_59f3b87137ea46cd

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_pow@
foreign import ccall unsafe "hs_bindgen_75e5e5b712af4971"
  hs_bindgen_75e5e5b712af4971_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_pow@
hs_bindgen_75e5e5b712af4971 :: IO (BG.FunPtr (BG.CDouble -> BG.CDouble -> IO BG.CDouble))
hs_bindgen_75e5e5b712af4971 =
  BG.fromFFIType hs_bindgen_75e5e5b712af4971_base

{-# NOINLINE sDL_pow #-}

-- | Raise @x@ to the power @y@
--
--     Domain: @-INF \<= x \<= INF@, @-INF \<= y \<= INF@
--
--     Range: @-INF \<= z \<= INF@
--
--     If @y@ is the base of the natural logarithm (e), consider using SDL_exp instead.
--
--     This function operates on double-precision floating point values, use SDL_powf for single-precision floats.
--
--     This function may use a different approximation across different versions, platforms and configurations. i.e, it can return a different value given the same input on different machines or operating systems, or if SDL is updated.
--
--     [@x@]: the base.
--
--     [@y@]: the exponent.
--
--     [Returns]: @x@ raised to the power @y@.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_powf', 'sDL_exp', 'sDL_log'
--
--     [C declaration]: @SDL_pow@, defined at @SDL3\/SDL_stdinc.h 5432:36@
sDL_pow :: BG.FunPtr (BG.CDouble -> BG.CDouble -> IO BG.CDouble)
sDL_pow =
  BG.unsafePerformIO hs_bindgen_75e5e5b712af4971

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_powf@
foreign import ccall unsafe "hs_bindgen_deb1ba3db460136c"
  hs_bindgen_deb1ba3db460136c_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_powf@
hs_bindgen_deb1ba3db460136c :: IO (BG.FunPtr (BG.CFloat -> BG.CFloat -> IO BG.CFloat))
hs_bindgen_deb1ba3db460136c =
  BG.fromFFIType hs_bindgen_deb1ba3db460136c_base

{-# NOINLINE sDL_powf #-}

-- | Raise @x@ to the power @y@
--
--     Domain: @-INF \<= x \<= INF@, @-INF \<= y \<= INF@
--
--     Range: @-INF \<= z \<= INF@
--
--     If @y@ is the base of the natural logarithm (e), consider using SDL_exp instead.
--
--     This function operates on single-precision floating point values, use SDL_pow for double-precision floats.
--
--     This function may use a different approximation across different versions, platforms and configurations. i.e, it can return a different value given the same input on different machines or operating systems, or if SDL is updated.
--
--     [@x@]: the base.
--
--     [@y@]: the exponent.
--
--     [Returns]: @x@ raised to the power @y@.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_pow', 'sDL_expf', 'sDL_logf'
--
--     [C declaration]: @SDL_powf@, defined at @SDL3\/SDL_stdinc.h 5464:35@
sDL_powf :: BG.FunPtr (BG.CFloat -> BG.CFloat -> IO BG.CFloat)
sDL_powf =
  BG.unsafePerformIO hs_bindgen_deb1ba3db460136c

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_round@
foreign import ccall unsafe "hs_bindgen_e8841dcdfaff32de"
  hs_bindgen_e8841dcdfaff32de_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_round@
hs_bindgen_e8841dcdfaff32de :: IO (BG.FunPtr (BG.CDouble -> IO BG.CDouble))
hs_bindgen_e8841dcdfaff32de =
  BG.fromFFIType hs_bindgen_e8841dcdfaff32de_base

{-# NOINLINE sDL_round #-}

-- | Round @x@ to the nearest integer.
--
--     Rounds @x@ to the nearest integer. Values halfway between integers will be rounded away from zero.
--
--     Domain: @-INF \<= x \<= INF@
--
--     Range: @-INF \<= y \<= INF@, y integer
--
--     This function operates on double-precision floating point values, use SDL_roundf for single-precision floats. To get the result as an integer type, use SDL_lround.
--
--     [@x@]: floating point value.
--
--     [Returns]: the nearest integer to @x@.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_roundf', @SDL_lround@, 'sDL_floor', 'sDL_ceil', 'sDL_trunc'
--
--     [C declaration]: @SDL_round@, defined at @SDL3\/SDL_stdinc.h 5493:36@
sDL_round :: BG.FunPtr (BG.CDouble -> IO BG.CDouble)
sDL_round =
  BG.unsafePerformIO hs_bindgen_e8841dcdfaff32de

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_roundf@
foreign import ccall unsafe "hs_bindgen_57450d2f082e285c"
  hs_bindgen_57450d2f082e285c_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_roundf@
hs_bindgen_57450d2f082e285c :: IO (BG.FunPtr (BG.CFloat -> IO BG.CFloat))
hs_bindgen_57450d2f082e285c =
  BG.fromFFIType hs_bindgen_57450d2f082e285c_base

{-# NOINLINE sDL_roundf #-}

-- | Round @x@ to the nearest integer.
--
--     Rounds @x@ to the nearest integer. Values halfway between integers will be rounded away from zero.
--
--     Domain: @-INF \<= x \<= INF@
--
--     Range: @-INF \<= y \<= INF@, y integer
--
--     This function operates on single-precision floating point values, use SDL_round for double-precision floats. To get the result as an integer type, use SDL_lroundf.
--
--     [@x@]: floating point value.
--
--     [Returns]: the nearest integer to @x@.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_round', @SDL_lroundf@, 'sDL_floorf', 'sDL_ceilf', 'sDL_truncf'
--
--     [C declaration]: @SDL_roundf@, defined at @SDL3\/SDL_stdinc.h 5522:35@
sDL_roundf :: BG.FunPtr (BG.CFloat -> IO BG.CFloat)
sDL_roundf =
  BG.unsafePerformIO hs_bindgen_57450d2f082e285c

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_scalbn@
foreign import ccall unsafe "hs_bindgen_6fc1ebd971ec8157"
  hs_bindgen_6fc1ebd971ec8157_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_scalbn@
hs_bindgen_6fc1ebd971ec8157 :: IO (BG.FunPtr (BG.CDouble -> BG.CInt -> IO BG.CDouble))
hs_bindgen_6fc1ebd971ec8157 =
  BG.fromFFIType hs_bindgen_6fc1ebd971ec8157_base

{-# NOINLINE sDL_scalbn #-}

-- | Scale @x@ by an integer power of two.
--
--     Multiplies @x@ by the @n@ th power of the floating point radix (always 2).
--
--     Domain: @-INF \<= x \<= INF@, @n@ integer
--
--     Range: @-INF \<= y \<= INF@
--
--     This function operates on double-precision floating point values, use SDL_scalbnf for single-precision floats.
--
--     [@x@]: floating point value to be scaled.
--
--     [@n@]: integer exponent.
--
--     [Returns]: @x * 2^n@.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_scalbnf', 'sDL_pow'
--
--     [C declaration]: @SDL_scalbn@, defined at @SDL3\/SDL_stdinc.h 5605:36@
sDL_scalbn :: BG.FunPtr (BG.CDouble -> BG.CInt -> IO BG.CDouble)
sDL_scalbn =
  BG.unsafePerformIO hs_bindgen_6fc1ebd971ec8157

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_scalbnf@
foreign import ccall unsafe "hs_bindgen_706cd6213dd8d69d"
  hs_bindgen_706cd6213dd8d69d_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_scalbnf@
hs_bindgen_706cd6213dd8d69d :: IO (BG.FunPtr (BG.CFloat -> BG.CInt -> IO BG.CFloat))
hs_bindgen_706cd6213dd8d69d =
  BG.fromFFIType hs_bindgen_706cd6213dd8d69d_base

{-# NOINLINE sDL_scalbnf #-}

-- | Scale @x@ by an integer power of two.
--
--     Multiplies @x@ by the @n@ th power of the floating point radix (always 2).
--
--     Domain: @-INF \<= x \<= INF@, @n@ integer
--
--     Range: @-INF \<= y \<= INF@
--
--     This function operates on single-precision floating point values, use SDL_scalbn for double-precision floats.
--
--     [@x@]: floating point value to be scaled.
--
--     [@n@]: integer exponent.
--
--     [Returns]: @x * 2^n@.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_scalbn', 'sDL_powf'
--
--     [C declaration]: @SDL_scalbnf@, defined at @SDL3\/SDL_stdinc.h 5630:35@
sDL_scalbnf :: BG.FunPtr (BG.CFloat -> BG.CInt -> IO BG.CFloat)
sDL_scalbnf =
  BG.unsafePerformIO hs_bindgen_706cd6213dd8d69d

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_sin@
foreign import ccall unsafe "hs_bindgen_e4b1725cdd38afe4"
  hs_bindgen_e4b1725cdd38afe4_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_sin@
hs_bindgen_e4b1725cdd38afe4 :: IO (BG.FunPtr (BG.CDouble -> IO BG.CDouble))
hs_bindgen_e4b1725cdd38afe4 =
  BG.fromFFIType hs_bindgen_e4b1725cdd38afe4_base

{-# NOINLINE sDL_sin #-}

-- | Compute the sine of @x@.
--
--     Domain: @-INF \<= x \<= INF@
--
--     Range: @-1 \<= y \<= 1@
--
--     This function operates on double-precision floating point values, use SDL_sinf for single-precision floats.
--
--     This function may use a different approximation across different versions, platforms and configurations. i.e, it can return a different value given the same input on different machines or operating systems, or if SDL is updated.
--
--     [@x@]: floating point value, in radians.
--
--     [Returns]: sine of @x@.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_sinf', 'sDL_asin', 'sDL_cos'
--
--     [C declaration]: @SDL_sin@, defined at @SDL3\/SDL_stdinc.h 5658:36@
sDL_sin :: BG.FunPtr (BG.CDouble -> IO BG.CDouble)
sDL_sin =
  BG.unsafePerformIO hs_bindgen_e4b1725cdd38afe4

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_sinf@
foreign import ccall unsafe "hs_bindgen_4d400d672d200ac9"
  hs_bindgen_4d400d672d200ac9_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_sinf@
hs_bindgen_4d400d672d200ac9 :: IO (BG.FunPtr (BG.CFloat -> IO BG.CFloat))
hs_bindgen_4d400d672d200ac9 =
  BG.fromFFIType hs_bindgen_4d400d672d200ac9_base

{-# NOINLINE sDL_sinf #-}

-- | Compute the sine of @x@.
--
--     Domain: @-INF \<= x \<= INF@
--
--     Range: @-1 \<= y \<= 1@
--
--     This function operates on single-precision floating point values, use SDL_sin for double-precision floats.
--
--     This function may use a different approximation across different versions, platforms and configurations. i.e, it can return a different value given the same input on different machines or operating systems, or if SDL is updated.
--
--     [@x@]: floating point value, in radians.
--
--     [Returns]: sine of @x@.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_sin', 'sDL_asinf', 'sDL_cosf'
--
--     [C declaration]: @SDL_sinf@, defined at @SDL3\/SDL_stdinc.h 5686:35@
sDL_sinf :: BG.FunPtr (BG.CFloat -> IO BG.CFloat)
sDL_sinf =
  BG.unsafePerformIO hs_bindgen_4d400d672d200ac9

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_sqrt@
foreign import ccall unsafe "hs_bindgen_8352f3e6d4755f65"
  hs_bindgen_8352f3e6d4755f65_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_sqrt@
hs_bindgen_8352f3e6d4755f65 :: IO (BG.FunPtr (BG.CDouble -> IO BG.CDouble))
hs_bindgen_8352f3e6d4755f65 =
  BG.fromFFIType hs_bindgen_8352f3e6d4755f65_base

{-# NOINLINE sDL_sqrt #-}

-- | Compute the square root of @x@.
--
--     Domain: @0 \<= x \<= INF@
--
--     Range: @0 \<= y \<= INF@
--
--     This function operates on double-precision floating point values, use SDL_sqrtf for single-precision floats.
--
--     This function may use a different approximation across different versions, platforms and configurations. i.e, it can return a different value given the same input on different machines or operating systems, or if SDL is updated.
--
--     [@x@]: floating point value. Must be greater than or equal to 0.
--
--     [Returns]: square root of @x@.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_sqrtf'
--
--     [C declaration]: @SDL_sqrt@, defined at @SDL3\/SDL_stdinc.h 5712:36@
sDL_sqrt :: BG.FunPtr (BG.CDouble -> IO BG.CDouble)
sDL_sqrt =
  BG.unsafePerformIO hs_bindgen_8352f3e6d4755f65

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_sqrtf@
foreign import ccall unsafe "hs_bindgen_87f1efd0a9654c58"
  hs_bindgen_87f1efd0a9654c58_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_sqrtf@
hs_bindgen_87f1efd0a9654c58 :: IO (BG.FunPtr (BG.CFloat -> IO BG.CFloat))
hs_bindgen_87f1efd0a9654c58 =
  BG.fromFFIType hs_bindgen_87f1efd0a9654c58_base

{-# NOINLINE sDL_sqrtf #-}

-- | Compute the square root of @x@.
--
--     Domain: @0 \<= x \<= INF@
--
--     Range: @0 \<= y \<= INF@
--
--     This function operates on single-precision floating point values, use SDL_sqrt for double-precision floats.
--
--     This function may use a different approximation across different versions, platforms and configurations. i.e, it can return a different value given the same input on different machines or operating systems, or if SDL is updated.
--
--     [@x@]: floating point value. Must be greater than or equal to 0.
--
--     [Returns]: square root of @x@.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_sqrt'
--
--     [C declaration]: @SDL_sqrtf@, defined at @SDL3\/SDL_stdinc.h 5738:35@
sDL_sqrtf :: BG.FunPtr (BG.CFloat -> IO BG.CFloat)
sDL_sqrtf =
  BG.unsafePerformIO hs_bindgen_87f1efd0a9654c58

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_tan@
foreign import ccall unsafe "hs_bindgen_4a65c95891312c30"
  hs_bindgen_4a65c95891312c30_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_tan@
hs_bindgen_4a65c95891312c30 :: IO (BG.FunPtr (BG.CDouble -> IO BG.CDouble))
hs_bindgen_4a65c95891312c30 =
  BG.fromFFIType hs_bindgen_4a65c95891312c30_base

{-# NOINLINE sDL_tan #-}

-- | Compute the tangent of @x@.
--
--     Domain: @-INF \<= x \<= INF@
--
--     Range: @-INF \<= y \<= INF@
--
--     This function operates on double-precision floating point values, use SDL_tanf for single-precision floats.
--
--     This function may use a different approximation across different versions, platforms and configurations. i.e, it can return a different value given the same input on different machines or operating systems, or if SDL is updated.
--
--     [@x@]: floating point value, in radians.
--
--     [Returns]: tangent of @x@.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_tanf', 'sDL_sin', 'sDL_cos', 'sDL_atan', 'sDL_atan2'
--
--     [C declaration]: @SDL_tan@, defined at @SDL3\/SDL_stdinc.h 5768:36@
sDL_tan :: BG.FunPtr (BG.CDouble -> IO BG.CDouble)
sDL_tan =
  BG.unsafePerformIO hs_bindgen_4a65c95891312c30

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_tanf@
foreign import ccall unsafe "hs_bindgen_094dc8b00c4ee010"
  hs_bindgen_094dc8b00c4ee010_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_tanf@
hs_bindgen_094dc8b00c4ee010 :: IO (BG.FunPtr (BG.CFloat -> IO BG.CFloat))
hs_bindgen_094dc8b00c4ee010 =
  BG.fromFFIType hs_bindgen_094dc8b00c4ee010_base

{-# NOINLINE sDL_tanf #-}

-- | Compute the tangent of @x@.
--
--     Domain: @-INF \<= x \<= INF@
--
--     Range: @-INF \<= y \<= INF@
--
--     This function operates on single-precision floating point values, use SDL_tan for double-precision floats.
--
--     This function may use a different approximation across different versions, platforms and configurations. i.e, it can return a different value given the same input on different machines or operating systems, or if SDL is updated.
--
--     [@x@]: floating point value, in radians.
--
--     [Returns]: tangent of @x@.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_tan', 'sDL_sinf', 'sDL_cosf', 'sDL_atanf', 'sDL_atan2f'
--
--     [C declaration]: @SDL_tanf@, defined at @SDL3\/SDL_stdinc.h 5798:35@
sDL_tanf :: BG.FunPtr (BG.CFloat -> IO BG.CFloat)
sDL_tanf =
  BG.unsafePerformIO hs_bindgen_094dc8b00c4ee010

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_iconv_open@
foreign import ccall unsafe "hs_bindgen_704fe1bf2ce9aef6"
  hs_bindgen_704fe1bf2ce9aef6_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_iconv_open@
hs_bindgen_704fe1bf2ce9aef6
  :: IO (BG.FunPtr (PtrConst.PtrConst BG.CChar -> PtrConst.PtrConst BG.CChar -> IO SDL_iconv_t))
hs_bindgen_704fe1bf2ce9aef6 =
  BG.fromFFIType hs_bindgen_704fe1bf2ce9aef6_base

{-# NOINLINE sDL_iconv_open #-}

-- | This function allocates a context for the specified character set conversion.
--
--     [@tocode@]: The target character encoding, must not be NULL.
--
--     [@fromcode@]: The source character encoding, must not be NULL.
--
--     [Returns]: a handle that must be freed with SDL_iconv_close, or SDL_ICONV_ERROR on failure.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_iconv', 'sDL_iconv_close', 'sDL_iconv_string'
--
--     [C declaration]: @SDL_iconv_open@, defined at @SDL3\/SDL_stdinc.h 5826:41@
sDL_iconv_open
  :: BG.FunPtr (PtrConst.PtrConst BG.CChar -> PtrConst.PtrConst BG.CChar -> IO SDL_iconv_t)
sDL_iconv_open =
  BG.unsafePerformIO hs_bindgen_704fe1bf2ce9aef6

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_iconv_close@
foreign import ccall unsafe "hs_bindgen_2c0a62f403d4446c"
  hs_bindgen_2c0a62f403d4446c_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_iconv_close@
hs_bindgen_2c0a62f403d4446c :: IO (BG.FunPtr (SDL_iconv_t -> IO BG.CInt))
hs_bindgen_2c0a62f403d4446c =
  BG.fromFFIType hs_bindgen_2c0a62f403d4446c_base

{-# NOINLINE sDL_iconv_close #-}

-- | This function frees a context used for character set conversion.
--
--     [@cd@]: The character set conversion handle.
--
--     [Returns]: 0 on success, or -1 on failure.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_iconv', 'sDL_iconv_open', 'sDL_iconv_string'
--
--     [C declaration]: @SDL_iconv_close@, defined at @SDL3\/SDL_stdinc.h 5843:33@
sDL_iconv_close :: BG.FunPtr (SDL_iconv_t -> IO BG.CInt)
sDL_iconv_close =
  BG.unsafePerformIO hs_bindgen_2c0a62f403d4446c

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_iconv@
foreign import ccall unsafe "hs_bindgen_c0049201d1f4606f"
  hs_bindgen_c0049201d1f4606f_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_iconv@
hs_bindgen_c0049201d1f4606f
  :: IO
       ( BG.FunPtr
           ( SDL_iconv_t
             -> BG.Ptr (PtrConst.PtrConst BG.CChar)
             -> BG.Ptr HsBindgen.Runtime.LibC.CSize
             -> BG.Ptr (BG.Ptr BG.CChar)
             -> BG.Ptr HsBindgen.Runtime.LibC.CSize
             -> IO HsBindgen.Runtime.LibC.CSize
           )
       )
hs_bindgen_c0049201d1f4606f =
  BG.fromFFIType hs_bindgen_c0049201d1f4606f_base

{-# NOINLINE sDL_iconv #-}

-- | This function converts text between encodings, reading from and writing to a buffer.
--
--     It returns the number of successful conversions on success. On error, SDL_ICONV_E2BIG is returned when the output buffer is too small, or SDL_ICONV_EILSEQ is returned when an invalid input sequence is encountered, or SDL_ICONV_EINVAL is returned when an incomplete input sequence is encountered.
--
--     On exit:
--
--     * inbuf will point to the beginning of the next multibyte sequence. On error, this is the location of the problematic input sequence. On success, this is the end of the input sequence.
--
--     * inbytesleft will be set to the number of bytes left to convert, which will be 0 on success.
--
--     * outbuf will point to the location where to store the next output byte.
--
--     * outbytesleft will be set to the number of bytes left in the output buffer.
--
--     [@cd@]: The character set conversion context, created in @SDL_iconv_open()@.
--
--     [@inbuf@]: Address of variable that points to the first character of the input sequence.
--
--     [@inbytesleft@]: The number of bytes in the input buffer.
--
--     [@outbuf@]: Address of variable that points to the output buffer.
--
--     [@outbytesleft@]: The number of bytes in the output buffer.
--
--     [Returns]: the number of conversions on success, or a negative error code.
--
--     [Thread safety]: Do not use the same 'SDL_iconv_t' from two threads at once.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_iconv_open', 'sDL_iconv_close', 'sDL_iconv_string'
--
--     [C declaration]: @SDL_iconv@, defined at @SDL3\/SDL_stdinc.h 5883:36@
sDL_iconv
  :: BG.FunPtr
       ( SDL_iconv_t
         -> BG.Ptr (PtrConst.PtrConst BG.CChar)
         -> BG.Ptr HsBindgen.Runtime.LibC.CSize
         -> BG.Ptr (BG.Ptr BG.CChar)
         -> BG.Ptr HsBindgen.Runtime.LibC.CSize
         -> IO HsBindgen.Runtime.LibC.CSize
       )
sDL_iconv =
  BG.unsafePerformIO hs_bindgen_c0049201d1f4606f

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_iconv_string@
foreign import ccall unsafe "hs_bindgen_ce165346002f1247"
  hs_bindgen_ce165346002f1247_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_iconv_string@
hs_bindgen_ce165346002f1247
  :: IO
       ( BG.FunPtr
           ( PtrConst.PtrConst BG.CChar
             -> PtrConst.PtrConst BG.CChar
             -> PtrConst.PtrConst BG.CChar
             -> HsBindgen.Runtime.LibC.CSize
             -> IO (BG.Ptr BG.CChar)
           )
       )
hs_bindgen_ce165346002f1247 =
  BG.fromFFIType hs_bindgen_ce165346002f1247_base

{-# NOINLINE sDL_iconv_string #-}

-- | Helper function to convert a string\'s encoding in one call.
--
--     This function converts a buffer or string between encodings in one pass.
--
--     The string does not need to be NULL-terminated; this function operates on the number of bytes specified in @inbytesleft@ whether there is a NULL character anywhere in the buffer.
--
--     The returned string is owned by the caller, and should be passed to SDL_free when no longer needed.
--
--     [@tocode@]: the character encoding of the output string. Examples are \"UTF-8\", \"UCS-4\", etc.
--
--     [@fromcode@]: the character encoding of data in @inbuf@.
--
--     [@inbuf@]: the string to convert to a different encoding.
--
--     [@inbytesleft@]: the size of the input string /in bytes/.
--
--     [Returns]: a new string, converted to the new encoding, or NULL on error.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_iconv_open', 'sDL_iconv_close', 'sDL_iconv'
--
--     [C declaration]: @SDL_iconv_string@, defined at @SDL3\/SDL_stdinc.h 5920:36@
sDL_iconv_string
  :: BG.FunPtr
       ( PtrConst.PtrConst BG.CChar
         -> PtrConst.PtrConst BG.CChar
         -> PtrConst.PtrConst BG.CChar
         -> HsBindgen.Runtime.LibC.CSize
         -> IO (BG.Ptr BG.CChar)
       )
sDL_iconv_string =
  BG.unsafePerformIO hs_bindgen_ce165346002f1247

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_size_mul_check_overflow_builtin@
foreign import ccall unsafe "hs_bindgen_5f2e41800217ca05"
  hs_bindgen_5f2e41800217ca05_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_size_mul_check_overflow_builtin@
hs_bindgen_5f2e41800217ca05
  :: IO
       ( BG.FunPtr
           ( HsBindgen.Runtime.LibC.CSize
             -> HsBindgen.Runtime.LibC.CSize
             -> BG.Ptr HsBindgen.Runtime.LibC.CSize
             -> IO BG.CBool
           )
       )
hs_bindgen_5f2e41800217ca05 =
  BG.fromFFIType hs_bindgen_5f2e41800217ca05_base

{-# NOINLINE sDL_size_mul_check_overflow_builtin #-}

-- | [C declaration]: @SDL_size_mul_check_overflow_builtin@, defined at @SDL3\/SDL_stdinc.h 6101:23@
sDL_size_mul_check_overflow_builtin
  :: BG.FunPtr
       ( HsBindgen.Runtime.LibC.CSize
         -> HsBindgen.Runtime.LibC.CSize
         -> BG.Ptr HsBindgen.Runtime.LibC.CSize
         -> IO BG.CBool
       )
sDL_size_mul_check_overflow_builtin =
  BG.unsafePerformIO hs_bindgen_5f2e41800217ca05

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_size_add_check_overflow_builtin@
foreign import ccall unsafe "hs_bindgen_2d8ca557aa2f3eb0"
  hs_bindgen_2d8ca557aa2f3eb0_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_get_SDL_size_add_check_overflow_builtin@
hs_bindgen_2d8ca557aa2f3eb0
  :: IO
       ( BG.FunPtr
           ( HsBindgen.Runtime.LibC.CSize
             -> HsBindgen.Runtime.LibC.CSize
             -> BG.Ptr HsBindgen.Runtime.LibC.CSize
             -> IO BG.CBool
           )
       )
hs_bindgen_2d8ca557aa2f3eb0 =
  BG.fromFFIType hs_bindgen_2d8ca557aa2f3eb0_base

{-# NOINLINE sDL_size_add_check_overflow_builtin #-}

-- | [C declaration]: @SDL_size_add_check_overflow_builtin@, defined at @SDL3\/SDL_stdinc.h 6139:23@
sDL_size_add_check_overflow_builtin
  :: BG.FunPtr
       ( HsBindgen.Runtime.LibC.CSize
         -> HsBindgen.Runtime.LibC.CSize
         -> BG.Ptr HsBindgen.Runtime.LibC.CSize
         -> IO BG.CBool
       )
sDL_size_add_check_overflow_builtin =
  BG.unsafePerformIO hs_bindgen_2d8ca557aa2f3eb0
