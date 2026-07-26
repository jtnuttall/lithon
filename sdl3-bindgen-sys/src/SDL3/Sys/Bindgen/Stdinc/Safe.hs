{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE NoFieldSelectors #-}
{-# OPTIONS_HADDOCK prune #-}

module SDL3.Sys.Bindgen.Stdinc.Safe (
  SDL3.Sys.Bindgen.Stdinc.Safe.sDL_malloc,
  SDL3.Sys.Bindgen.Stdinc.Safe.sDL_calloc,
  SDL3.Sys.Bindgen.Stdinc.Safe.sDL_realloc,
  SDL3.Sys.Bindgen.Stdinc.Safe.sDL_free,
  SDL3.Sys.Bindgen.Stdinc.Safe.sDL_GetOriginalMemoryFunctions,
  SDL3.Sys.Bindgen.Stdinc.Safe.sDL_GetMemoryFunctions,
  SDL3.Sys.Bindgen.Stdinc.Safe.sDL_SetMemoryFunctions,
  SDL3.Sys.Bindgen.Stdinc.Safe.sDL_aligned_alloc,
  SDL3.Sys.Bindgen.Stdinc.Safe.sDL_aligned_free,
  SDL3.Sys.Bindgen.Stdinc.Safe.sDL_GetNumAllocations,
  SDL3.Sys.Bindgen.Stdinc.Safe.sDL_GetEnvironment,
  SDL3.Sys.Bindgen.Stdinc.Safe.sDL_CreateEnvironment,
  SDL3.Sys.Bindgen.Stdinc.Safe.sDL_GetEnvironmentVariable,
  SDL3.Sys.Bindgen.Stdinc.Safe.sDL_GetEnvironmentVariables,
  SDL3.Sys.Bindgen.Stdinc.Safe.sDL_SetEnvironmentVariable,
  SDL3.Sys.Bindgen.Stdinc.Safe.sDL_UnsetEnvironmentVariable,
  SDL3.Sys.Bindgen.Stdinc.Safe.sDL_DestroyEnvironment,
  SDL3.Sys.Bindgen.Stdinc.Safe.sDL_getenv,
  SDL3.Sys.Bindgen.Stdinc.Safe.sDL_getenv_unsafe,
  SDL3.Sys.Bindgen.Stdinc.Safe.sDL_setenv_unsafe,
  SDL3.Sys.Bindgen.Stdinc.Safe.sDL_unsetenv_unsafe,
  SDL3.Sys.Bindgen.Stdinc.Safe.sDL_qsort,
  SDL3.Sys.Bindgen.Stdinc.Safe.sDL_bsearch,
  SDL3.Sys.Bindgen.Stdinc.Safe.sDL_qsort_r,
  SDL3.Sys.Bindgen.Stdinc.Safe.sDL_bsearch_r,
  SDL3.Sys.Bindgen.Stdinc.Safe.sDL_abs,
  SDL3.Sys.Bindgen.Stdinc.Safe.sDL_isalpha,
  SDL3.Sys.Bindgen.Stdinc.Safe.sDL_isalnum,
  SDL3.Sys.Bindgen.Stdinc.Safe.sDL_isblank,
  SDL3.Sys.Bindgen.Stdinc.Safe.sDL_iscntrl,
  SDL3.Sys.Bindgen.Stdinc.Safe.sDL_isdigit,
  SDL3.Sys.Bindgen.Stdinc.Safe.sDL_isxdigit,
  SDL3.Sys.Bindgen.Stdinc.Safe.sDL_ispunct,
  SDL3.Sys.Bindgen.Stdinc.Safe.sDL_isspace,
  SDL3.Sys.Bindgen.Stdinc.Safe.sDL_isupper,
  SDL3.Sys.Bindgen.Stdinc.Safe.sDL_islower,
  SDL3.Sys.Bindgen.Stdinc.Safe.sDL_isprint,
  SDL3.Sys.Bindgen.Stdinc.Safe.sDL_isgraph,
  SDL3.Sys.Bindgen.Stdinc.Safe.sDL_toupper,
  SDL3.Sys.Bindgen.Stdinc.Safe.sDL_tolower,
  SDL3.Sys.Bindgen.Stdinc.Safe.sDL_crc16,
  SDL3.Sys.Bindgen.Stdinc.Safe.sDL_crc32,
  SDL3.Sys.Bindgen.Stdinc.Safe.sDL_murmur3_32,
  SDL3.Sys.Bindgen.Stdinc.Safe.sDL_memset4,
  SDL3.Sys.Bindgen.Stdinc.Safe.sDL_memcmp,
  SDL3.Sys.Bindgen.Stdinc.Safe.sDL_wcslen,
  SDL3.Sys.Bindgen.Stdinc.Safe.sDL_wcsnlen,
  SDL3.Sys.Bindgen.Stdinc.Safe.sDL_wcslcpy,
  SDL3.Sys.Bindgen.Stdinc.Safe.sDL_wcslcat,
  SDL3.Sys.Bindgen.Stdinc.Safe.sDL_wcsdup,
  SDL3.Sys.Bindgen.Stdinc.Safe.sDL_wcsstr,
  SDL3.Sys.Bindgen.Stdinc.Safe.sDL_wcsnstr,
  SDL3.Sys.Bindgen.Stdinc.Safe.sDL_wcscmp,
  SDL3.Sys.Bindgen.Stdinc.Safe.sDL_wcsncmp,
  SDL3.Sys.Bindgen.Stdinc.Safe.sDL_wcscasecmp,
  SDL3.Sys.Bindgen.Stdinc.Safe.sDL_wcsncasecmp,
  SDL3.Sys.Bindgen.Stdinc.Safe.sDL_strlen,
  SDL3.Sys.Bindgen.Stdinc.Safe.sDL_strnlen,
  SDL3.Sys.Bindgen.Stdinc.Safe.sDL_strlcpy,
  SDL3.Sys.Bindgen.Stdinc.Safe.sDL_utf8strlcpy,
  SDL3.Sys.Bindgen.Stdinc.Safe.sDL_strlcat,
  SDL3.Sys.Bindgen.Stdinc.Safe.sDL_strdup,
  SDL3.Sys.Bindgen.Stdinc.Safe.sDL_strndup,
  SDL3.Sys.Bindgen.Stdinc.Safe.sDL_strrev,
  SDL3.Sys.Bindgen.Stdinc.Safe.sDL_strupr,
  SDL3.Sys.Bindgen.Stdinc.Safe.sDL_strlwr,
  SDL3.Sys.Bindgen.Stdinc.Safe.sDL_strchr,
  SDL3.Sys.Bindgen.Stdinc.Safe.sDL_strrchr,
  SDL3.Sys.Bindgen.Stdinc.Safe.sDL_strstr,
  SDL3.Sys.Bindgen.Stdinc.Safe.sDL_strnstr,
  SDL3.Sys.Bindgen.Stdinc.Safe.sDL_strcasestr,
  SDL3.Sys.Bindgen.Stdinc.Safe.sDL_strtok_r,
  SDL3.Sys.Bindgen.Stdinc.Safe.sDL_utf8strlen,
  SDL3.Sys.Bindgen.Stdinc.Safe.sDL_utf8strnlen,
  SDL3.Sys.Bindgen.Stdinc.Safe.sDL_itoa,
  SDL3.Sys.Bindgen.Stdinc.Safe.sDL_uitoa,
  SDL3.Sys.Bindgen.Stdinc.Safe.sDL_lltoa,
  SDL3.Sys.Bindgen.Stdinc.Safe.sDL_ulltoa,
  SDL3.Sys.Bindgen.Stdinc.Safe.sDL_atoi,
  SDL3.Sys.Bindgen.Stdinc.Safe.sDL_atof,
  SDL3.Sys.Bindgen.Stdinc.Safe.sDL_strtoll,
  SDL3.Sys.Bindgen.Stdinc.Safe.sDL_strtoull,
  SDL3.Sys.Bindgen.Stdinc.Safe.sDL_strtod,
  SDL3.Sys.Bindgen.Stdinc.Safe.sDL_strcmp,
  SDL3.Sys.Bindgen.Stdinc.Safe.sDL_strncmp,
  SDL3.Sys.Bindgen.Stdinc.Safe.sDL_strcasecmp,
  SDL3.Sys.Bindgen.Stdinc.Safe.sDL_strncasecmp,
  SDL3.Sys.Bindgen.Stdinc.Safe.sDL_strpbrk,
  SDL3.Sys.Bindgen.Stdinc.Safe.sDL_StepUTF8,
  SDL3.Sys.Bindgen.Stdinc.Safe.sDL_StepBackUTF8,
  SDL3.Sys.Bindgen.Stdinc.Safe.sDL_UCS4ToUTF8,
  SDL3.Sys.Bindgen.Stdinc.Safe.sDL_srand,
  SDL3.Sys.Bindgen.Stdinc.Safe.sDL_rand,
  SDL3.Sys.Bindgen.Stdinc.Safe.sDL_randf,
  SDL3.Sys.Bindgen.Stdinc.Safe.sDL_rand_bits,
  SDL3.Sys.Bindgen.Stdinc.Safe.sDL_rand_r,
  SDL3.Sys.Bindgen.Stdinc.Safe.sDL_randf_r,
  SDL3.Sys.Bindgen.Stdinc.Safe.sDL_rand_bits_r,
  SDL3.Sys.Bindgen.Stdinc.Safe.sDL_acos,
  SDL3.Sys.Bindgen.Stdinc.Safe.sDL_acosf,
  SDL3.Sys.Bindgen.Stdinc.Safe.sDL_asin,
  SDL3.Sys.Bindgen.Stdinc.Safe.sDL_asinf,
  SDL3.Sys.Bindgen.Stdinc.Safe.sDL_atan,
  SDL3.Sys.Bindgen.Stdinc.Safe.sDL_atanf,
  SDL3.Sys.Bindgen.Stdinc.Safe.sDL_atan2,
  SDL3.Sys.Bindgen.Stdinc.Safe.sDL_atan2f,
  SDL3.Sys.Bindgen.Stdinc.Safe.sDL_ceil,
  SDL3.Sys.Bindgen.Stdinc.Safe.sDL_ceilf,
  SDL3.Sys.Bindgen.Stdinc.Safe.sDL_copysign,
  SDL3.Sys.Bindgen.Stdinc.Safe.sDL_copysignf,
  SDL3.Sys.Bindgen.Stdinc.Safe.sDL_cos,
  SDL3.Sys.Bindgen.Stdinc.Safe.sDL_cosf,
  SDL3.Sys.Bindgen.Stdinc.Safe.sDL_exp,
  SDL3.Sys.Bindgen.Stdinc.Safe.sDL_expf,
  SDL3.Sys.Bindgen.Stdinc.Safe.sDL_fabs,
  SDL3.Sys.Bindgen.Stdinc.Safe.sDL_fabsf,
  SDL3.Sys.Bindgen.Stdinc.Safe.sDL_floor,
  SDL3.Sys.Bindgen.Stdinc.Safe.sDL_floorf,
  SDL3.Sys.Bindgen.Stdinc.Safe.sDL_trunc,
  SDL3.Sys.Bindgen.Stdinc.Safe.sDL_truncf,
  SDL3.Sys.Bindgen.Stdinc.Safe.sDL_fmod,
  SDL3.Sys.Bindgen.Stdinc.Safe.sDL_fmodf,
  SDL3.Sys.Bindgen.Stdinc.Safe.sDL_isinf,
  SDL3.Sys.Bindgen.Stdinc.Safe.sDL_isinff,
  SDL3.Sys.Bindgen.Stdinc.Safe.sDL_isnan,
  SDL3.Sys.Bindgen.Stdinc.Safe.sDL_isnanf,
  SDL3.Sys.Bindgen.Stdinc.Safe.sDL_log,
  SDL3.Sys.Bindgen.Stdinc.Safe.sDL_logf,
  SDL3.Sys.Bindgen.Stdinc.Safe.sDL_log10,
  SDL3.Sys.Bindgen.Stdinc.Safe.sDL_log10f,
  SDL3.Sys.Bindgen.Stdinc.Safe.sDL_modf,
  SDL3.Sys.Bindgen.Stdinc.Safe.sDL_modff,
  SDL3.Sys.Bindgen.Stdinc.Safe.sDL_pow,
  SDL3.Sys.Bindgen.Stdinc.Safe.sDL_powf,
  SDL3.Sys.Bindgen.Stdinc.Safe.sDL_round,
  SDL3.Sys.Bindgen.Stdinc.Safe.sDL_roundf,
  SDL3.Sys.Bindgen.Stdinc.Safe.sDL_scalbn,
  SDL3.Sys.Bindgen.Stdinc.Safe.sDL_scalbnf,
  SDL3.Sys.Bindgen.Stdinc.Safe.sDL_sin,
  SDL3.Sys.Bindgen.Stdinc.Safe.sDL_sinf,
  SDL3.Sys.Bindgen.Stdinc.Safe.sDL_sqrt,
  SDL3.Sys.Bindgen.Stdinc.Safe.sDL_sqrtf,
  SDL3.Sys.Bindgen.Stdinc.Safe.sDL_tan,
  SDL3.Sys.Bindgen.Stdinc.Safe.sDL_tanf,
  SDL3.Sys.Bindgen.Stdinc.Safe.sDL_iconv_open,
  SDL3.Sys.Bindgen.Stdinc.Safe.sDL_iconv_close,
  SDL3.Sys.Bindgen.Stdinc.Safe.sDL_iconv,
  SDL3.Sys.Bindgen.Stdinc.Safe.sDL_iconv_string,
  SDL3.Sys.Bindgen.Stdinc.Safe.sDL_size_mul_check_overflow_builtin,
  SDL3.Sys.Bindgen.Stdinc.Safe.sDL_size_add_check_overflow_builtin,
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
         , "void *hs_bindgen_0fa0437465ff2e3b ("
         , "  size_t arg1"
         , ")"
         , "{"
         , "  return (SDL_malloc)(arg1);"
         , "}"
         , "void *hs_bindgen_12a69b8549cd3a89 ("
         , "  size_t arg1,"
         , "  size_t arg2"
         , ")"
         , "{"
         , "  return (SDL_calloc)(arg1, arg2);"
         , "}"
         , "void *hs_bindgen_749e3624b605eca6 ("
         , "  void *arg1,"
         , "  size_t arg2"
         , ")"
         , "{"
         , "  return (SDL_realloc)(arg1, arg2);"
         , "}"
         , "void hs_bindgen_090b04617f4cc6c8 ("
         , "  void *arg1"
         , ")"
         , "{"
         , "  (SDL_free)(arg1);"
         , "}"
         , "void hs_bindgen_8ba528e1d8cc4754 ("
         , "  SDL_malloc_func *arg1,"
         , "  SDL_calloc_func *arg2,"
         , "  SDL_realloc_func *arg3,"
         , "  SDL_free_func *arg4"
         , ")"
         , "{"
         , "  (SDL_GetOriginalMemoryFunctions)(arg1, arg2, arg3, arg4);"
         , "}"
         , "void hs_bindgen_ad8799017bc65037 ("
         , "  SDL_malloc_func *arg1,"
         , "  SDL_calloc_func *arg2,"
         , "  SDL_realloc_func *arg3,"
         , "  SDL_free_func *arg4"
         , ")"
         , "{"
         , "  (SDL_GetMemoryFunctions)(arg1, arg2, arg3, arg4);"
         , "}"
         , "_Bool hs_bindgen_0320414e5ec49d1b ("
         , "  SDL_malloc_func arg1,"
         , "  SDL_calloc_func arg2,"
         , "  SDL_realloc_func arg3,"
         , "  SDL_free_func arg4"
         , ")"
         , "{"
         , "  return (SDL_SetMemoryFunctions)(arg1, arg2, arg3, arg4);"
         , "}"
         , "void *hs_bindgen_f88d3921cd5e4163 ("
         , "  size_t arg1,"
         , "  size_t arg2"
         , ")"
         , "{"
         , "  return (SDL_aligned_alloc)(arg1, arg2);"
         , "}"
         , "void hs_bindgen_d2d698681f3145f2 ("
         , "  void *arg1"
         , ")"
         , "{"
         , "  (SDL_aligned_free)(arg1);"
         , "}"
         , "signed int hs_bindgen_f0e7f10898be7ba4 (void)"
         , "{"
         , "  return (SDL_GetNumAllocations)();"
         , "}"
         , "SDL_Environment *hs_bindgen_e44727dd9f944e0a (void)"
         , "{"
         , "  return (SDL_GetEnvironment)();"
         , "}"
         , "SDL_Environment *hs_bindgen_5c62fc7482159de0 ("
         , "  _Bool arg1"
         , ")"
         , "{"
         , "  return (SDL_CreateEnvironment)(arg1);"
         , "}"
         , "char const *hs_bindgen_4da0ee2273bc4013 ("
         , "  SDL_Environment *arg1,"
         , "  char const *arg2"
         , ")"
         , "{"
         , "  return (SDL_GetEnvironmentVariable)(arg1, arg2);"
         , "}"
         , "char **hs_bindgen_4c1189e55e8583bb ("
         , "  SDL_Environment *arg1"
         , ")"
         , "{"
         , "  return (SDL_GetEnvironmentVariables)(arg1);"
         , "}"
         , "_Bool hs_bindgen_5824ff8a221d07c0 ("
         , "  SDL_Environment *arg1,"
         , "  char const *arg2,"
         , "  char const *arg3,"
         , "  _Bool arg4"
         , ")"
         , "{"
         , "  return (SDL_SetEnvironmentVariable)(arg1, arg2, arg3, arg4);"
         , "}"
         , "_Bool hs_bindgen_f695a3f593331aff ("
         , "  SDL_Environment *arg1,"
         , "  char const *arg2"
         , ")"
         , "{"
         , "  return (SDL_UnsetEnvironmentVariable)(arg1, arg2);"
         , "}"
         , "void hs_bindgen_1dd67a4722131c01 ("
         , "  SDL_Environment *arg1"
         , ")"
         , "{"
         , "  (SDL_DestroyEnvironment)(arg1);"
         , "}"
         , "char const *hs_bindgen_1af31e6913adf6ff ("
         , "  char const *arg1"
         , ")"
         , "{"
         , "  return (SDL_getenv)(arg1);"
         , "}"
         , "char const *hs_bindgen_5a7e5c07a3b52c7c ("
         , "  char const *arg1"
         , ")"
         , "{"
         , "  return (SDL_getenv_unsafe)(arg1);"
         , "}"
         , "signed int hs_bindgen_e57ac980835e41db ("
         , "  char const *arg1,"
         , "  char const *arg2,"
         , "  signed int arg3"
         , ")"
         , "{"
         , "  return (SDL_setenv_unsafe)(arg1, arg2, arg3);"
         , "}"
         , "signed int hs_bindgen_6237b0757e59fa37 ("
         , "  char const *arg1"
         , ")"
         , "{"
         , "  return (SDL_unsetenv_unsafe)(arg1);"
         , "}"
         , "void hs_bindgen_b81d78a311d44f46 ("
         , "  void *arg1,"
         , "  size_t arg2,"
         , "  size_t arg3,"
         , "  SDL_CompareCallback arg4"
         , ")"
         , "{"
         , "  (SDL_qsort)(arg1, arg2, arg3, arg4);"
         , "}"
         , "void *hs_bindgen_8c9a76f991574084 ("
         , "  void const *arg1,"
         , "  void const *arg2,"
         , "  size_t arg3,"
         , "  size_t arg4,"
         , "  SDL_CompareCallback arg5"
         , ")"
         , "{"
         , "  return (SDL_bsearch)(arg1, arg2, arg3, arg4, arg5);"
         , "}"
         , "void hs_bindgen_d22a2fabdcd748eb ("
         , "  void *arg1,"
         , "  size_t arg2,"
         , "  size_t arg3,"
         , "  SDL_CompareCallback_r arg4,"
         , "  void *arg5"
         , ")"
         , "{"
         , "  (SDL_qsort_r)(arg1, arg2, arg3, arg4, arg5);"
         , "}"
         , "void *hs_bindgen_9cce970e9842407b ("
         , "  void const *arg1,"
         , "  void const *arg2,"
         , "  size_t arg3,"
         , "  size_t arg4,"
         , "  SDL_CompareCallback_r arg5,"
         , "  void *arg6"
         , ")"
         , "{"
         , "  return (SDL_bsearch_r)(arg1, arg2, arg3, arg4, arg5, arg6);"
         , "}"
         , "signed int hs_bindgen_3b7f43f8c476ee06 ("
         , "  signed int arg1"
         , ")"
         , "{"
         , "  return (SDL_abs)(arg1);"
         , "}"
         , "signed int hs_bindgen_9a00314812b7b060 ("
         , "  signed int arg1"
         , ")"
         , "{"
         , "  return (SDL_isalpha)(arg1);"
         , "}"
         , "signed int hs_bindgen_f2e3b47d308f6330 ("
         , "  signed int arg1"
         , ")"
         , "{"
         , "  return (SDL_isalnum)(arg1);"
         , "}"
         , "signed int hs_bindgen_94e1edfbd7c1b6fd ("
         , "  signed int arg1"
         , ")"
         , "{"
         , "  return (SDL_isblank)(arg1);"
         , "}"
         , "signed int hs_bindgen_f4e70f258fc0cd31 ("
         , "  signed int arg1"
         , ")"
         , "{"
         , "  return (SDL_iscntrl)(arg1);"
         , "}"
         , "signed int hs_bindgen_a92ce90ddf0e012f ("
         , "  signed int arg1"
         , ")"
         , "{"
         , "  return (SDL_isdigit)(arg1);"
         , "}"
         , "signed int hs_bindgen_c2fe92c140d522e3 ("
         , "  signed int arg1"
         , ")"
         , "{"
         , "  return (SDL_isxdigit)(arg1);"
         , "}"
         , "signed int hs_bindgen_abdf0b7703d7ef7b ("
         , "  signed int arg1"
         , ")"
         , "{"
         , "  return (SDL_ispunct)(arg1);"
         , "}"
         , "signed int hs_bindgen_b0c62a95d4008bcb ("
         , "  signed int arg1"
         , ")"
         , "{"
         , "  return (SDL_isspace)(arg1);"
         , "}"
         , "signed int hs_bindgen_dbe8ad5b2415f52b ("
         , "  signed int arg1"
         , ")"
         , "{"
         , "  return (SDL_isupper)(arg1);"
         , "}"
         , "signed int hs_bindgen_4f1c801e2ffe74d9 ("
         , "  signed int arg1"
         , ")"
         , "{"
         , "  return (SDL_islower)(arg1);"
         , "}"
         , "signed int hs_bindgen_1de66809f06ec2cf ("
         , "  signed int arg1"
         , ")"
         , "{"
         , "  return (SDL_isprint)(arg1);"
         , "}"
         , "signed int hs_bindgen_7cecb757f16ce85d ("
         , "  signed int arg1"
         , ")"
         , "{"
         , "  return (SDL_isgraph)(arg1);"
         , "}"
         , "signed int hs_bindgen_799fe4e6fc639bc0 ("
         , "  signed int arg1"
         , ")"
         , "{"
         , "  return (SDL_toupper)(arg1);"
         , "}"
         , "signed int hs_bindgen_af600e5bb74004b2 ("
         , "  signed int arg1"
         , ")"
         , "{"
         , "  return (SDL_tolower)(arg1);"
         , "}"
         , "Uint16 hs_bindgen_8b9d7fd6e4874342 ("
         , "  Uint16 arg1,"
         , "  void const *arg2,"
         , "  size_t arg3"
         , ")"
         , "{"
         , "  return (SDL_crc16)(arg1, arg2, arg3);"
         , "}"
         , "Uint32 hs_bindgen_20e1e20820f9c17a ("
         , "  Uint32 arg1,"
         , "  void const *arg2,"
         , "  size_t arg3"
         , ")"
         , "{"
         , "  return (SDL_crc32)(arg1, arg2, arg3);"
         , "}"
         , "Uint32 hs_bindgen_e26385eb1b169df1 ("
         , "  void const *arg1,"
         , "  size_t arg2,"
         , "  Uint32 arg3"
         , ")"
         , "{"
         , "  return (SDL_murmur3_32)(arg1, arg2, arg3);"
         , "}"
         , "void *hs_bindgen_39f43c1520a45f57 ("
         , "  void *arg1,"
         , "  Uint32 arg2,"
         , "  size_t arg3"
         , ")"
         , "{"
         , "  return (SDL_memset4)(arg1, arg2, arg3);"
         , "}"
         , "signed int hs_bindgen_1386d72429f6b9cb ("
         , "  void const *arg1,"
         , "  void const *arg2,"
         , "  size_t arg3"
         , ")"
         , "{"
         , "  return (SDL_memcmp)(arg1, arg2, arg3);"
         , "}"
         , "size_t hs_bindgen_e6c3253fb4b72427 ("
         , "  wchar_t const *arg1"
         , ")"
         , "{"
         , "  return (SDL_wcslen)(arg1);"
         , "}"
         , "size_t hs_bindgen_da04478d43043c90 ("
         , "  wchar_t const *arg1,"
         , "  size_t arg2"
         , ")"
         , "{"
         , "  return (SDL_wcsnlen)(arg1, arg2);"
         , "}"
         , "size_t hs_bindgen_82a9094f0d522cdf ("
         , "  wchar_t *arg1,"
         , "  wchar_t const *arg2,"
         , "  size_t arg3"
         , ")"
         , "{"
         , "  return (SDL_wcslcpy)(arg1, arg2, arg3);"
         , "}"
         , "size_t hs_bindgen_c85ef13eabbd96dd ("
         , "  wchar_t *arg1,"
         , "  wchar_t const *arg2,"
         , "  size_t arg3"
         , ")"
         , "{"
         , "  return (SDL_wcslcat)(arg1, arg2, arg3);"
         , "}"
         , "wchar_t *hs_bindgen_9a5bf9db9506735d ("
         , "  wchar_t const *arg1"
         , ")"
         , "{"
         , "  return (SDL_wcsdup)(arg1);"
         , "}"
         , "wchar_t *hs_bindgen_8807485ad58a476c ("
         , "  wchar_t const *arg1,"
         , "  wchar_t const *arg2"
         , ")"
         , "{"
         , "  return (SDL_wcsstr)(arg1, arg2);"
         , "}"
         , "wchar_t *hs_bindgen_0f95369992d6076d ("
         , "  wchar_t const *arg1,"
         , "  wchar_t const *arg2,"
         , "  size_t arg3"
         , ")"
         , "{"
         , "  return (SDL_wcsnstr)(arg1, arg2, arg3);"
         , "}"
         , "signed int hs_bindgen_a56659eded1129eb ("
         , "  wchar_t const *arg1,"
         , "  wchar_t const *arg2"
         , ")"
         , "{"
         , "  return (SDL_wcscmp)(arg1, arg2);"
         , "}"
         , "signed int hs_bindgen_f249ec61a8d5978a ("
         , "  wchar_t const *arg1,"
         , "  wchar_t const *arg2,"
         , "  size_t arg3"
         , ")"
         , "{"
         , "  return (SDL_wcsncmp)(arg1, arg2, arg3);"
         , "}"
         , "signed int hs_bindgen_0e487d7f98097b0d ("
         , "  wchar_t const *arg1,"
         , "  wchar_t const *arg2"
         , ")"
         , "{"
         , "  return (SDL_wcscasecmp)(arg1, arg2);"
         , "}"
         , "signed int hs_bindgen_9a4ad44438974867 ("
         , "  wchar_t const *arg1,"
         , "  wchar_t const *arg2,"
         , "  size_t arg3"
         , ")"
         , "{"
         , "  return (SDL_wcsncasecmp)(arg1, arg2, arg3);"
         , "}"
         , "size_t hs_bindgen_574becd3bb71e7b9 ("
         , "  char const *arg1"
         , ")"
         , "{"
         , "  return (SDL_strlen)(arg1);"
         , "}"
         , "size_t hs_bindgen_9232c1cbf65df9e5 ("
         , "  char const *arg1,"
         , "  size_t arg2"
         , ")"
         , "{"
         , "  return (SDL_strnlen)(arg1, arg2);"
         , "}"
         , "size_t hs_bindgen_1a460cf112b7fd68 ("
         , "  char *arg1,"
         , "  char const *arg2,"
         , "  size_t arg3"
         , ")"
         , "{"
         , "  return (SDL_strlcpy)(arg1, arg2, arg3);"
         , "}"
         , "size_t hs_bindgen_10b5c948dc68c882 ("
         , "  char *arg1,"
         , "  char const *arg2,"
         , "  size_t arg3"
         , ")"
         , "{"
         , "  return (SDL_utf8strlcpy)(arg1, arg2, arg3);"
         , "}"
         , "size_t hs_bindgen_8132fc050b3dda62 ("
         , "  char *arg1,"
         , "  char const *arg2,"
         , "  size_t arg3"
         , ")"
         , "{"
         , "  return (SDL_strlcat)(arg1, arg2, arg3);"
         , "}"
         , "char *hs_bindgen_e91dd28c0e034753 ("
         , "  char const *arg1"
         , ")"
         , "{"
         , "  return (SDL_strdup)(arg1);"
         , "}"
         , "char *hs_bindgen_9f484a433e6fd1be ("
         , "  char const *arg1,"
         , "  size_t arg2"
         , ")"
         , "{"
         , "  return (SDL_strndup)(arg1, arg2);"
         , "}"
         , "char *hs_bindgen_fd83e6da8cdd54dc ("
         , "  char *arg1"
         , ")"
         , "{"
         , "  return (SDL_strrev)(arg1);"
         , "}"
         , "char *hs_bindgen_4821ca9fe328d7f0 ("
         , "  char *arg1"
         , ")"
         , "{"
         , "  return (SDL_strupr)(arg1);"
         , "}"
         , "char *hs_bindgen_b313d67572ea455e ("
         , "  char *arg1"
         , ")"
         , "{"
         , "  return (SDL_strlwr)(arg1);"
         , "}"
         , "char *hs_bindgen_9b8b80f67620d0c0 ("
         , "  char const *arg1,"
         , "  signed int arg2"
         , ")"
         , "{"
         , "  return (SDL_strchr)(arg1, arg2);"
         , "}"
         , "char *hs_bindgen_61eb1646e2706ec9 ("
         , "  char const *arg1,"
         , "  signed int arg2"
         , ")"
         , "{"
         , "  return (SDL_strrchr)(arg1, arg2);"
         , "}"
         , "char *hs_bindgen_09dae8bc6d27bfa7 ("
         , "  char const *arg1,"
         , "  char const *arg2"
         , ")"
         , "{"
         , "  return (SDL_strstr)(arg1, arg2);"
         , "}"
         , "char *hs_bindgen_b253d6195ad29db6 ("
         , "  char const *arg1,"
         , "  char const *arg2,"
         , "  size_t arg3"
         , ")"
         , "{"
         , "  return (SDL_strnstr)(arg1, arg2, arg3);"
         , "}"
         , "char *hs_bindgen_845c9ada7f0145b4 ("
         , "  char const *arg1,"
         , "  char const *arg2"
         , ")"
         , "{"
         , "  return (SDL_strcasestr)(arg1, arg2);"
         , "}"
         , "char *hs_bindgen_92aad5310bed80bf ("
         , "  char *arg1,"
         , "  char const *arg2,"
         , "  char **arg3"
         , ")"
         , "{"
         , "  return (SDL_strtok_r)(arg1, arg2, arg3);"
         , "}"
         , "size_t hs_bindgen_2fe9c3d14ead61fa ("
         , "  char const *arg1"
         , ")"
         , "{"
         , "  return (SDL_utf8strlen)(arg1);"
         , "}"
         , "size_t hs_bindgen_7e1dc736bb92cf02 ("
         , "  char const *arg1,"
         , "  size_t arg2"
         , ")"
         , "{"
         , "  return (SDL_utf8strnlen)(arg1, arg2);"
         , "}"
         , "char *hs_bindgen_5e87f4eb430750ff ("
         , "  signed int arg1,"
         , "  char *arg2,"
         , "  signed int arg3"
         , ")"
         , "{"
         , "  return (SDL_itoa)(arg1, arg2, arg3);"
         , "}"
         , "char *hs_bindgen_6593301ad3b87e96 ("
         , "  unsigned int arg1,"
         , "  char *arg2,"
         , "  signed int arg3"
         , ")"
         , "{"
         , "  return (SDL_uitoa)(arg1, arg2, arg3);"
         , "}"
         , "char *hs_bindgen_49dab071ddd94418 ("
         , "  signed long long arg1,"
         , "  char *arg2,"
         , "  signed int arg3"
         , ")"
         , "{"
         , "  return (SDL_lltoa)(arg1, arg2, arg3);"
         , "}"
         , "char *hs_bindgen_8c172a64279b6c99 ("
         , "  unsigned long long arg1,"
         , "  char *arg2,"
         , "  signed int arg3"
         , ")"
         , "{"
         , "  return (SDL_ulltoa)(arg1, arg2, arg3);"
         , "}"
         , "signed int hs_bindgen_7ec5dbb16b1ec441 ("
         , "  char const *arg1"
         , ")"
         , "{"
         , "  return (SDL_atoi)(arg1);"
         , "}"
         , "double hs_bindgen_3da67c3a67185baf ("
         , "  char const *arg1"
         , ")"
         , "{"
         , "  return (SDL_atof)(arg1);"
         , "}"
         , "signed long long hs_bindgen_2d4f949f38ae668c ("
         , "  char const *arg1,"
         , "  char **arg2,"
         , "  signed int arg3"
         , ")"
         , "{"
         , "  return (SDL_strtoll)(arg1, arg2, arg3);"
         , "}"
         , "unsigned long long hs_bindgen_af470a839fcf6fbd ("
         , "  char const *arg1,"
         , "  char **arg2,"
         , "  signed int arg3"
         , ")"
         , "{"
         , "  return (SDL_strtoull)(arg1, arg2, arg3);"
         , "}"
         , "double hs_bindgen_717e481bd213c968 ("
         , "  char const *arg1,"
         , "  char **arg2"
         , ")"
         , "{"
         , "  return (SDL_strtod)(arg1, arg2);"
         , "}"
         , "signed int hs_bindgen_114ae5114f0f2f61 ("
         , "  char const *arg1,"
         , "  char const *arg2"
         , ")"
         , "{"
         , "  return (SDL_strcmp)(arg1, arg2);"
         , "}"
         , "signed int hs_bindgen_07f412ca6ac64bca ("
         , "  char const *arg1,"
         , "  char const *arg2,"
         , "  size_t arg3"
         , ")"
         , "{"
         , "  return (SDL_strncmp)(arg1, arg2, arg3);"
         , "}"
         , "signed int hs_bindgen_931c05e65f298770 ("
         , "  char const *arg1,"
         , "  char const *arg2"
         , ")"
         , "{"
         , "  return (SDL_strcasecmp)(arg1, arg2);"
         , "}"
         , "signed int hs_bindgen_974c20bb6f7b7d03 ("
         , "  char const *arg1,"
         , "  char const *arg2,"
         , "  size_t arg3"
         , ")"
         , "{"
         , "  return (SDL_strncasecmp)(arg1, arg2, arg3);"
         , "}"
         , "char *hs_bindgen_50473abaffb3417e ("
         , "  char const *arg1,"
         , "  char const *arg2"
         , ")"
         , "{"
         , "  return (SDL_strpbrk)(arg1, arg2);"
         , "}"
         , "Uint32 hs_bindgen_e49242de1cec91d5 ("
         , "  char const **arg1,"
         , "  size_t *arg2"
         , ")"
         , "{"
         , "  return (SDL_StepUTF8)(arg1, arg2);"
         , "}"
         , "Uint32 hs_bindgen_0346c467944ee189 ("
         , "  char const *arg1,"
         , "  char const **arg2"
         , ")"
         , "{"
         , "  return (SDL_StepBackUTF8)(arg1, arg2);"
         , "}"
         , "char *hs_bindgen_bdc98e385efc6ab7 ("
         , "  Uint32 arg1,"
         , "  char *arg2"
         , ")"
         , "{"
         , "  return (SDL_UCS4ToUTF8)(arg1, arg2);"
         , "}"
         , "void hs_bindgen_bd195a3a2b34e483 ("
         , "  Uint64 arg1"
         , ")"
         , "{"
         , "  (SDL_srand)(arg1);"
         , "}"
         , "Sint32 hs_bindgen_4b2da7e53b63ed17 ("
         , "  Sint32 arg1"
         , ")"
         , "{"
         , "  return (SDL_rand)(arg1);"
         , "}"
         , "float hs_bindgen_91fe5edd016e0570 (void)"
         , "{"
         , "  return (SDL_randf)();"
         , "}"
         , "Uint32 hs_bindgen_5d81c1c12775308d (void)"
         , "{"
         , "  return (SDL_rand_bits)();"
         , "}"
         , "Sint32 hs_bindgen_59abfd01a8d7b8f7 ("
         , "  Uint64 *arg1,"
         , "  Sint32 arg2"
         , ")"
         , "{"
         , "  return (SDL_rand_r)(arg1, arg2);"
         , "}"
         , "float hs_bindgen_5da60fff1ce7873d ("
         , "  Uint64 *arg1"
         , ")"
         , "{"
         , "  return (SDL_randf_r)(arg1);"
         , "}"
         , "Uint32 hs_bindgen_23de01659ed6ba6b ("
         , "  Uint64 *arg1"
         , ")"
         , "{"
         , "  return (SDL_rand_bits_r)(arg1);"
         , "}"
         , "double hs_bindgen_217308a0a788520d ("
         , "  double arg1"
         , ")"
         , "{"
         , "  return (SDL_acos)(arg1);"
         , "}"
         , "float hs_bindgen_f093db4bb5e8e494 ("
         , "  float arg1"
         , ")"
         , "{"
         , "  return (SDL_acosf)(arg1);"
         , "}"
         , "double hs_bindgen_205d9f923dff59cd ("
         , "  double arg1"
         , ")"
         , "{"
         , "  return (SDL_asin)(arg1);"
         , "}"
         , "float hs_bindgen_79771d582742f165 ("
         , "  float arg1"
         , ")"
         , "{"
         , "  return (SDL_asinf)(arg1);"
         , "}"
         , "double hs_bindgen_3051cbc85bd5efba ("
         , "  double arg1"
         , ")"
         , "{"
         , "  return (SDL_atan)(arg1);"
         , "}"
         , "float hs_bindgen_7d0bcd6030adfae6 ("
         , "  float arg1"
         , ")"
         , "{"
         , "  return (SDL_atanf)(arg1);"
         , "}"
         , "double hs_bindgen_9ae010b5b4d9f553 ("
         , "  double arg1,"
         , "  double arg2"
         , ")"
         , "{"
         , "  return (SDL_atan2)(arg1, arg2);"
         , "}"
         , "float hs_bindgen_3eac4b1bfc5aff58 ("
         , "  float arg1,"
         , "  float arg2"
         , ")"
         , "{"
         , "  return (SDL_atan2f)(arg1, arg2);"
         , "}"
         , "double hs_bindgen_1630cb0e3a004beb ("
         , "  double arg1"
         , ")"
         , "{"
         , "  return (SDL_ceil)(arg1);"
         , "}"
         , "float hs_bindgen_04a706bfcc971297 ("
         , "  float arg1"
         , ")"
         , "{"
         , "  return (SDL_ceilf)(arg1);"
         , "}"
         , "double hs_bindgen_fed0484ab850ee6a ("
         , "  double arg1,"
         , "  double arg2"
         , ")"
         , "{"
         , "  return (SDL_copysign)(arg1, arg2);"
         , "}"
         , "float hs_bindgen_d21fe858af73dd98 ("
         , "  float arg1,"
         , "  float arg2"
         , ")"
         , "{"
         , "  return (SDL_copysignf)(arg1, arg2);"
         , "}"
         , "double hs_bindgen_a4c38d6732d22ffb ("
         , "  double arg1"
         , ")"
         , "{"
         , "  return (SDL_cos)(arg1);"
         , "}"
         , "float hs_bindgen_ad11505e8fd49060 ("
         , "  float arg1"
         , ")"
         , "{"
         , "  return (SDL_cosf)(arg1);"
         , "}"
         , "double hs_bindgen_ffaa0913f3d0c63c ("
         , "  double arg1"
         , ")"
         , "{"
         , "  return (SDL_exp)(arg1);"
         , "}"
         , "float hs_bindgen_4d5e3977a4eb4c12 ("
         , "  float arg1"
         , ")"
         , "{"
         , "  return (SDL_expf)(arg1);"
         , "}"
         , "double hs_bindgen_89730ae2b638ee61 ("
         , "  double arg1"
         , ")"
         , "{"
         , "  return (SDL_fabs)(arg1);"
         , "}"
         , "float hs_bindgen_4e76324c9b8f7453 ("
         , "  float arg1"
         , ")"
         , "{"
         , "  return (SDL_fabsf)(arg1);"
         , "}"
         , "double hs_bindgen_4c646d1d6b7e922f ("
         , "  double arg1"
         , ")"
         , "{"
         , "  return (SDL_floor)(arg1);"
         , "}"
         , "float hs_bindgen_db6fbb0a591a2804 ("
         , "  float arg1"
         , ")"
         , "{"
         , "  return (SDL_floorf)(arg1);"
         , "}"
         , "double hs_bindgen_2b4f0ab682c421b7 ("
         , "  double arg1"
         , ")"
         , "{"
         , "  return (SDL_trunc)(arg1);"
         , "}"
         , "float hs_bindgen_afe8ddb39d52a293 ("
         , "  float arg1"
         , ")"
         , "{"
         , "  return (SDL_truncf)(arg1);"
         , "}"
         , "double hs_bindgen_f1fc4d1a8a6fd613 ("
         , "  double arg1,"
         , "  double arg2"
         , ")"
         , "{"
         , "  return (SDL_fmod)(arg1, arg2);"
         , "}"
         , "float hs_bindgen_19c2a30dd6614c51 ("
         , "  float arg1,"
         , "  float arg2"
         , ")"
         , "{"
         , "  return (SDL_fmodf)(arg1, arg2);"
         , "}"
         , "signed int hs_bindgen_9be13530739c3139 ("
         , "  double arg1"
         , ")"
         , "{"
         , "  return (SDL_isinf)(arg1);"
         , "}"
         , "signed int hs_bindgen_d063ada15b71ed19 ("
         , "  float arg1"
         , ")"
         , "{"
         , "  return (SDL_isinff)(arg1);"
         , "}"
         , "signed int hs_bindgen_bb4d9f6611f2a512 ("
         , "  double arg1"
         , ")"
         , "{"
         , "  return (SDL_isnan)(arg1);"
         , "}"
         , "signed int hs_bindgen_48e10ed50de37991 ("
         , "  float arg1"
         , ")"
         , "{"
         , "  return (SDL_isnanf)(arg1);"
         , "}"
         , "double hs_bindgen_46922ccc470e92e0 ("
         , "  double arg1"
         , ")"
         , "{"
         , "  return (SDL_log)(arg1);"
         , "}"
         , "float hs_bindgen_7ef0b9f4239eb37e ("
         , "  float arg1"
         , ")"
         , "{"
         , "  return (SDL_logf)(arg1);"
         , "}"
         , "double hs_bindgen_bc1ad316da1b3bbc ("
         , "  double arg1"
         , ")"
         , "{"
         , "  return (SDL_log10)(arg1);"
         , "}"
         , "float hs_bindgen_310aebbf28df3250 ("
         , "  float arg1"
         , ")"
         , "{"
         , "  return (SDL_log10f)(arg1);"
         , "}"
         , "double hs_bindgen_93a468f91c55ba99 ("
         , "  double arg1,"
         , "  double *arg2"
         , ")"
         , "{"
         , "  return (SDL_modf)(arg1, arg2);"
         , "}"
         , "float hs_bindgen_76a18e33bbbed6ee ("
         , "  float arg1,"
         , "  float *arg2"
         , ")"
         , "{"
         , "  return (SDL_modff)(arg1, arg2);"
         , "}"
         , "double hs_bindgen_b8c28ba00815fbb9 ("
         , "  double arg1,"
         , "  double arg2"
         , ")"
         , "{"
         , "  return (SDL_pow)(arg1, arg2);"
         , "}"
         , "float hs_bindgen_d853802a7561099f ("
         , "  float arg1,"
         , "  float arg2"
         , ")"
         , "{"
         , "  return (SDL_powf)(arg1, arg2);"
         , "}"
         , "double hs_bindgen_097e1eceb090a078 ("
         , "  double arg1"
         , ")"
         , "{"
         , "  return (SDL_round)(arg1);"
         , "}"
         , "float hs_bindgen_5b677097112f1617 ("
         , "  float arg1"
         , ")"
         , "{"
         , "  return (SDL_roundf)(arg1);"
         , "}"
         , "double hs_bindgen_8038e0526522260c ("
         , "  double arg1,"
         , "  signed int arg2"
         , ")"
         , "{"
         , "  return (SDL_scalbn)(arg1, arg2);"
         , "}"
         , "float hs_bindgen_fc0cb80cec8a11b0 ("
         , "  float arg1,"
         , "  signed int arg2"
         , ")"
         , "{"
         , "  return (SDL_scalbnf)(arg1, arg2);"
         , "}"
         , "double hs_bindgen_d062c0d717121757 ("
         , "  double arg1"
         , ")"
         , "{"
         , "  return (SDL_sin)(arg1);"
         , "}"
         , "float hs_bindgen_4ee3ee787bd19e91 ("
         , "  float arg1"
         , ")"
         , "{"
         , "  return (SDL_sinf)(arg1);"
         , "}"
         , "double hs_bindgen_45b7bf5fa33e3269 ("
         , "  double arg1"
         , ")"
         , "{"
         , "  return (SDL_sqrt)(arg1);"
         , "}"
         , "float hs_bindgen_da05b17837e5fa68 ("
         , "  float arg1"
         , ")"
         , "{"
         , "  return (SDL_sqrtf)(arg1);"
         , "}"
         , "double hs_bindgen_8e3c4624ada8d754 ("
         , "  double arg1"
         , ")"
         , "{"
         , "  return (SDL_tan)(arg1);"
         , "}"
         , "float hs_bindgen_b4a5a33f270aeb8d ("
         , "  float arg1"
         , ")"
         , "{"
         , "  return (SDL_tanf)(arg1);"
         , "}"
         , "SDL_iconv_t hs_bindgen_4c58e728caad9aa3 ("
         , "  char const *arg1,"
         , "  char const *arg2"
         , ")"
         , "{"
         , "  return (SDL_iconv_open)(arg1, arg2);"
         , "}"
         , "signed int hs_bindgen_85fcb2de02d7791f ("
         , "  SDL_iconv_t arg1"
         , ")"
         , "{"
         , "  return (SDL_iconv_close)(arg1);"
         , "}"
         , "size_t hs_bindgen_73663c44fcaa8f9d ("
         , "  SDL_iconv_t arg1,"
         , "  char const **arg2,"
         , "  size_t *arg3,"
         , "  char **arg4,"
         , "  size_t *arg5"
         , ")"
         , "{"
         , "  return (SDL_iconv)(arg1, arg2, arg3, arg4, arg5);"
         , "}"
         , "char *hs_bindgen_066c0e98a41d1c6b ("
         , "  char const *arg1,"
         , "  char const *arg2,"
         , "  char const *arg3,"
         , "  size_t arg4"
         , ")"
         , "{"
         , "  return (SDL_iconv_string)(arg1, arg2, arg3, arg4);"
         , "}"
         , "_Bool hs_bindgen_cb7ffceaa134d628 ("
         , "  size_t arg1,"
         , "  size_t arg2,"
         , "  size_t *arg3"
         , ")"
         , "{"
         , "  return (SDL_size_mul_check_overflow_builtin)(arg1, arg2, arg3);"
         , "}"
         , "_Bool hs_bindgen_ca88dcdcdddd2954 ("
         , "  size_t arg1,"
         , "  size_t arg2,"
         , "  size_t *arg3"
         , ")"
         , "{"
         , "  return (SDL_size_add_check_overflow_builtin)(arg1, arg2, arg3);"
         , "}"
         ]
     )
 )

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_malloc@
foreign import ccall safe "hs_bindgen_0fa0437465ff2e3b"
  hs_bindgen_0fa0437465ff2e3b_base
    :: BG.Word64
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_malloc@
hs_bindgen_0fa0437465ff2e3b
  :: HsBindgen.Runtime.LibC.CSize
  -> IO (BG.Ptr BG.Void)
hs_bindgen_0fa0437465ff2e3b =
  BG.fromFFIType hs_bindgen_0fa0437465ff2e3b_base

-- | Allocate uninitialized memory.
--
--     The allocated memory returned by this function must be freed with @SDL_free()@.
--
--     If @size@ is 0, it will be set to 1.
--
--     If the allocation is successful, the returned pointer is guaranteed to be aligned to either the /fundamental alignment/ (@alignof(max_align_t)@ in C11 and later) or @2 * sizeof(void *)@, whichever is smaller. Use @SDL_aligned_alloc()@ if you need to allocate memory aligned to an alignment greater than this guarantee.
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
sDL_malloc
  :: HsBindgen.Runtime.LibC.CSize
  -- ^
  --
  --           [@size@]: the size to allocate.
  -> IO (BG.Ptr BG.Void)
sDL_malloc = hs_bindgen_0fa0437465ff2e3b

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_calloc@
foreign import ccall safe "hs_bindgen_12a69b8549cd3a89"
  hs_bindgen_12a69b8549cd3a89_base
    :: BG.Word64
    -> BG.Word64
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_calloc@
hs_bindgen_12a69b8549cd3a89
  :: HsBindgen.Runtime.LibC.CSize
  -> HsBindgen.Runtime.LibC.CSize
  -> IO (BG.Ptr BG.Void)
hs_bindgen_12a69b8549cd3a89 =
  BG.fromFFIType hs_bindgen_12a69b8549cd3a89_base

-- | [C declaration]: @SDL_calloc@, defined at @SDL3\/SDL_stdinc.h 1366:69@
sDL_calloc
  :: HsBindgen.Runtime.LibC.CSize
  -- ^ [C declaration]: @nmemb@
  -> HsBindgen.Runtime.LibC.CSize
  -- ^ [C declaration]: @size@
  -> IO (BG.Ptr BG.Void)
sDL_calloc = hs_bindgen_12a69b8549cd3a89

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_realloc@
foreign import ccall safe "hs_bindgen_749e3624b605eca6"
  hs_bindgen_749e3624b605eca6_base
    :: BG.Ptr BG.Void
    -> BG.Word64
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_realloc@
hs_bindgen_749e3624b605eca6
  :: BG.Ptr BG.Void
  -> HsBindgen.Runtime.LibC.CSize
  -> IO (BG.Ptr BG.Void)
hs_bindgen_749e3624b605eca6 =
  BG.fromFFIType hs_bindgen_749e3624b605eca6_base

-- | [C declaration]: @SDL_realloc@, defined at @SDL3\/SDL_stdinc.h 1406:54@
sDL_realloc
  :: BG.Ptr BG.Void
  -- ^ [C declaration]: @mem@
  -> HsBindgen.Runtime.LibC.CSize
  -- ^ [C declaration]: @size@
  -> IO (BG.Ptr BG.Void)
sDL_realloc = hs_bindgen_749e3624b605eca6

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_free@
foreign import ccall safe "hs_bindgen_090b04617f4cc6c8"
  hs_bindgen_090b04617f4cc6c8_base
    :: BG.Ptr BG.Void
    -> IO ()

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_free@
hs_bindgen_090b04617f4cc6c8
  :: BG.Ptr BG.Void
  -> IO ()
hs_bindgen_090b04617f4cc6c8 =
  BG.fromFFIType hs_bindgen_090b04617f4cc6c8_base

-- | Free allocated memory.
--
--     The pointer is no longer valid after this call and cannot be dereferenced anymore.
--
--     If @mem@ is NULL, this function does nothing.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_malloc', SDL_calloc, SDL_realloc
--
--     [C declaration]: @SDL_free@, defined at @SDL3\/SDL_stdinc.h 1426:34@
sDL_free
  :: BG.Ptr BG.Void
  -- ^
  --
  --           [@mem@]: a pointer to allocated memory, or NULL.
  -> IO ()
sDL_free = hs_bindgen_090b04617f4cc6c8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_GetOriginalMemoryFunctions@
foreign import ccall safe "hs_bindgen_8ba528e1d8cc4754"
  hs_bindgen_8ba528e1d8cc4754_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO ()

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_GetOriginalMemoryFunctions@
hs_bindgen_8ba528e1d8cc4754
  :: BG.Ptr SDL_malloc_func
  -> BG.Ptr SDL_calloc_func
  -> BG.Ptr SDL_realloc_func
  -> BG.Ptr SDL_free_func
  -> IO ()
hs_bindgen_8ba528e1d8cc4754 =
  BG.fromFFIType hs_bindgen_8ba528e1d8cc4754_base

-- | Get the original set of SDL memory functions.
--
--     This is what SDL_malloc and friends will use by default, if there has been no call to SDL_SetMemoryFunctions. This is not necessarily using the C runtime\'s @malloc@ functions behind the scenes! Different platforms and build configurations might do any number of unexpected things.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_GetOriginalMemoryFunctions@, defined at @SDL3\/SDL_stdinc.h 1524:34@
sDL_GetOriginalMemoryFunctions
  :: BG.Ptr SDL_malloc_func
  -- ^
  --
  --           [@malloc_func@]: filled with malloc function.
  -> BG.Ptr SDL_calloc_func
  -- ^
  --
  --           [@calloc_func@]: filled with calloc function.
  -> BG.Ptr SDL_realloc_func
  -- ^
  --
  --           [@realloc_func@]: filled with realloc function.
  -> BG.Ptr SDL_free_func
  -- ^
  --
  --           [@free_func@]: filled with free function.
  -> IO ()
sDL_GetOriginalMemoryFunctions =
  hs_bindgen_8ba528e1d8cc4754

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_GetMemoryFunctions@
foreign import ccall safe "hs_bindgen_ad8799017bc65037"
  hs_bindgen_ad8799017bc65037_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO ()

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_GetMemoryFunctions@
hs_bindgen_ad8799017bc65037
  :: BG.Ptr SDL_malloc_func
  -> BG.Ptr SDL_calloc_func
  -> BG.Ptr SDL_realloc_func
  -> BG.Ptr SDL_free_func
  -> IO ()
hs_bindgen_ad8799017bc65037 =
  BG.fromFFIType hs_bindgen_ad8799017bc65037_base

-- | Get the current set of SDL memory functions.
--
--     [Thread safety]: This does not hold a lock, so do not call this in the unlikely event of a background thread calling SDL_SetMemoryFunctions simultaneously.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_SetMemoryFunctions', 'sDL_GetOriginalMemoryFunctions'
--
--     [C declaration]: @SDL_GetMemoryFunctions@, defined at @SDL3\/SDL_stdinc.h 1546:34@
sDL_GetMemoryFunctions
  :: BG.Ptr SDL_malloc_func
  -- ^
  --
  --           [@malloc_func@]: filled with malloc function.
  -> BG.Ptr SDL_calloc_func
  -- ^
  --
  --           [@calloc_func@]: filled with calloc function.
  -> BG.Ptr SDL_realloc_func
  -- ^
  --
  --           [@realloc_func@]: filled with realloc function.
  -> BG.Ptr SDL_free_func
  -- ^
  --
  --           [@free_func@]: filled with free function.
  -> IO ()
sDL_GetMemoryFunctions = hs_bindgen_ad8799017bc65037

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_SetMemoryFunctions@
foreign import ccall safe "hs_bindgen_0320414e5ec49d1b"
  hs_bindgen_0320414e5ec49d1b_base
    :: BG.FunPtr BG.Void
    -> BG.FunPtr BG.Void
    -> BG.FunPtr BG.Void
    -> BG.FunPtr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_SetMemoryFunctions@
hs_bindgen_0320414e5ec49d1b
  :: SDL_malloc_func
  -> SDL_calloc_func
  -> SDL_realloc_func
  -> SDL_free_func
  -> IO BG.CBool
hs_bindgen_0320414e5ec49d1b =
  BG.fromFFIType hs_bindgen_0320414e5ec49d1b_base

-- | Replace SDL\'s memory allocation functions with a custom set.
--
--     It is not safe to call this function once any allocations have been made, as future calls to SDL_free will use the new allocator, even if they came from an SDL_malloc made with the old one!
--
--     If used, usually this needs to be the first call made into the SDL library, if not the very first thing done at program startup time.
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
  :: SDL_malloc_func
  -- ^
  --
  --           [@malloc_func@]: custom malloc function.
  -> SDL_calloc_func
  -- ^
  --
  --           [@calloc_func@]: custom calloc function.
  -> SDL_realloc_func
  -- ^
  --
  --           [@realloc_func@]: custom realloc function.
  -> SDL_free_func
  -- ^
  --
  --           [@free_func@]: custom free function.
  -> IO BG.CBool
sDL_SetMemoryFunctions = hs_bindgen_0320414e5ec49d1b

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_aligned_alloc@
foreign import ccall safe "hs_bindgen_f88d3921cd5e4163"
  hs_bindgen_f88d3921cd5e4163_base
    :: BG.Word64
    -> BG.Word64
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_aligned_alloc@
hs_bindgen_f88d3921cd5e4163
  :: HsBindgen.Runtime.LibC.CSize
  -> HsBindgen.Runtime.LibC.CSize
  -> IO (BG.Ptr BG.Void)
hs_bindgen_f88d3921cd5e4163 =
  BG.fromFFIType hs_bindgen_f88d3921cd5e4163_base

-- | Allocate memory aligned to a specific alignment.
--
--     The memory returned by this function must be freed with @SDL_aligned_free()@, /not/ @SDL_free()@.
--
--     If @alignment@ is less than the size of @void *@, it will be increased to match that.
--
--     The returned memory address will be a multiple of the alignment value, and the size of the memory allocated will be a multiple of the alignment value.
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
  :: HsBindgen.Runtime.LibC.CSize
  -- ^
  --
  --           [@alignment@]: the alignment of the memory.
  -> HsBindgen.Runtime.LibC.CSize
  -- ^
  --
  --           [@size@]: the size to allocate.
  -> IO (BG.Ptr BG.Void)
sDL_aligned_alloc = hs_bindgen_f88d3921cd5e4163

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_aligned_free@
foreign import ccall safe "hs_bindgen_d2d698681f3145f2"
  hs_bindgen_d2d698681f3145f2_base
    :: BG.Ptr BG.Void
    -> IO ()

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_aligned_free@
hs_bindgen_d2d698681f3145f2
  :: BG.Ptr BG.Void
  -> IO ()
hs_bindgen_d2d698681f3145f2 =
  BG.fromFFIType hs_bindgen_d2d698681f3145f2_base

-- | Free memory allocated by @SDL_aligned_alloc()@.
--
--     The pointer is no longer valid after this call and cannot be dereferenced anymore.
--
--     If @mem@ is NULL, this function does nothing.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_aligned_alloc'
--
--     [C declaration]: @SDL_aligned_free@, defined at @SDL3\/SDL_stdinc.h 1622:34@
sDL_aligned_free
  :: BG.Ptr BG.Void
  -- ^
  --
  --           [@mem@]: a pointer previously returned by @SDL_aligned_alloc()@, or NULL.
  -> IO ()
sDL_aligned_free = hs_bindgen_d2d698681f3145f2

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_GetNumAllocations@
foreign import ccall safe "hs_bindgen_f0e7f10898be7ba4"
  hs_bindgen_f0e7f10898be7ba4_base
    :: IO BG.Int32

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_GetNumAllocations@
hs_bindgen_f0e7f10898be7ba4 :: IO BG.CInt
hs_bindgen_f0e7f10898be7ba4 =
  BG.fromFFIType hs_bindgen_f0e7f10898be7ba4_base

-- | Get the number of outstanding (unfreed) allocations.
--
--     [Returns]: the number of allocations or -1 if allocation counting is disabled.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_GetNumAllocations@, defined at @SDL3\/SDL_stdinc.h 1634:33@
sDL_GetNumAllocations :: IO BG.CInt
sDL_GetNumAllocations = hs_bindgen_f0e7f10898be7ba4

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_GetEnvironment@
foreign import ccall safe "hs_bindgen_e44727dd9f944e0a"
  hs_bindgen_e44727dd9f944e0a_base
    :: IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_GetEnvironment@
hs_bindgen_e44727dd9f944e0a :: IO (BG.Ptr SDL_Environment)
hs_bindgen_e44727dd9f944e0a =
  BG.fromFFIType hs_bindgen_e44727dd9f944e0a_base

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
sDL_GetEnvironment :: IO (BG.Ptr SDL_Environment)
sDL_GetEnvironment = hs_bindgen_e44727dd9f944e0a

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_CreateEnvironment@
foreign import ccall safe "hs_bindgen_5c62fc7482159de0"
  hs_bindgen_5c62fc7482159de0_base
    :: BG.Word8
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_CreateEnvironment@
hs_bindgen_5c62fc7482159de0
  :: BG.CBool
  -> IO (BG.Ptr SDL_Environment)
hs_bindgen_5c62fc7482159de0 =
  BG.fromFFIType hs_bindgen_5c62fc7482159de0_base

-- | Create a set of environment variables
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
sDL_CreateEnvironment
  :: BG.CBool
  -- ^
  --
  --           [@populated@]: true to initialize it from the C runtime environment, false to create an empty environment.
  -> IO (BG.Ptr SDL_Environment)
sDL_CreateEnvironment = hs_bindgen_5c62fc7482159de0

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_GetEnvironmentVariable@
foreign import ccall safe "hs_bindgen_4da0ee2273bc4013"
  hs_bindgen_4da0ee2273bc4013_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_GetEnvironmentVariable@
hs_bindgen_4da0ee2273bc4013
  :: BG.Ptr SDL_Environment
  -> PtrConst.PtrConst BG.CChar
  -> IO (PtrConst.PtrConst BG.CChar)
hs_bindgen_4da0ee2273bc4013 =
  BG.fromFFIType hs_bindgen_4da0ee2273bc4013_base

-- | Get the value of a variable in the environment.
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
  :: BG.Ptr SDL_Environment
  -- ^
  --
  --           [@env@]: the environment to query.
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@name@]: the name of the variable to get.
  -> IO (PtrConst.PtrConst BG.CChar)
sDL_GetEnvironmentVariable =
  hs_bindgen_4da0ee2273bc4013

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_GetEnvironmentVariables@
foreign import ccall safe "hs_bindgen_4c1189e55e8583bb"
  hs_bindgen_4c1189e55e8583bb_base
    :: BG.Ptr BG.Void
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_GetEnvironmentVariables@
hs_bindgen_4c1189e55e8583bb
  :: BG.Ptr SDL_Environment
  -> IO (BG.Ptr (BG.Ptr BG.CChar))
hs_bindgen_4c1189e55e8583bb =
  BG.fromFFIType hs_bindgen_4c1189e55e8583bb_base

-- | Get all variables in the environment.
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
sDL_GetEnvironmentVariables
  :: BG.Ptr SDL_Environment
  -- ^
  --
  --           [@env@]: the environment to query.
  -> IO (BG.Ptr (BG.Ptr BG.CChar))
sDL_GetEnvironmentVariables =
  hs_bindgen_4c1189e55e8583bb

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_SetEnvironmentVariable@
foreign import ccall safe "hs_bindgen_5824ff8a221d07c0"
  hs_bindgen_5824ff8a221d07c0_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Word8
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_SetEnvironmentVariable@
hs_bindgen_5824ff8a221d07c0
  :: BG.Ptr SDL_Environment
  -> PtrConst.PtrConst BG.CChar
  -> PtrConst.PtrConst BG.CChar
  -> BG.CBool
  -> IO BG.CBool
hs_bindgen_5824ff8a221d07c0 =
  BG.fromFFIType hs_bindgen_5824ff8a221d07c0_base

-- | Set the value of a variable in the environment.
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
  :: BG.Ptr SDL_Environment
  -- ^
  --
  --           [@env@]: the environment to modify.
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@name@]: the name of the variable to set.
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@value@]: the value of the variable to set.
  -> BG.CBool
  -- ^
  --
  --           [@overwrite@]: true to overwrite the variable if it exists, false to return success without setting the variable if it already exists.
  -> IO BG.CBool
sDL_SetEnvironmentVariable =
  hs_bindgen_5824ff8a221d07c0

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_UnsetEnvironmentVariable@
foreign import ccall safe "hs_bindgen_f695a3f593331aff"
  hs_bindgen_f695a3f593331aff_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_UnsetEnvironmentVariable@
hs_bindgen_f695a3f593331aff
  :: BG.Ptr SDL_Environment
  -> PtrConst.PtrConst BG.CChar
  -> IO BG.CBool
hs_bindgen_f695a3f593331aff =
  BG.fromFFIType hs_bindgen_f695a3f593331aff_base

-- | Clear a variable from the environment.
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
  :: BG.Ptr SDL_Environment
  -- ^
  --
  --           [@env@]: the environment to modify.
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@name@]: the name of the variable to unset.
  -> IO BG.CBool
sDL_UnsetEnvironmentVariable =
  hs_bindgen_f695a3f593331aff

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_DestroyEnvironment@
foreign import ccall safe "hs_bindgen_1dd67a4722131c01"
  hs_bindgen_1dd67a4722131c01_base
    :: BG.Ptr BG.Void
    -> IO ()

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_DestroyEnvironment@
hs_bindgen_1dd67a4722131c01
  :: BG.Ptr SDL_Environment
  -> IO ()
hs_bindgen_1dd67a4722131c01 =
  BG.fromFFIType hs_bindgen_1dd67a4722131c01_base

-- | Destroy a set of environment variables.
--
--     [Thread safety]: It is safe to call this function from any thread, as long as the environment is no longer in use.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_CreateEnvironment'
--
--     [C declaration]: @SDL_DestroyEnvironment@, defined at @SDL3\/SDL_stdinc.h 1794:34@
sDL_DestroyEnvironment
  :: BG.Ptr SDL_Environment
  -- ^
  --
  --           [@env@]: the environment to destroy.
  -> IO ()
sDL_DestroyEnvironment = hs_bindgen_1dd67a4722131c01

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_getenv@
foreign import ccall safe "hs_bindgen_1af31e6913adf6ff"
  hs_bindgen_1af31e6913adf6ff_base
    :: BG.Ptr BG.Void
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_getenv@
hs_bindgen_1af31e6913adf6ff
  :: PtrConst.PtrConst BG.CChar
  -> IO (PtrConst.PtrConst BG.CChar)
hs_bindgen_1af31e6913adf6ff =
  BG.fromFFIType hs_bindgen_1af31e6913adf6ff_base

-- | Get the value of a variable in the environment.
--
--     This function uses SDL\'s cached copy of the environment and is thread-safe.
--
--     [Returns]: a pointer to the value of the variable or NULL if it can\'t be found.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_getenv@, defined at @SDL3\/SDL_stdinc.h 1809:42@
sDL_getenv
  :: PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@name@]: the name of the variable to get.
  -> IO (PtrConst.PtrConst BG.CChar)
sDL_getenv = hs_bindgen_1af31e6913adf6ff

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_getenv_unsafe@
foreign import ccall safe "hs_bindgen_5a7e5c07a3b52c7c"
  hs_bindgen_5a7e5c07a3b52c7c_base
    :: BG.Ptr BG.Void
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_getenv_unsafe@
hs_bindgen_5a7e5c07a3b52c7c
  :: PtrConst.PtrConst BG.CChar
  -> IO (PtrConst.PtrConst BG.CChar)
hs_bindgen_5a7e5c07a3b52c7c =
  BG.fromFFIType hs_bindgen_5a7e5c07a3b52c7c_base

-- | Get the value of a variable in the environment.
--
--     This function bypasses SDL\'s cached copy of the environment and is not thread-safe.
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
sDL_getenv_unsafe
  :: PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@name@]: the name of the variable to get.
  -> IO (PtrConst.PtrConst BG.CChar)
sDL_getenv_unsafe = hs_bindgen_5a7e5c07a3b52c7c

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_setenv_unsafe@
foreign import ccall safe "hs_bindgen_e57ac980835e41db"
  hs_bindgen_e57ac980835e41db_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Int32
    -> IO BG.Int32

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_setenv_unsafe@
hs_bindgen_e57ac980835e41db
  :: PtrConst.PtrConst BG.CChar
  -> PtrConst.PtrConst BG.CChar
  -> BG.CInt
  -> IO BG.CInt
hs_bindgen_e57ac980835e41db =
  BG.fromFFIType hs_bindgen_e57ac980835e41db_base

-- | Set the value of a variable in the environment.
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
  :: PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@name@]: the name of the variable to set.
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@value@]: the value of the variable to set.
  -> BG.CInt
  -- ^
  --
  --           [@overwrite@]: 1 to overwrite the variable if it exists, 0 to return success without setting the variable if it already exists.
  -> IO BG.CInt
sDL_setenv_unsafe = hs_bindgen_e57ac980835e41db

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_unsetenv_unsafe@
foreign import ccall safe "hs_bindgen_6237b0757e59fa37"
  hs_bindgen_6237b0757e59fa37_base
    :: BG.Ptr BG.Void
    -> IO BG.Int32

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_unsetenv_unsafe@
hs_bindgen_6237b0757e59fa37
  :: PtrConst.PtrConst BG.CChar
  -> IO BG.CInt
hs_bindgen_6237b0757e59fa37 =
  BG.fromFFIType hs_bindgen_6237b0757e59fa37_base

-- | Clear a variable from the environment.
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
sDL_unsetenv_unsafe
  :: PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@name@]: the name of the variable to unset.
  -> IO BG.CInt
sDL_unsetenv_unsafe = hs_bindgen_6237b0757e59fa37

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_qsort@
foreign import ccall safe "hs_bindgen_b81d78a311d44f46"
  hs_bindgen_b81d78a311d44f46_base
    :: BG.Ptr BG.Void
    -> BG.Word64
    -> BG.Word64
    -> BG.FunPtr BG.Void
    -> IO ()

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_qsort@
hs_bindgen_b81d78a311d44f46
  :: BG.Ptr BG.Void
  -> HsBindgen.Runtime.LibC.CSize
  -> HsBindgen.Runtime.LibC.CSize
  -> SDL_CompareCallback
  -> IO ()
hs_bindgen_b81d78a311d44f46 =
  BG.fromFFIType hs_bindgen_b81d78a311d44f46_base

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
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_bsearch', 'sDL_qsort_r'
--
--     [C declaration]: @SDL_qsort@, defined at @SDL3\/SDL_stdinc.h 1923:34@
sDL_qsort
  :: BG.Ptr BG.Void
  -- ^
  --
  --           [@base@]: a pointer to the start of the array.
  -> HsBindgen.Runtime.LibC.CSize
  -- ^
  --
  --           [@nmemb@]: the number of elements in the array.
  -> HsBindgen.Runtime.LibC.CSize
  -- ^
  --
  --           [@size@]: the size of the elements in the array.
  -> SDL_CompareCallback
  -- ^
  --
  --           [@compare@]: a function used to compare elements in the array.
  -> IO ()
sDL_qsort = hs_bindgen_b81d78a311d44f46

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_bsearch@
foreign import ccall safe "hs_bindgen_8c9a76f991574084"
  hs_bindgen_8c9a76f991574084_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Word64
    -> BG.Word64
    -> BG.FunPtr BG.Void
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_bsearch@
hs_bindgen_8c9a76f991574084
  :: PtrConst.PtrConst BG.Void
  -> PtrConst.PtrConst BG.Void
  -> HsBindgen.Runtime.LibC.CSize
  -> HsBindgen.Runtime.LibC.CSize
  -> SDL_CompareCallback
  -> IO (BG.Ptr BG.Void)
hs_bindgen_8c9a76f991574084 =
  BG.fromFFIType hs_bindgen_8c9a76f991574084_base

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
  :: PtrConst.PtrConst BG.Void
  -- ^
  --
  --           [@key@]: a pointer to a key equal to the element being searched for.
  -> PtrConst.PtrConst BG.Void
  -- ^
  --
  --           [@base@]: a pointer to the start of the array.
  -> HsBindgen.Runtime.LibC.CSize
  -- ^
  --
  --           [@nmemb@]: the number of elements in the array.
  -> HsBindgen.Runtime.LibC.CSize
  -- ^
  --
  --           [@size@]: the size of the elements in the array.
  -> SDL_CompareCallback
  -- ^
  --
  --           [@compare@]: a function used to compare elements in the array.
  -> IO (BG.Ptr BG.Void)
sDL_bsearch = hs_bindgen_8c9a76f991574084

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_qsort_r@
foreign import ccall safe "hs_bindgen_d22a2fabdcd748eb"
  hs_bindgen_d22a2fabdcd748eb_base
    :: BG.Ptr BG.Void
    -> BG.Word64
    -> BG.Word64
    -> BG.FunPtr BG.Void
    -> BG.Ptr BG.Void
    -> IO ()

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_qsort_r@
hs_bindgen_d22a2fabdcd748eb
  :: BG.Ptr BG.Void
  -> HsBindgen.Runtime.LibC.CSize
  -> HsBindgen.Runtime.LibC.CSize
  -> SDL_CompareCallback_r
  -> BG.Ptr BG.Void
  -> IO ()
hs_bindgen_d22a2fabdcd748eb =
  BG.fromFFIType hs_bindgen_d22a2fabdcd748eb_base

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
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_bsearch_r', 'sDL_qsort'
--
--     [C declaration]: @SDL_qsort_r@, defined at @SDL3\/SDL_stdinc.h 2043:34@
sDL_qsort_r
  :: BG.Ptr BG.Void
  -- ^
  --
  --           [@base@]: a pointer to the start of the array.
  -> HsBindgen.Runtime.LibC.CSize
  -- ^
  --
  --           [@nmemb@]: the number of elements in the array.
  -> HsBindgen.Runtime.LibC.CSize
  -- ^
  --
  --           [@size@]: the size of the elements in the array.
  -> SDL_CompareCallback_r
  -- ^
  --
  --           [@compare@]: a function used to compare elements in the array.
  -> BG.Ptr BG.Void
  -- ^
  --
  --           [@userdata@]: a pointer to pass to the compare function.
  -> IO ()
sDL_qsort_r = hs_bindgen_d22a2fabdcd748eb

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_bsearch_r@
foreign import ccall safe "hs_bindgen_9cce970e9842407b"
  hs_bindgen_9cce970e9842407b_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Word64
    -> BG.Word64
    -> BG.FunPtr BG.Void
    -> BG.Ptr BG.Void
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_bsearch_r@
hs_bindgen_9cce970e9842407b
  :: PtrConst.PtrConst BG.Void
  -> PtrConst.PtrConst BG.Void
  -> HsBindgen.Runtime.LibC.CSize
  -> HsBindgen.Runtime.LibC.CSize
  -> SDL_CompareCallback_r
  -> BG.Ptr BG.Void
  -> IO (BG.Ptr BG.Void)
hs_bindgen_9cce970e9842407b =
  BG.fromFFIType hs_bindgen_9cce970e9842407b_base

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
  :: PtrConst.PtrConst BG.Void
  -- ^
  --
  --           [@key@]: a pointer to a key equal to the element being searched for.
  -> PtrConst.PtrConst BG.Void
  -- ^
  --
  --           [@base@]: a pointer to the start of the array.
  -> HsBindgen.Runtime.LibC.CSize
  -- ^
  --
  --           [@nmemb@]: the number of elements in the array.
  -> HsBindgen.Runtime.LibC.CSize
  -- ^
  --
  --           [@size@]: the size of the elements in the array.
  -> SDL_CompareCallback_r
  -- ^
  --
  --           [@compare@]: a function used to compare elements in the array.
  -> BG.Ptr BG.Void
  -- ^
  --
  --           [@userdata@]: a pointer to pass to the compare function.
  -> IO (BG.Ptr BG.Void)
sDL_bsearch_r = hs_bindgen_9cce970e9842407b

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_abs@
foreign import ccall safe "hs_bindgen_3b7f43f8c476ee06"
  hs_bindgen_3b7f43f8c476ee06_base
    :: BG.Int32
    -> IO BG.Int32

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_abs@
hs_bindgen_3b7f43f8c476ee06
  :: BG.CInt
  -> IO BG.CInt
hs_bindgen_3b7f43f8c476ee06 =
  BG.fromFFIType hs_bindgen_3b7f43f8c476ee06_base

-- | Compute the absolute value of @x@.
--
--     [Returns]: the absolute value of x.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_abs@, defined at @SDL3\/SDL_stdinc.h 2113:33@
sDL_abs
  :: BG.CInt
  -- ^
  --
  --           [@x@]: an integer value.
  -> IO BG.CInt
sDL_abs = hs_bindgen_3b7f43f8c476ee06

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_isalpha@
foreign import ccall safe "hs_bindgen_9a00314812b7b060"
  hs_bindgen_9a00314812b7b060_base
    :: BG.Int32
    -> IO BG.Int32

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_isalpha@
hs_bindgen_9a00314812b7b060
  :: BG.CInt
  -> IO BG.CInt
hs_bindgen_9a00314812b7b060 =
  BG.fromFFIType hs_bindgen_9a00314812b7b060_base

-- | Query if a character is alphabetic (a letter).
--
--     __WARNING__: Regardless of system locale, this will only treat ASCII values for English \'a-z\' and \'A-Z\' as true.
--
--     [Returns]: non-zero if x falls within the character class, zero otherwise.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_isalpha@, defined at @SDL3\/SDL_stdinc.h 2188:33@
sDL_isalpha
  :: BG.CInt
  -- ^
  --
  --           [@x@]: character value to check.
  -> IO BG.CInt
sDL_isalpha = hs_bindgen_9a00314812b7b060

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_isalnum@
foreign import ccall safe "hs_bindgen_f2e3b47d308f6330"
  hs_bindgen_f2e3b47d308f6330_base
    :: BG.Int32
    -> IO BG.Int32

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_isalnum@
hs_bindgen_f2e3b47d308f6330
  :: BG.CInt
  -> IO BG.CInt
hs_bindgen_f2e3b47d308f6330 =
  BG.fromFFIType hs_bindgen_f2e3b47d308f6330_base

-- | Query if a character is alphabetic (a letter) or a number.
--
--     __WARNING__: Regardless of system locale, this will only treat ASCII values for English \'a-z\', \'A-Z\', and \'0-9\' as true.
--
--     [Returns]: non-zero if x falls within the character class, zero otherwise.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_isalnum@, defined at @SDL3\/SDL_stdinc.h 2203:33@
sDL_isalnum
  :: BG.CInt
  -- ^
  --
  --           [@x@]: character value to check.
  -> IO BG.CInt
sDL_isalnum = hs_bindgen_f2e3b47d308f6330

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_isblank@
foreign import ccall safe "hs_bindgen_94e1edfbd7c1b6fd"
  hs_bindgen_94e1edfbd7c1b6fd_base
    :: BG.Int32
    -> IO BG.Int32

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_isblank@
hs_bindgen_94e1edfbd7c1b6fd
  :: BG.CInt
  -> IO BG.CInt
hs_bindgen_94e1edfbd7c1b6fd =
  BG.fromFFIType hs_bindgen_94e1edfbd7c1b6fd_base

-- | Report if a character is blank (a space or tab).
--
--     __WARNING__: Regardless of system locale, this will only treat ASCII values 0x20 (space) or 0x9 (tab) as true.
--
--     [Returns]: non-zero if x falls within the character class, zero otherwise.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_isblank@, defined at @SDL3\/SDL_stdinc.h 2218:33@
sDL_isblank
  :: BG.CInt
  -- ^
  --
  --           [@x@]: character value to check.
  -> IO BG.CInt
sDL_isblank = hs_bindgen_94e1edfbd7c1b6fd

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_iscntrl@
foreign import ccall safe "hs_bindgen_f4e70f258fc0cd31"
  hs_bindgen_f4e70f258fc0cd31_base
    :: BG.Int32
    -> IO BG.Int32

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_iscntrl@
hs_bindgen_f4e70f258fc0cd31
  :: BG.CInt
  -> IO BG.CInt
hs_bindgen_f4e70f258fc0cd31 =
  BG.fromFFIType hs_bindgen_f4e70f258fc0cd31_base

-- | Report if a character is a control character.
--
--     __WARNING__: Regardless of system locale, this will only treat ASCII values 0 through 0x1F, and 0x7F, as true.
--
--     [Returns]: non-zero if x falls within the character class, zero otherwise.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_iscntrl@, defined at @SDL3\/SDL_stdinc.h 2233:33@
sDL_iscntrl
  :: BG.CInt
  -- ^
  --
  --           [@x@]: character value to check.
  -> IO BG.CInt
sDL_iscntrl = hs_bindgen_f4e70f258fc0cd31

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_isdigit@
foreign import ccall safe "hs_bindgen_a92ce90ddf0e012f"
  hs_bindgen_a92ce90ddf0e012f_base
    :: BG.Int32
    -> IO BG.Int32

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_isdigit@
hs_bindgen_a92ce90ddf0e012f
  :: BG.CInt
  -> IO BG.CInt
hs_bindgen_a92ce90ddf0e012f =
  BG.fromFFIType hs_bindgen_a92ce90ddf0e012f_base

-- | Report if a character is a numeric digit.
--
--     __WARNING__: Regardless of system locale, this will only treat ASCII values \'0\' (0x30) through \'9\' (0x39), as true.
--
--     [Returns]: non-zero if x falls within the character class, zero otherwise.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_isdigit@, defined at @SDL3\/SDL_stdinc.h 2248:33@
sDL_isdigit
  :: BG.CInt
  -- ^
  --
  --           [@x@]: character value to check.
  -> IO BG.CInt
sDL_isdigit = hs_bindgen_a92ce90ddf0e012f

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_isxdigit@
foreign import ccall safe "hs_bindgen_c2fe92c140d522e3"
  hs_bindgen_c2fe92c140d522e3_base
    :: BG.Int32
    -> IO BG.Int32

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_isxdigit@
hs_bindgen_c2fe92c140d522e3
  :: BG.CInt
  -> IO BG.CInt
hs_bindgen_c2fe92c140d522e3 =
  BG.fromFFIType hs_bindgen_c2fe92c140d522e3_base

-- | Report if a character is a hexadecimal digit.
--
--     __WARNING__: Regardless of system locale, this will only treat ASCII values \'A\' through \'F\', \'a\' through \'f\', and \'0\' through \'9\', as true.
--
--     [Returns]: non-zero if x falls within the character class, zero otherwise.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_isxdigit@, defined at @SDL3\/SDL_stdinc.h 2263:33@
sDL_isxdigit
  :: BG.CInt
  -- ^
  --
  --           [@x@]: character value to check.
  -> IO BG.CInt
sDL_isxdigit = hs_bindgen_c2fe92c140d522e3

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_ispunct@
foreign import ccall safe "hs_bindgen_abdf0b7703d7ef7b"
  hs_bindgen_abdf0b7703d7ef7b_base
    :: BG.Int32
    -> IO BG.Int32

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_ispunct@
hs_bindgen_abdf0b7703d7ef7b
  :: BG.CInt
  -> IO BG.CInt
hs_bindgen_abdf0b7703d7ef7b =
  BG.fromFFIType hs_bindgen_abdf0b7703d7ef7b_base

-- | Report if a character is a punctuation mark.
--
--     __WARNING__: Regardless of system locale, this is equivalent to @((SDL_isgraph(x)) && (!SDL_isalnum(x)))@.
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
sDL_ispunct
  :: BG.CInt
  -- ^
  --
  --           [@x@]: character value to check.
  -> IO BG.CInt
sDL_ispunct = hs_bindgen_abdf0b7703d7ef7b

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_isspace@
foreign import ccall safe "hs_bindgen_b0c62a95d4008bcb"
  hs_bindgen_b0c62a95d4008bcb_base
    :: BG.Int32
    -> IO BG.Int32

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_isspace@
hs_bindgen_b0c62a95d4008bcb
  :: BG.CInt
  -> IO BG.CInt
hs_bindgen_b0c62a95d4008bcb =
  BG.fromFFIType hs_bindgen_b0c62a95d4008bcb_base

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
--     [Returns]: non-zero if x falls within the character class, zero otherwise.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_isspace@, defined at @SDL3\/SDL_stdinc.h 2303:33@
sDL_isspace
  :: BG.CInt
  -- ^
  --
  --           [@x@]: character value to check.
  -> IO BG.CInt
sDL_isspace = hs_bindgen_b0c62a95d4008bcb

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_isupper@
foreign import ccall safe "hs_bindgen_dbe8ad5b2415f52b"
  hs_bindgen_dbe8ad5b2415f52b_base
    :: BG.Int32
    -> IO BG.Int32

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_isupper@
hs_bindgen_dbe8ad5b2415f52b
  :: BG.CInt
  -> IO BG.CInt
hs_bindgen_dbe8ad5b2415f52b =
  BG.fromFFIType hs_bindgen_dbe8ad5b2415f52b_base

-- | Report if a character is upper case.
--
--     __WARNING__: Regardless of system locale, this will only treat ASCII values \'A\' through \'Z\' as true.
--
--     [Returns]: non-zero if x falls within the character class, zero otherwise.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_isupper@, defined at @SDL3\/SDL_stdinc.h 2318:33@
sDL_isupper
  :: BG.CInt
  -- ^
  --
  --           [@x@]: character value to check.
  -> IO BG.CInt
sDL_isupper = hs_bindgen_dbe8ad5b2415f52b

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_islower@
foreign import ccall safe "hs_bindgen_4f1c801e2ffe74d9"
  hs_bindgen_4f1c801e2ffe74d9_base
    :: BG.Int32
    -> IO BG.Int32

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_islower@
hs_bindgen_4f1c801e2ffe74d9
  :: BG.CInt
  -> IO BG.CInt
hs_bindgen_4f1c801e2ffe74d9 =
  BG.fromFFIType hs_bindgen_4f1c801e2ffe74d9_base

-- | Report if a character is lower case.
--
--     __WARNING__: Regardless of system locale, this will only treat ASCII values \'a\' through \'z\' as true.
--
--     [Returns]: non-zero if x falls within the character class, zero otherwise.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_islower@, defined at @SDL3\/SDL_stdinc.h 2333:33@
sDL_islower
  :: BG.CInt
  -- ^
  --
  --           [@x@]: character value to check.
  -> IO BG.CInt
sDL_islower = hs_bindgen_4f1c801e2ffe74d9

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_isprint@
foreign import ccall safe "hs_bindgen_1de66809f06ec2cf"
  hs_bindgen_1de66809f06ec2cf_base
    :: BG.Int32
    -> IO BG.Int32

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_isprint@
hs_bindgen_1de66809f06ec2cf
  :: BG.CInt
  -> IO BG.CInt
hs_bindgen_1de66809f06ec2cf =
  BG.fromFFIType hs_bindgen_1de66809f06ec2cf_base

-- | Report if a character is \"printable\".
--
--     Be advised that \"printable\" has a definition that goes back to text terminals from the dawn of computing, making this a sort of special case function that is not suitable for Unicode (or most any) text management.
--
--     __WARNING__: Regardless of system locale, this will only treat ASCII values \' \' (0x20) through \'~\' (0x7E) as true.
--
--     [Returns]: non-zero if x falls within the character class, zero otherwise.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_isprint@, defined at @SDL3\/SDL_stdinc.h 2352:33@
sDL_isprint
  :: BG.CInt
  -- ^
  --
  --           [@x@]: character value to check.
  -> IO BG.CInt
sDL_isprint = hs_bindgen_1de66809f06ec2cf

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_isgraph@
foreign import ccall safe "hs_bindgen_7cecb757f16ce85d"
  hs_bindgen_7cecb757f16ce85d_base
    :: BG.Int32
    -> IO BG.Int32

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_isgraph@
hs_bindgen_7cecb757f16ce85d
  :: BG.CInt
  -> IO BG.CInt
hs_bindgen_7cecb757f16ce85d =
  BG.fromFFIType hs_bindgen_7cecb757f16ce85d_base

-- | Report if a character is any \"printable\" except space.
--
--     Be advised that \"printable\" has a definition that goes back to text terminals from the dawn of computing, making this a sort of special case function that is not suitable for Unicode (or most any) text management.
--
--     __WARNING__: Regardless of system locale, this is equivalent to @(SDL_isprint(x)) && ((x) != \' \')@.
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
sDL_isgraph
  :: BG.CInt
  -- ^
  --
  --           [@x@]: character value to check.
  -> IO BG.CInt
sDL_isgraph = hs_bindgen_7cecb757f16ce85d

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_toupper@
foreign import ccall safe "hs_bindgen_799fe4e6fc639bc0"
  hs_bindgen_799fe4e6fc639bc0_base
    :: BG.Int32
    -> IO BG.Int32

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_toupper@
hs_bindgen_799fe4e6fc639bc0
  :: BG.CInt
  -> IO BG.CInt
hs_bindgen_799fe4e6fc639bc0 =
  BG.fromFFIType hs_bindgen_799fe4e6fc639bc0_base

-- | Convert low-ASCII English letters to uppercase.
--
--     __WARNING__: Regardless of system locale, this will only convert ASCII values \'a\' through \'z\' to uppercase.
--
--     This function returns the uppercase equivalent of @x@. If a character cannot be converted, or is already uppercase, this function returns @x@.
--
--     [Returns]: capitalized version of x, or x if no conversion available.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_toupper@, defined at @SDL3\/SDL_stdinc.h 2391:33@
sDL_toupper
  :: BG.CInt
  -- ^
  --
  --           [@x@]: character value to check.
  -> IO BG.CInt
sDL_toupper = hs_bindgen_799fe4e6fc639bc0

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_tolower@
foreign import ccall safe "hs_bindgen_af600e5bb74004b2"
  hs_bindgen_af600e5bb74004b2_base
    :: BG.Int32
    -> IO BG.Int32

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_tolower@
hs_bindgen_af600e5bb74004b2
  :: BG.CInt
  -> IO BG.CInt
hs_bindgen_af600e5bb74004b2 =
  BG.fromFFIType hs_bindgen_af600e5bb74004b2_base

-- | Convert low-ASCII English letters to lowercase.
--
--     __WARNING__: Regardless of system locale, this will only convert ASCII values \'A\' through \'Z\' to lowercase.
--
--     This function returns the lowercase equivalent of @x@. If a character cannot be converted, or is already lowercase, this function returns @x@.
--
--     [Returns]: lowercase version of x, or x if no conversion available.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_tolower@, defined at @SDL3\/SDL_stdinc.h 2409:33@
sDL_tolower
  :: BG.CInt
  -- ^
  --
  --           [@x@]: character value to check.
  -> IO BG.CInt
sDL_tolower = hs_bindgen_af600e5bb74004b2

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_crc16@
foreign import ccall safe "hs_bindgen_8b9d7fd6e4874342"
  hs_bindgen_8b9d7fd6e4874342_base
    :: BG.Word16
    -> BG.Ptr BG.Void
    -> BG.Word64
    -> IO BG.Word16

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_crc16@
hs_bindgen_8b9d7fd6e4874342
  :: Uint16
  -> PtrConst.PtrConst BG.Void
  -> HsBindgen.Runtime.LibC.CSize
  -> IO Uint16
hs_bindgen_8b9d7fd6e4874342 =
  BG.fromFFIType hs_bindgen_8b9d7fd6e4874342_base

-- | Calculate a CRC-16 value.
--
--     [https:\/\/en.wikipedia.org\/wiki\/Cyclic_redundancy_check](https://en.wikipedia.org/wiki/Cyclic_redundancy_check)
--
--     This function can be called multiple times, to stream data to be checksummed in blocks. Each call must provide the previous CRC-16 return value to be updated with the next block. The first call to this function for a set of blocks should pass in a zero CRC value.
--
--     [Returns]: a CRC-16 checksum value of all blocks in the data set.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_crc16@, defined at @SDL3\/SDL_stdinc.h 2430:36@
sDL_crc16
  :: Uint16
  -- ^
  --
  --           [@crc@]: the current checksum for this data set, or 0 for a new data set.
  -> PtrConst.PtrConst BG.Void
  -- ^
  --
  --           [@data@]: a new block of data to add to the checksum.
  -> HsBindgen.Runtime.LibC.CSize
  -- ^
  --
  --           [@len@]: the size, in bytes, of the new block of data.
  -> IO Uint16
sDL_crc16 = hs_bindgen_8b9d7fd6e4874342

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_crc32@
foreign import ccall safe "hs_bindgen_20e1e20820f9c17a"
  hs_bindgen_20e1e20820f9c17a_base
    :: BG.Word32
    -> BG.Ptr BG.Void
    -> BG.Word64
    -> IO BG.Word32

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_crc32@
hs_bindgen_20e1e20820f9c17a
  :: Uint32
  -> PtrConst.PtrConst BG.Void
  -> HsBindgen.Runtime.LibC.CSize
  -> IO Uint32
hs_bindgen_20e1e20820f9c17a =
  BG.fromFFIType hs_bindgen_20e1e20820f9c17a_base

-- | Calculate a CRC-32 value.
--
--     [https:\/\/en.wikipedia.org\/wiki\/Cyclic_redundancy_check](https://en.wikipedia.org/wiki/Cyclic_redundancy_check)
--
--     This function can be called multiple times, to stream data to be checksummed in blocks. Each call must provide the previous CRC-32 return value to be updated with the next block. The first call to this function for a set of blocks should pass in a zero CRC value.
--
--     [Returns]: a CRC-32 checksum value of all blocks in the data set.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_crc32@, defined at @SDL3\/SDL_stdinc.h 2451:36@
sDL_crc32
  :: Uint32
  -- ^
  --
  --           [@crc@]: the current checksum for this data set, or 0 for a new data set.
  -> PtrConst.PtrConst BG.Void
  -- ^
  --
  --           [@data@]: a new block of data to add to the checksum.
  -> HsBindgen.Runtime.LibC.CSize
  -- ^
  --
  --           [@len@]: the size, in bytes, of the new block of data.
  -> IO Uint32
sDL_crc32 = hs_bindgen_20e1e20820f9c17a

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_murmur3_32@
foreign import ccall safe "hs_bindgen_e26385eb1b169df1"
  hs_bindgen_e26385eb1b169df1_base
    :: BG.Ptr BG.Void
    -> BG.Word64
    -> BG.Word32
    -> IO BG.Word32

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_murmur3_32@
hs_bindgen_e26385eb1b169df1
  :: PtrConst.PtrConst BG.Void
  -> HsBindgen.Runtime.LibC.CSize
  -> Uint32
  -> IO Uint32
hs_bindgen_e26385eb1b169df1 =
  BG.fromFFIType hs_bindgen_e26385eb1b169df1_base

-- | Calculate a 32-bit MurmurHash3 value for a block of data.
--
--     [https:\/\/en.wikipedia.org\/wiki\/MurmurHash](https://en.wikipedia.org/wiki/MurmurHash)
--
--     A seed may be specified, which changes the final results consistently, but this does not work like SDL_crc16 and SDL_crc32: you can\'t feed a previous result from this function back into itself as the next seed value to calculate a hash in chunks; it won\'t produce the same hash as it would if the same data was provided in a single call.
--
--     If you aren\'t sure what to provide for a seed, zero is fine. Murmur3 is not cryptographically secure, so it shouldn\'t be used for hashing top-secret data.
--
--     [Returns]: a Murmur3 32-bit hash value.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_murmur3_32@, defined at @SDL3\/SDL_stdinc.h 2477:36@
sDL_murmur3_32
  :: PtrConst.PtrConst BG.Void
  -- ^
  --
  --           [@data@]: the data to be hashed.
  -> HsBindgen.Runtime.LibC.CSize
  -- ^
  --
  --           [@len@]: the size of data, in bytes.
  -> Uint32
  -- ^
  --
  --           [@seed@]: a value that alters the final hash value.
  -> IO Uint32
sDL_murmur3_32 = hs_bindgen_e26385eb1b169df1

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_memset4@
foreign import ccall safe "hs_bindgen_39f43c1520a45f57"
  hs_bindgen_39f43c1520a45f57_base
    :: BG.Ptr BG.Void
    -> BG.Word32
    -> BG.Word64
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_memset4@
hs_bindgen_39f43c1520a45f57
  :: BG.Ptr BG.Void
  -> Uint32
  -> HsBindgen.Runtime.LibC.CSize
  -> IO (BG.Ptr BG.Void)
hs_bindgen_39f43c1520a45f57 =
  BG.fromFFIType hs_bindgen_39f43c1520a45f57_base

-- | Initialize all 32-bit words of buffer of memory to a specific value.
--
--     This function will set a buffer of @dwords@ 'Uint32' values, pointed to by @dst@, to the value specified in @val@.
--
--     Unlike SDL_memset, this sets 32-bit values, not bytes, so it\'s not limited to a range of 0-255.
--
--     [Returns]: @dst@.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_memset4@, defined at @SDL3\/SDL_stdinc.h 2601:36@
sDL_memset4
  :: BG.Ptr BG.Void
  -- ^
  --
  --           [@dst@]: the destination memory region. Must not be NULL.
  -> Uint32
  -- ^
  --
  --           [@val@]: the 'Uint32' value to set.
  -> HsBindgen.Runtime.LibC.CSize
  -- ^
  --
  --           [@dwords@]: the number of 'Uint32' values to set in @dst@.
  -> IO (BG.Ptr BG.Void)
sDL_memset4 = hs_bindgen_39f43c1520a45f57

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_memcmp@
foreign import ccall safe "hs_bindgen_1386d72429f6b9cb"
  hs_bindgen_1386d72429f6b9cb_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Word64
    -> IO BG.Int32

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_memcmp@
hs_bindgen_1386d72429f6b9cb
  :: PtrConst.PtrConst BG.Void
  -> PtrConst.PtrConst BG.Void
  -> HsBindgen.Runtime.LibC.CSize
  -> IO BG.CInt
hs_bindgen_1386d72429f6b9cb =
  BG.fromFFIType hs_bindgen_1386d72429f6b9cb_base

-- | Compare two buffers of memory.
--
--     [Returns]: less than zero if s1 is \"less than\" s2, greater than zero if s1 is \"greater than\" s2, and zero if the buffers match exactly for @len@ bytes.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_memcmp@, defined at @SDL3\/SDL_stdinc.h 2683:33@
sDL_memcmp
  :: PtrConst.PtrConst BG.Void
  -- ^
  --
  --           [@s1@]: the first buffer to compare. NULL is not permitted!
  -> PtrConst.PtrConst BG.Void
  -- ^
  --
  --           [@s2@]: the second buffer to compare. NULL is not permitted!
  -> HsBindgen.Runtime.LibC.CSize
  -- ^
  --
  --           [@len@]: the number of bytes to compare between the buffers.
  -> IO BG.CInt
sDL_memcmp = hs_bindgen_1386d72429f6b9cb

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_wcslen@
foreign import ccall safe "hs_bindgen_e6c3253fb4b72427"
  hs_bindgen_e6c3253fb4b72427_base
    :: BG.Ptr BG.Void
    -> IO BG.Word64

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_wcslen@
hs_bindgen_e6c3253fb4b72427
  :: PtrConst.PtrConst HsBindgen.Runtime.LibC.CWchar
  -> IO HsBindgen.Runtime.LibC.CSize
hs_bindgen_e6c3253fb4b72427 =
  BG.fromFFIType hs_bindgen_e6c3253fb4b72427_base

-- | This works exactly like wcslen() but doesn\'t require access to a C runtime.
--
--     Counts the number of wchar_t values in @wstr@, excluding the null terminator.
--
--     Like SDL_strlen only counts bytes and not codepoints in a UTF-8 string, this counts wchar_t values in a string, even if the string\'s encoding is of variable width, like UTF-16.
--
--     Also be aware that wchar_t is different sizes on different platforms (4 bytes on Linux, 2 on Windows, etc).
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
  :: PtrConst.PtrConst HsBindgen.Runtime.LibC.CWchar
  -- ^
  --
  --           [@wstr@]: The null-terminated wide string to read. Must not be NULL.
  -> IO HsBindgen.Runtime.LibC.CSize
sDL_wcslen = hs_bindgen_e6c3253fb4b72427

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_wcsnlen@
foreign import ccall safe "hs_bindgen_da04478d43043c90"
  hs_bindgen_da04478d43043c90_base
    :: BG.Ptr BG.Void
    -> BG.Word64
    -> IO BG.Word64

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_wcsnlen@
hs_bindgen_da04478d43043c90
  :: PtrConst.PtrConst HsBindgen.Runtime.LibC.CWchar
  -> HsBindgen.Runtime.LibC.CSize
  -> IO HsBindgen.Runtime.LibC.CSize
hs_bindgen_da04478d43043c90 =
  BG.fromFFIType hs_bindgen_da04478d43043c90_base

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
  :: PtrConst.PtrConst HsBindgen.Runtime.LibC.CWchar
  -- ^
  --
  --           [@wstr@]: The null-terminated wide string to read. Must not be NULL.
  -> HsBindgen.Runtime.LibC.CSize
  -- ^
  --
  --           [@maxlen@]: The maximum amount of wide characters to count.
  -> IO HsBindgen.Runtime.LibC.CSize
sDL_wcsnlen = hs_bindgen_da04478d43043c90

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_wcslcpy@
foreign import ccall safe "hs_bindgen_82a9094f0d522cdf"
  hs_bindgen_82a9094f0d522cdf_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Word64
    -> IO BG.Word64

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_wcslcpy@
hs_bindgen_82a9094f0d522cdf
  :: BG.Ptr HsBindgen.Runtime.LibC.CWchar
  -> PtrConst.PtrConst HsBindgen.Runtime.LibC.CWchar
  -> HsBindgen.Runtime.LibC.CSize
  -> IO HsBindgen.Runtime.LibC.CSize
hs_bindgen_82a9094f0d522cdf =
  BG.fromFFIType hs_bindgen_82a9094f0d522cdf_base

-- | Copy a wide string.
--
--     This function copies @maxlen@ - 1 wide characters from @src@ to @dst@, then appends a null terminator.
--
--     @src@ and @dst@ must not overlap.
--
--     If @maxlen@ is 0, no wide characters are copied and no null terminator is written.
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
  :: BG.Ptr HsBindgen.Runtime.LibC.CWchar
  -- ^
  --
  --           [@dst@]: The destination buffer. Must not be NULL, and must not overlap with @src@.
  -> PtrConst.PtrConst HsBindgen.Runtime.LibC.CWchar
  -- ^
  --
  --           [@src@]: The null-terminated wide string to copy. Must not be NULL, and must not overlap with @dst@.
  -> HsBindgen.Runtime.LibC.CSize
  -- ^
  --
  --           [@maxlen@]: The length (in wide characters) of the destination buffer.
  -> IO HsBindgen.Runtime.LibC.CSize
sDL_wcslcpy = hs_bindgen_82a9094f0d522cdf

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_wcslcat@
foreign import ccall safe "hs_bindgen_c85ef13eabbd96dd"
  hs_bindgen_c85ef13eabbd96dd_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Word64
    -> IO BG.Word64

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_wcslcat@
hs_bindgen_c85ef13eabbd96dd
  :: BG.Ptr HsBindgen.Runtime.LibC.CWchar
  -> PtrConst.PtrConst HsBindgen.Runtime.LibC.CWchar
  -> HsBindgen.Runtime.LibC.CSize
  -> IO HsBindgen.Runtime.LibC.CSize
hs_bindgen_c85ef13eabbd96dd =
  BG.fromFFIType hs_bindgen_c85ef13eabbd96dd_base

-- | Concatenate wide strings.
--
--     This function appends up to @maxlen@ - SDL_wcslen(dst) - 1 wide characters from @src@ to the end of the wide string in @dst@, then appends a null terminator.
--
--     @src@ and @dst@ must not overlap.
--
--     If @maxlen@ - SDL_wcslen(dst) - 1 is less than or equal to 0, then @dst@ is unmodified.
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
  :: BG.Ptr HsBindgen.Runtime.LibC.CWchar
  -- ^
  --
  --           [@dst@]: The destination buffer already containing the first null-terminated wide string. Must not be NULL and must not overlap with @src@.
  -> PtrConst.PtrConst HsBindgen.Runtime.LibC.CWchar
  -- ^
  --
  --           [@src@]: The second null-terminated wide string. Must not be NULL, and must not overlap with @dst@.
  -> HsBindgen.Runtime.LibC.CSize
  -- ^
  --
  --           [@maxlen@]: The length (in wide characters) of the destination buffer.
  -> IO HsBindgen.Runtime.LibC.CSize
sDL_wcslcat = hs_bindgen_c85ef13eabbd96dd

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_wcsdup@
foreign import ccall safe "hs_bindgen_9a5bf9db9506735d"
  hs_bindgen_9a5bf9db9506735d_base
    :: BG.Ptr BG.Void
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_wcsdup@
hs_bindgen_9a5bf9db9506735d
  :: PtrConst.PtrConst HsBindgen.Runtime.LibC.CWchar
  -> IO (BG.Ptr HsBindgen.Runtime.LibC.CWchar)
hs_bindgen_9a5bf9db9506735d =
  BG.fromFFIType hs_bindgen_9a5bf9db9506735d_base

-- | Allocate a copy of a wide string.
--
--     This allocates enough space for a null-terminated copy of @wstr@, using SDL_malloc, and then makes a copy of the string into this space.
--
--     The returned string is owned by the caller, and should be passed to SDL_free when no longer needed.
--
--     [Returns]: a pointer to the newly-allocated wide string.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_wcsdup@, defined at @SDL3\/SDL_stdinc.h 2815:39@
sDL_wcsdup
  :: PtrConst.PtrConst HsBindgen.Runtime.LibC.CWchar
  -- ^
  --
  --           [@wstr@]: the string to copy.
  -> IO (BG.Ptr HsBindgen.Runtime.LibC.CWchar)
sDL_wcsdup = hs_bindgen_9a5bf9db9506735d

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_wcsstr@
foreign import ccall safe "hs_bindgen_8807485ad58a476c"
  hs_bindgen_8807485ad58a476c_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_wcsstr@
hs_bindgen_8807485ad58a476c
  :: PtrConst.PtrConst HsBindgen.Runtime.LibC.CWchar
  -> PtrConst.PtrConst HsBindgen.Runtime.LibC.CWchar
  -> IO (BG.Ptr HsBindgen.Runtime.LibC.CWchar)
hs_bindgen_8807485ad58a476c =
  BG.fromFFIType hs_bindgen_8807485ad58a476c_base

-- | Search a wide string for the first instance of a specific substring.
--
--     The search ends once it finds the requested substring, or a null terminator byte to end the string.
--
--     Note that this looks for strings of /wide characters/, not /codepoints/, so it\'s legal to search for malformed and incomplete UTF-16 sequences.
--
--     [Returns]: a pointer to the first instance of @needle@ in the string, or NULL if not found.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_wcsstr@, defined at @SDL3\/SDL_stdinc.h 2835:39@
sDL_wcsstr
  :: PtrConst.PtrConst HsBindgen.Runtime.LibC.CWchar
  -- ^
  --
  --           [@haystack@]: the wide string to search. Must not be NULL.
  -> PtrConst.PtrConst HsBindgen.Runtime.LibC.CWchar
  -- ^
  --
  --           [@needle@]: the wide string to search for. Must not be NULL.
  -> IO (BG.Ptr HsBindgen.Runtime.LibC.CWchar)
sDL_wcsstr = hs_bindgen_8807485ad58a476c

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_wcsnstr@
foreign import ccall safe "hs_bindgen_0f95369992d6076d"
  hs_bindgen_0f95369992d6076d_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Word64
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_wcsnstr@
hs_bindgen_0f95369992d6076d
  :: PtrConst.PtrConst HsBindgen.Runtime.LibC.CWchar
  -> PtrConst.PtrConst HsBindgen.Runtime.LibC.CWchar
  -> HsBindgen.Runtime.LibC.CSize
  -> IO (BG.Ptr HsBindgen.Runtime.LibC.CWchar)
hs_bindgen_0f95369992d6076d =
  BG.fromFFIType hs_bindgen_0f95369992d6076d_base

-- | Search a wide string, up to n wide chars, for the first instance of a specific substring.
--
--     The search ends once it finds the requested substring, or a null terminator value to end the string, or @maxlen@ wide character have been examined. It is possible to use this function on a wide string without a null terminator.
--
--     Note that this looks for strings of /wide characters/, not /codepoints/, so it\'s legal to search for malformed and incomplete UTF-16 sequences.
--
--     [Returns]: a pointer to the first instance of @needle@ in the string, or NULL if not found.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_wcsnstr@, defined at @SDL3\/SDL_stdinc.h 2860:39@
sDL_wcsnstr
  :: PtrConst.PtrConst HsBindgen.Runtime.LibC.CWchar
  -- ^
  --
  --           [@haystack@]: the wide string to search. Must not be NULL.
  -> PtrConst.PtrConst HsBindgen.Runtime.LibC.CWchar
  -- ^
  --
  --           [@needle@]: the wide string to search for. Must not be NULL.
  -> HsBindgen.Runtime.LibC.CSize
  -- ^
  --
  --           [@maxlen@]: the maximum number of wide characters to search in @haystack@.
  -> IO (BG.Ptr HsBindgen.Runtime.LibC.CWchar)
sDL_wcsnstr = hs_bindgen_0f95369992d6076d

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_wcscmp@
foreign import ccall safe "hs_bindgen_a56659eded1129eb"
  hs_bindgen_a56659eded1129eb_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO BG.Int32

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_wcscmp@
hs_bindgen_a56659eded1129eb
  :: PtrConst.PtrConst HsBindgen.Runtime.LibC.CWchar
  -> PtrConst.PtrConst HsBindgen.Runtime.LibC.CWchar
  -> IO BG.CInt
hs_bindgen_a56659eded1129eb =
  BG.fromFFIType hs_bindgen_a56659eded1129eb_base

-- | Compare two null-terminated wide strings.
--
--     This only compares wchar_t values until it hits a null-terminating character; it does not care if the string is well-formed UTF-16 (or UTF-32, depending on your platform\'s wchar_t size), or uses valid Unicode values.
--
--     [Returns]: less than zero if str1 is \"less than\" str2, greater than zero if str1 is \"greater than\" str2, and zero if the strings match exactly.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_wcscmp@, defined at @SDL3\/SDL_stdinc.h 2879:33@
sDL_wcscmp
  :: PtrConst.PtrConst HsBindgen.Runtime.LibC.CWchar
  -- ^
  --
  --           [@str1@]: the first string to compare. NULL is not permitted!
  -> PtrConst.PtrConst HsBindgen.Runtime.LibC.CWchar
  -- ^
  --
  --           [@str2@]: the second string to compare. NULL is not permitted!
  -> IO BG.CInt
sDL_wcscmp = hs_bindgen_a56659eded1129eb

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_wcsncmp@
foreign import ccall safe "hs_bindgen_f249ec61a8d5978a"
  hs_bindgen_f249ec61a8d5978a_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Word64
    -> IO BG.Int32

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_wcsncmp@
hs_bindgen_f249ec61a8d5978a
  :: PtrConst.PtrConst HsBindgen.Runtime.LibC.CWchar
  -> PtrConst.PtrConst HsBindgen.Runtime.LibC.CWchar
  -> HsBindgen.Runtime.LibC.CSize
  -> IO BG.CInt
hs_bindgen_f249ec61a8d5978a =
  BG.fromFFIType hs_bindgen_f249ec61a8d5978a_base

-- | Compare two wide strings up to a number of wchar_t values.
--
--     This only compares wchar_t values; it does not care if the string is well-formed UTF-16 (or UTF-32, depending on your platform\'s wchar_t size), or uses valid Unicode values.
--
--     Note that while this function is intended to be used with UTF-16 (or UTF-32, depending on your platform\'s definition of wchar_t), it is comparing raw wchar_t values and not Unicode codepoints: @maxlen@ specifies a wchar_t limit! If the limit lands in the middle of a multi-wchar UTF-16 sequence, it will only compare a portion of the final character.
--
--     @maxlen@ specifies a maximum number of wchar_t to compare; if the strings match to this number of wide chars (or both have matched to a null-terminator character before this count), they will be considered equal.
--
--     [Returns]: less than zero if str1 is \"less than\" str2, greater than zero if str1 is \"greater than\" str2, and zero if the strings match exactly.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_wcsncmp@, defined at @SDL3\/SDL_stdinc.h 2910:33@
sDL_wcsncmp
  :: PtrConst.PtrConst HsBindgen.Runtime.LibC.CWchar
  -- ^
  --
  --           [@str1@]: the first string to compare. NULL is not permitted!
  -> PtrConst.PtrConst HsBindgen.Runtime.LibC.CWchar
  -- ^
  --
  --           [@str2@]: the second string to compare. NULL is not permitted!
  -> HsBindgen.Runtime.LibC.CSize
  -- ^
  --
  --           [@maxlen@]: the maximum number of wchar_t to compare.
  -> IO BG.CInt
sDL_wcsncmp = hs_bindgen_f249ec61a8d5978a

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_wcscasecmp@
foreign import ccall safe "hs_bindgen_0e487d7f98097b0d"
  hs_bindgen_0e487d7f98097b0d_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO BG.Int32

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_wcscasecmp@
hs_bindgen_0e487d7f98097b0d
  :: PtrConst.PtrConst HsBindgen.Runtime.LibC.CWchar
  -> PtrConst.PtrConst HsBindgen.Runtime.LibC.CWchar
  -> IO BG.CInt
hs_bindgen_0e487d7f98097b0d =
  BG.fromFFIType hs_bindgen_0e487d7f98097b0d_base

-- | Compare two null-terminated wide strings, case-insensitively.
--
--     This will work with Unicode strings, using a technique called \"case-folding\" to handle the vast majority of case-sensitive human languages regardless of system locale. It can deal with expanding values: a German Eszett character can compare against two ASCII \'s\' chars and be considered a match, for example. A notable exception: it does not handle the Turkish \'i\' character; human language is complicated!
--
--     Depending on your platform, \"wchar_t\" might be 2 bytes, and expected to be UTF-16 encoded (like Windows), or 4 bytes in UTF-32 format. Since this handles Unicode, it expects the string to be well-formed and not a null-terminated string of arbitrary bytes. Characters that are not valid UTF-16 (or UTF-32) are treated as Unicode character U+FFFD (REPLACEMENT CHARACTER), which is to say two strings of random bits may turn out to match if they convert to the same amount of replacement characters.
--
--     [Returns]: less than zero if str1 is \"less than\" str2, greater than zero if str1 is \"greater than\" str2, and zero if the strings match exactly.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_wcscasecmp@, defined at @SDL3\/SDL_stdinc.h 2940:33@
sDL_wcscasecmp
  :: PtrConst.PtrConst HsBindgen.Runtime.LibC.CWchar
  -- ^
  --
  --           [@str1@]: the first string to compare. NULL is not permitted!
  -> PtrConst.PtrConst HsBindgen.Runtime.LibC.CWchar
  -- ^
  --
  --           [@str2@]: the second string to compare. NULL is not permitted!
  -> IO BG.CInt
sDL_wcscasecmp = hs_bindgen_0e487d7f98097b0d

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_wcsncasecmp@
foreign import ccall safe "hs_bindgen_9a4ad44438974867"
  hs_bindgen_9a4ad44438974867_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Word64
    -> IO BG.Int32

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_wcsncasecmp@
hs_bindgen_9a4ad44438974867
  :: PtrConst.PtrConst HsBindgen.Runtime.LibC.CWchar
  -> PtrConst.PtrConst HsBindgen.Runtime.LibC.CWchar
  -> HsBindgen.Runtime.LibC.CSize
  -> IO BG.CInt
hs_bindgen_9a4ad44438974867 =
  BG.fromFFIType hs_bindgen_9a4ad44438974867_base

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
--     [Returns]: less than zero if str1 is \"less than\" str2, greater than zero if str1 is \"greater than\" str2, and zero if the strings match exactly.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_wcsncasecmp@, defined at @SDL3\/SDL_stdinc.h 2982:33@
sDL_wcsncasecmp
  :: PtrConst.PtrConst HsBindgen.Runtime.LibC.CWchar
  -- ^
  --
  --           [@str1@]: the first string to compare. NULL is not permitted!
  -> PtrConst.PtrConst HsBindgen.Runtime.LibC.CWchar
  -- ^
  --
  --           [@str2@]: the second string to compare. NULL is not permitted!
  -> HsBindgen.Runtime.LibC.CSize
  -- ^
  --
  --           [@maxlen@]: the maximum number of wchar_t values to compare.
  -> IO BG.CInt
sDL_wcsncasecmp = hs_bindgen_9a4ad44438974867

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_strlen@
foreign import ccall safe "hs_bindgen_574becd3bb71e7b9"
  hs_bindgen_574becd3bb71e7b9_base
    :: BG.Ptr BG.Void
    -> IO BG.Word64

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_strlen@
hs_bindgen_574becd3bb71e7b9
  :: PtrConst.PtrConst BG.CChar
  -> IO HsBindgen.Runtime.LibC.CSize
hs_bindgen_574becd3bb71e7b9 =
  BG.fromFFIType hs_bindgen_574becd3bb71e7b9_base

-- | This works exactly like strlen() but doesn\'t require access to a C runtime.
--
--     Counts the bytes in @str@, excluding the null terminator.
--
--     If you need the length of a UTF-8 string, consider using @SDL_utf8strlen()@.
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
sDL_strlen
  :: PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@str@]: The null-terminated string to read. Must not be NULL.
  -> IO HsBindgen.Runtime.LibC.CSize
sDL_strlen = hs_bindgen_574becd3bb71e7b9

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_strnlen@
foreign import ccall safe "hs_bindgen_9232c1cbf65df9e5"
  hs_bindgen_9232c1cbf65df9e5_base
    :: BG.Ptr BG.Void
    -> BG.Word64
    -> IO BG.Word64

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_strnlen@
hs_bindgen_9232c1cbf65df9e5
  :: PtrConst.PtrConst BG.CChar
  -> HsBindgen.Runtime.LibC.CSize
  -> IO HsBindgen.Runtime.LibC.CSize
hs_bindgen_9232c1cbf65df9e5 =
  BG.fromFFIType hs_bindgen_9232c1cbf65df9e5_base

-- | This works exactly like strnlen() but doesn\'t require access to a C runtime.
--
--     Counts up to a maximum of @maxlen@ bytes in @str@, excluding the null terminator.
--
--     If you need the length of a UTF-8 string, consider using @SDL_utf8strnlen()@.
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
  :: PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@str@]: The null-terminated string to read. Must not be NULL.
  -> HsBindgen.Runtime.LibC.CSize
  -- ^
  --
  --           [@maxlen@]: The maximum amount of bytes to count.
  -> IO HsBindgen.Runtime.LibC.CSize
sDL_strnlen = hs_bindgen_9232c1cbf65df9e5

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_strlcpy@
foreign import ccall safe "hs_bindgen_1a460cf112b7fd68"
  hs_bindgen_1a460cf112b7fd68_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Word64
    -> IO BG.Word64

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_strlcpy@
hs_bindgen_1a460cf112b7fd68
  :: BG.Ptr BG.CChar
  -> PtrConst.PtrConst BG.CChar
  -> HsBindgen.Runtime.LibC.CSize
  -> IO HsBindgen.Runtime.LibC.CSize
hs_bindgen_1a460cf112b7fd68 =
  BG.fromFFIType hs_bindgen_1a460cf112b7fd68_base

-- | Copy a string.
--
--     This function copies up to @maxlen@ - 1 characters from @src@ to @dst@, then appends a null terminator.
--
--     If @maxlen@ is 0, no characters are copied and no null terminator is written.
--
--     If you want to copy an UTF-8 string but need to ensure that multi-byte sequences are not truncated, consider using @SDL_utf8strlcpy()@.
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
  :: BG.Ptr BG.CChar
  -- ^
  --
  --           [@dst@]: The destination buffer. Must not be NULL, and must not overlap with @src@.
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@src@]: The null-terminated string to copy. Must not be NULL, and must not overlap with @dst@.
  -> HsBindgen.Runtime.LibC.CSize
  -- ^
  --
  --           [@maxlen@]: The length (in characters) of the destination buffer.
  -> IO HsBindgen.Runtime.LibC.CSize
sDL_strlcpy = hs_bindgen_1a460cf112b7fd68

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_utf8strlcpy@
foreign import ccall safe "hs_bindgen_10b5c948dc68c882"
  hs_bindgen_10b5c948dc68c882_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Word64
    -> IO BG.Word64

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_utf8strlcpy@
hs_bindgen_10b5c948dc68c882
  :: BG.Ptr BG.CChar
  -> PtrConst.PtrConst BG.CChar
  -> HsBindgen.Runtime.LibC.CSize
  -> IO HsBindgen.Runtime.LibC.CSize
hs_bindgen_10b5c948dc68c882 =
  BG.fromFFIType hs_bindgen_10b5c948dc68c882_base

-- | Copy an UTF-8 string.
--
--     This function copies up to @dst_bytes@ - 1 bytes from @src@ to @dst@ while also ensuring that the string written to @dst@ does not end in a truncated multi-byte sequence. Finally, it appends a null terminator.
--
--     @src@ and @dst@ must not overlap.
--
--     Note that unlike @SDL_strlcpy()@, this function returns the number of bytes written, not the length of @src@.
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
  :: BG.Ptr BG.CChar
  -- ^
  --
  --           [@dst@]: The destination buffer. Must not be NULL, and must not overlap with @src@.
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@src@]: The null-terminated UTF-8 string to copy. Must not be NULL, and must not overlap with @dst@.
  -> HsBindgen.Runtime.LibC.CSize
  -- ^
  --
  --           [@dst_bytes@]: The length (in bytes) of the destination buffer. Must not be 0.
  -> IO HsBindgen.Runtime.LibC.CSize
sDL_utf8strlcpy = hs_bindgen_10b5c948dc68c882

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_strlcat@
foreign import ccall safe "hs_bindgen_8132fc050b3dda62"
  hs_bindgen_8132fc050b3dda62_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Word64
    -> IO BG.Word64

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_strlcat@
hs_bindgen_8132fc050b3dda62
  :: BG.Ptr BG.CChar
  -> PtrConst.PtrConst BG.CChar
  -> HsBindgen.Runtime.LibC.CSize
  -> IO HsBindgen.Runtime.LibC.CSize
hs_bindgen_8132fc050b3dda62 =
  BG.fromFFIType hs_bindgen_8132fc050b3dda62_base

-- | Concatenate strings.
--
--     This function appends up to @maxlen@ - SDL_strlen(dst) - 1 characters from @src@ to the end of the string in @dst@, then appends a null terminator.
--
--     @src@ and @dst@ must not overlap.
--
--     If @maxlen@ - SDL_strlen(dst) - 1 is less than or equal to 0, then @dst@ is unmodified.
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
  :: BG.Ptr BG.CChar
  -- ^
  --
  --           [@dst@]: The destination buffer already containing the first null-terminated string. Must not be NULL and must not overlap with @src@.
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@src@]: The second null-terminated string. Must not be NULL, and must not overlap with @dst@.
  -> HsBindgen.Runtime.LibC.CSize
  -- ^
  --
  --           [@maxlen@]: The length (in characters) of the destination buffer.
  -> IO HsBindgen.Runtime.LibC.CSize
sDL_strlcat = hs_bindgen_8132fc050b3dda62

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_strdup@
foreign import ccall safe "hs_bindgen_e91dd28c0e034753"
  hs_bindgen_e91dd28c0e034753_base
    :: BG.Ptr BG.Void
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_strdup@
hs_bindgen_e91dd28c0e034753
  :: PtrConst.PtrConst BG.CChar
  -> IO (BG.Ptr BG.CChar)
hs_bindgen_e91dd28c0e034753 =
  BG.fromFFIType hs_bindgen_e91dd28c0e034753_base

-- | Allocate a copy of a string.
--
--     This allocates enough space for a null-terminated copy of @str@, using SDL_malloc, and then makes a copy of the string into this space.
--
--     The returned string is owned by the caller, and should be passed to SDL_free when no longer needed.
--
--     [Returns]: a pointer to the newly-allocated string.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_strdup@, defined at @SDL3\/SDL_stdinc.h 3156:47@
sDL_strdup
  :: PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@str@]: the string to copy.
  -> IO (BG.Ptr BG.CChar)
sDL_strdup = hs_bindgen_e91dd28c0e034753

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_strndup@
foreign import ccall safe "hs_bindgen_9f484a433e6fd1be"
  hs_bindgen_9f484a433e6fd1be_base
    :: BG.Ptr BG.Void
    -> BG.Word64
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_strndup@
hs_bindgen_9f484a433e6fd1be
  :: PtrConst.PtrConst BG.CChar
  -> HsBindgen.Runtime.LibC.CSize
  -> IO (BG.Ptr BG.CChar)
hs_bindgen_9f484a433e6fd1be =
  BG.fromFFIType hs_bindgen_9f484a433e6fd1be_base

-- | Allocate a copy of a string, up to n characters.
--
--     This allocates enough space for a null-terminated copy of @str@, up to @maxlen@ bytes, using SDL_malloc, and then makes a copy of the string into this space.
--
--     If the string is longer than @maxlen@ bytes, the returned string will be @maxlen@ bytes long, plus a null-terminator character that isn\'t included in the count.
--
--     The returned string is owned by the caller, and should be passed to SDL_free when no longer needed.
--
--     [Returns]: a pointer to the newly-allocated string.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_strndup@, defined at @SDL3\/SDL_stdinc.h 3181:47@
sDL_strndup
  :: PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@str@]: the string to copy.
  -> HsBindgen.Runtime.LibC.CSize
  -- ^
  --
  --           [@maxlen@]: the maximum length of the copied string, not counting the null-terminator character.
  -> IO (BG.Ptr BG.CChar)
sDL_strndup = hs_bindgen_9f484a433e6fd1be

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_strrev@
foreign import ccall safe "hs_bindgen_fd83e6da8cdd54dc"
  hs_bindgen_fd83e6da8cdd54dc_base
    :: BG.Ptr BG.Void
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_strrev@
hs_bindgen_fd83e6da8cdd54dc
  :: BG.Ptr BG.CChar
  -> IO (BG.Ptr BG.CChar)
hs_bindgen_fd83e6da8cdd54dc =
  BG.fromFFIType hs_bindgen_fd83e6da8cdd54dc_base

-- | Reverse a string\'s contents.
--
--     This reverses a null-terminated string in-place. Only the content of the string is reversed; the null-terminator character remains at the end of the reversed string.
--
--     __WARNING__: This function reverses the /bytes/ of the string, not the codepoints. If @str@ is a UTF-8 string with Unicode codepoints > 127, this will ruin the string data. You should only use this function on strings that are completely comprised of low ASCII characters.
--
--     [Returns]: @str@.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_strrev@, defined at @SDL3\/SDL_stdinc.h 3202:36@
sDL_strrev
  :: BG.Ptr BG.CChar
  -- ^
  --
  --           [@str@]: the string to reverse.
  -> IO (BG.Ptr BG.CChar)
sDL_strrev = hs_bindgen_fd83e6da8cdd54dc

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_strupr@
foreign import ccall safe "hs_bindgen_4821ca9fe328d7f0"
  hs_bindgen_4821ca9fe328d7f0_base
    :: BG.Ptr BG.Void
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_strupr@
hs_bindgen_4821ca9fe328d7f0
  :: BG.Ptr BG.CChar
  -> IO (BG.Ptr BG.CChar)
hs_bindgen_4821ca9fe328d7f0 =
  BG.fromFFIType hs_bindgen_4821ca9fe328d7f0_base

-- | Convert a string to uppercase.
--
--     __WARNING__: Regardless of system locale, this will only convert ASCII values \'A\' through \'Z\' to uppercase.
--
--     This function operates on a null-terminated string of bytes even if it is malformed UTF-8! and converts ASCII characters \'a\' through \'z\' to their uppercase equivalents in-place, returning the original @str@ pointer.
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
sDL_strupr
  :: BG.Ptr BG.CChar
  -- ^
  --
  --           [@str@]: the string to convert in-place. Can not be NULL.
  -> IO (BG.Ptr BG.CChar)
sDL_strupr = hs_bindgen_4821ca9fe328d7f0

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_strlwr@
foreign import ccall safe "hs_bindgen_b313d67572ea455e"
  hs_bindgen_b313d67572ea455e_base
    :: BG.Ptr BG.Void
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_strlwr@
hs_bindgen_b313d67572ea455e
  :: BG.Ptr BG.CChar
  -> IO (BG.Ptr BG.CChar)
hs_bindgen_b313d67572ea455e =
  BG.fromFFIType hs_bindgen_b313d67572ea455e_base

-- | Convert a string to lowercase.
--
--     __WARNING__: Regardless of system locale, this will only convert ASCII values \'A\' through \'Z\' to lowercase.
--
--     This function operates on a null-terminated string of bytes even if it is malformed UTF-8! and converts ASCII characters \'A\' through \'Z\' to their lowercase equivalents in-place, returning the original @str@ pointer.
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
sDL_strlwr
  :: BG.Ptr BG.CChar
  -- ^
  --
  --           [@str@]: the string to convert in-place. Can not be NULL.
  -> IO (BG.Ptr BG.CChar)
sDL_strlwr = hs_bindgen_b313d67572ea455e

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_strchr@
foreign import ccall safe "hs_bindgen_9b8b80f67620d0c0"
  hs_bindgen_9b8b80f67620d0c0_base
    :: BG.Ptr BG.Void
    -> BG.Int32
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_strchr@
hs_bindgen_9b8b80f67620d0c0
  :: PtrConst.PtrConst BG.CChar
  -> BG.CInt
  -> IO (BG.Ptr BG.CChar)
hs_bindgen_9b8b80f67620d0c0 =
  BG.fromFFIType hs_bindgen_9b8b80f67620d0c0_base

-- | Search a string for the first instance of a specific byte.
--
--     The search ends once it finds the requested byte value, or a null terminator byte to end the string.
--
--     Note that this looks for /bytes/, not /characters/, so you cannot match against a Unicode codepoint > 255, regardless of character encoding.
--
--     [Returns]: a pointer to the first instance of @c@ in the string, or NULL if not found.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_strchr@, defined at @SDL3\/SDL_stdinc.h 3264:36@
sDL_strchr
  :: PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@str@]: the string to search. Must not be NULL.
  -> BG.CInt
  -- ^
  --
  --           [@c@]: the byte value to search for.
  -> IO (BG.Ptr BG.CChar)
sDL_strchr = hs_bindgen_9b8b80f67620d0c0

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_strrchr@
foreign import ccall safe "hs_bindgen_61eb1646e2706ec9"
  hs_bindgen_61eb1646e2706ec9_base
    :: BG.Ptr BG.Void
    -> BG.Int32
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_strrchr@
hs_bindgen_61eb1646e2706ec9
  :: PtrConst.PtrConst BG.CChar
  -> BG.CInt
  -> IO (BG.Ptr BG.CChar)
hs_bindgen_61eb1646e2706ec9 =
  BG.fromFFIType hs_bindgen_61eb1646e2706ec9_base

-- | Search a string for the last instance of a specific byte.
--
--     The search must go until it finds a null terminator byte to end the string.
--
--     Note that this looks for /bytes/, not /characters/, so you cannot match against a Unicode codepoint > 255, regardless of character encoding.
--
--     [Returns]: a pointer to the last instance of @c@ in the string, or NULL if not found.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_strrchr@, defined at @SDL3\/SDL_stdinc.h 3283:36@
sDL_strrchr
  :: PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@str@]: the string to search. Must not be NULL.
  -> BG.CInt
  -- ^
  --
  --           [@c@]: the byte value to search for.
  -> IO (BG.Ptr BG.CChar)
sDL_strrchr = hs_bindgen_61eb1646e2706ec9

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_strstr@
foreign import ccall safe "hs_bindgen_09dae8bc6d27bfa7"
  hs_bindgen_09dae8bc6d27bfa7_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_strstr@
hs_bindgen_09dae8bc6d27bfa7
  :: PtrConst.PtrConst BG.CChar
  -> PtrConst.PtrConst BG.CChar
  -> IO (BG.Ptr BG.CChar)
hs_bindgen_09dae8bc6d27bfa7 =
  BG.fromFFIType hs_bindgen_09dae8bc6d27bfa7_base

-- | Search a string for the first instance of a specific substring.
--
--     The search ends once it finds the requested substring, or a null terminator byte to end the string.
--
--     Note that this looks for strings of /bytes/, not /characters/, so it\'s legal to search for malformed and incomplete UTF-8 sequences.
--
--     [Returns]: a pointer to the first instance of @needle@ in the string, or NULL if not found.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_strstr@, defined at @SDL3\/SDL_stdinc.h 3303:36@
sDL_strstr
  :: PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@haystack@]: the string to search. Must not be NULL.
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@needle@]: the string to search for. Must not be NULL.
  -> IO (BG.Ptr BG.CChar)
sDL_strstr = hs_bindgen_09dae8bc6d27bfa7

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_strnstr@
foreign import ccall safe "hs_bindgen_b253d6195ad29db6"
  hs_bindgen_b253d6195ad29db6_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Word64
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_strnstr@
hs_bindgen_b253d6195ad29db6
  :: PtrConst.PtrConst BG.CChar
  -> PtrConst.PtrConst BG.CChar
  -> HsBindgen.Runtime.LibC.CSize
  -> IO (BG.Ptr BG.CChar)
hs_bindgen_b253d6195ad29db6 =
  BG.fromFFIType hs_bindgen_b253d6195ad29db6_base

-- | Search a string, up to n bytes, for the first instance of a specific substring.
--
--     The search ends once it finds the requested substring, or a null terminator byte to end the string, or @maxlen@ bytes have been examined. It is possible to use this function on a string without a null terminator.
--
--     Note that this looks for strings of /bytes/, not /characters/, so it\'s legal to search for malformed and incomplete UTF-8 sequences.
--
--     [Returns]: a pointer to the first instance of @needle@ in the string, or NULL if not found.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_strnstr@, defined at @SDL3\/SDL_stdinc.h 3326:36@
sDL_strnstr
  :: PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@haystack@]: the string to search. Must not be NULL.
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@needle@]: the string to search for. Must not be NULL.
  -> HsBindgen.Runtime.LibC.CSize
  -- ^
  --
  --           [@maxlen@]: the maximum number of bytes to search in @haystack@.
  -> IO (BG.Ptr BG.CChar)
sDL_strnstr = hs_bindgen_b253d6195ad29db6

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_strcasestr@
foreign import ccall safe "hs_bindgen_845c9ada7f0145b4"
  hs_bindgen_845c9ada7f0145b4_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_strcasestr@
hs_bindgen_845c9ada7f0145b4
  :: PtrConst.PtrConst BG.CChar
  -> PtrConst.PtrConst BG.CChar
  -> IO (BG.Ptr BG.CChar)
hs_bindgen_845c9ada7f0145b4 =
  BG.fromFFIType hs_bindgen_845c9ada7f0145b4_base

-- | Search a UTF-8 string for the first instance of a specific substring, case-insensitively.
--
--     This will work with Unicode strings, using a technique called \"case-folding\" to handle the vast majority of case-sensitive human languages regardless of system locale. It can deal with expanding values: a German Eszett character can compare against two ASCII \'s\' chars and be considered a match, for example. A notable exception: it does not handle the Turkish \'i\' character; human language is complicated!
--
--     Since this handles Unicode, it expects the strings to be well-formed UTF-8 and not a null-terminated string of arbitrary bytes. Bytes that are not valid UTF-8 are treated as Unicode character U+FFFD (REPLACEMENT CHARACTER), which is to say two strings of random bits may turn out to match if they convert to the same amount of replacement characters.
--
--     [Returns]: a pointer to the first instance of @needle@ in the string, or NULL if not found.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_strcasestr@, defined at @SDL3\/SDL_stdinc.h 3354:36@
sDL_strcasestr
  :: PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@haystack@]: the string to search. Must not be NULL.
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@needle@]: the string to search for. Must not be NULL.
  -> IO (BG.Ptr BG.CChar)
sDL_strcasestr = hs_bindgen_845c9ada7f0145b4

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_strtok_r@
foreign import ccall safe "hs_bindgen_92aad5310bed80bf"
  hs_bindgen_92aad5310bed80bf_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_strtok_r@
hs_bindgen_92aad5310bed80bf
  :: BG.Ptr BG.CChar
  -> PtrConst.PtrConst BG.CChar
  -> BG.Ptr (BG.Ptr BG.CChar)
  -> IO (BG.Ptr BG.CChar)
hs_bindgen_92aad5310bed80bf =
  BG.fromFFIType hs_bindgen_92aad5310bed80bf_base

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
--     [Returns]: A pointer to the next token, or NULL if no tokens remain.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_strtok_r@, defined at @SDL3\/SDL_stdinc.h 3383:36@
sDL_strtok_r
  :: BG.Ptr BG.CChar
  -- ^
  --
  --           [@str@]: the string to tokenize, or NULL to continue tokenizing.
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@delim@]: the delimiter string that separates tokens.
  -> BG.Ptr (BG.Ptr BG.CChar)
  -- ^
  --
  --           [@saveptr@]: pointer to a char *, used for ongoing state.
  -> IO (BG.Ptr BG.CChar)
sDL_strtok_r = hs_bindgen_92aad5310bed80bf

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_utf8strlen@
foreign import ccall safe "hs_bindgen_2fe9c3d14ead61fa"
  hs_bindgen_2fe9c3d14ead61fa_base
    :: BG.Ptr BG.Void
    -> IO BG.Word64

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_utf8strlen@
hs_bindgen_2fe9c3d14ead61fa
  :: PtrConst.PtrConst BG.CChar
  -> IO HsBindgen.Runtime.LibC.CSize
hs_bindgen_2fe9c3d14ead61fa =
  BG.fromFFIType hs_bindgen_2fe9c3d14ead61fa_base

-- | Count the number of codepoints in a UTF-8 string.
--
--     Counts the /codepoints/, not /bytes/, in @str@, excluding the null terminator.
--
--     If you need to count the bytes in a string instead, consider using @SDL_strlen()@.
--
--     Since this handles Unicode, it expects the strings to be well-formed UTF-8 and not a null-terminated string of arbitrary bytes. Bytes that are not valid UTF-8 are treated as Unicode character U+FFFD (REPLACEMENT CHARACTER), so a malformed or incomplete UTF-8 sequence might increase the count by several replacement characters.
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
sDL_utf8strlen
  :: PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@str@]: The null-terminated UTF-8 string to read. Must not be NULL.
  -> IO HsBindgen.Runtime.LibC.CSize
sDL_utf8strlen = hs_bindgen_2fe9c3d14ead61fa

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_utf8strnlen@
foreign import ccall safe "hs_bindgen_7e1dc736bb92cf02"
  hs_bindgen_7e1dc736bb92cf02_base
    :: BG.Ptr BG.Void
    -> BG.Word64
    -> IO BG.Word64

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_utf8strnlen@
hs_bindgen_7e1dc736bb92cf02
  :: PtrConst.PtrConst BG.CChar
  -> HsBindgen.Runtime.LibC.CSize
  -> IO HsBindgen.Runtime.LibC.CSize
hs_bindgen_7e1dc736bb92cf02 =
  BG.fromFFIType hs_bindgen_7e1dc736bb92cf02_base

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
  :: PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@str@]: The null-terminated UTF-8 string to read. Must not be NULL.
  -> HsBindgen.Runtime.LibC.CSize
  -- ^
  --
  --           [@bytes@]: The maximum amount of bytes to count.
  -> IO HsBindgen.Runtime.LibC.CSize
sDL_utf8strnlen = hs_bindgen_7e1dc736bb92cf02

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_itoa@
foreign import ccall safe "hs_bindgen_5e87f4eb430750ff"
  hs_bindgen_5e87f4eb430750ff_base
    :: BG.Int32
    -> BG.Ptr BG.Void
    -> BG.Int32
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_itoa@
hs_bindgen_5e87f4eb430750ff
  :: BG.CInt
  -> BG.Ptr BG.CChar
  -> BG.CInt
  -> IO (BG.Ptr BG.CChar)
hs_bindgen_5e87f4eb430750ff =
  BG.fromFFIType hs_bindgen_5e87f4eb430750ff_base

-- | Convert an integer into a string.
--
--     This requires a radix to specified for string format. Specifying 10 produces a decimal number, 16 hexadecimal, etc. Must be in the range of 2 to 36.
--
--     Note that this function will overflow a buffer if @str@ is not large enough to hold the output! It may be safer to use SDL_snprintf to clamp output, or SDL_asprintf to allocate a buffer. Otherwise, it doesn\'t hurt to allocate much more space than you expect to use (and don\'t forget possible negative signs, null terminator bytes, etc).
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
sDL_itoa
  :: BG.CInt
  -- ^
  --
  --           [@value@]: the integer to convert.
  -> BG.Ptr BG.CChar
  -- ^
  --
  --           [@str@]: the buffer to write the string into.
  -> BG.CInt
  -- ^
  --
  --           [@radix@]: the radix to use for string generation.
  -> IO (BG.Ptr BG.CChar)
sDL_itoa = hs_bindgen_5e87f4eb430750ff

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_uitoa@
foreign import ccall safe "hs_bindgen_6593301ad3b87e96"
  hs_bindgen_6593301ad3b87e96_base
    :: BG.Word32
    -> BG.Ptr BG.Void
    -> BG.Int32
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_uitoa@
hs_bindgen_6593301ad3b87e96
  :: BG.CUInt
  -> BG.Ptr BG.CChar
  -> BG.CInt
  -> IO (BG.Ptr BG.CChar)
hs_bindgen_6593301ad3b87e96 =
  BG.fromFFIType hs_bindgen_6593301ad3b87e96_base

-- | Convert an unsigned integer into a string.
--
--     This requires a radix to specified for string format. Specifying 10 produces a decimal number, 16 hexadecimal, etc. Must be in the range of 2 to 36.
--
--     Note that this function will overflow a buffer if @str@ is not large enough to hold the output! It may be safer to use SDL_snprintf to clamp output, or SDL_asprintf to allocate a buffer. Otherwise, it doesn\'t hurt to allocate much more space than you expect to use (and don\'t forget null terminator bytes, etc).
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
sDL_uitoa
  :: BG.CUInt
  -- ^
  --
  --           [@value@]: the unsigned integer to convert.
  -> BG.Ptr BG.CChar
  -- ^
  --
  --           [@str@]: the buffer to write the string into.
  -> BG.CInt
  -- ^
  --
  --           [@radix@]: the radix to use for string generation.
  -> IO (BG.Ptr BG.CChar)
sDL_uitoa = hs_bindgen_6593301ad3b87e96

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_lltoa@
foreign import ccall safe "hs_bindgen_49dab071ddd94418"
  hs_bindgen_49dab071ddd94418_base
    :: BG.Int64
    -> BG.Ptr BG.Void
    -> BG.Int32
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_lltoa@
hs_bindgen_49dab071ddd94418
  :: BG.CLLong
  -> BG.Ptr BG.CChar
  -> BG.CInt
  -> IO (BG.Ptr BG.CChar)
hs_bindgen_49dab071ddd94418 =
  BG.fromFFIType hs_bindgen_49dab071ddd94418_base

-- | Convert a long long integer into a string.
--
--     This requires a radix to specified for string format. Specifying 10 produces a decimal number, 16 hexadecimal, etc. Must be in the range of 2 to 36.
--
--     Note that this function will overflow a buffer if @str@ is not large enough to hold the output! It may be safer to use SDL_snprintf to clamp output, or SDL_asprintf to allocate a buffer. Otherwise, it doesn\'t hurt to allocate much more space than you expect to use (and don\'t forget possible negative signs, null terminator bytes, etc).
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
sDL_lltoa
  :: BG.CLLong
  -- ^
  --
  --           [@value@]: the long long integer to convert.
  -> BG.Ptr BG.CChar
  -- ^
  --
  --           [@str@]: the buffer to write the string into.
  -> BG.CInt
  -- ^
  --
  --           [@radix@]: the radix to use for string generation.
  -> IO (BG.Ptr BG.CChar)
sDL_lltoa = hs_bindgen_49dab071ddd94418

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_ulltoa@
foreign import ccall safe "hs_bindgen_8c172a64279b6c99"
  hs_bindgen_8c172a64279b6c99_base
    :: BG.Word64
    -> BG.Ptr BG.Void
    -> BG.Int32
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_ulltoa@
hs_bindgen_8c172a64279b6c99
  :: BG.CULLong
  -> BG.Ptr BG.CChar
  -> BG.CInt
  -> IO (BG.Ptr BG.CChar)
hs_bindgen_8c172a64279b6c99 =
  BG.fromFFIType hs_bindgen_8c172a64279b6c99_base

-- | Convert an unsigned long long integer into a string.
--
--     This requires a radix to specified for string format. Specifying 10 produces a decimal number, 16 hexadecimal, etc. Must be in the range of 2 to 36.
--
--     Note that this function will overflow a buffer if @str@ is not large enough to hold the output! It may be safer to use SDL_snprintf to clamp output, or SDL_asprintf to allocate a buffer. Otherwise, it doesn\'t hurt to allocate much more space than you expect to use (and don\'t forget null terminator bytes, etc).
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
sDL_ulltoa
  :: BG.CULLong
  -- ^
  --
  --           [@value@]: the unsigned long long integer to convert.
  -> BG.Ptr BG.CChar
  -- ^
  --
  --           [@str@]: the buffer to write the string into.
  -> BG.CInt
  -- ^
  --
  --           [@radix@]: the radix to use for string generation.
  -> IO (BG.Ptr BG.CChar)
sDL_ulltoa = hs_bindgen_8c172a64279b6c99

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_atoi@
foreign import ccall safe "hs_bindgen_7ec5dbb16b1ec441"
  hs_bindgen_7ec5dbb16b1ec441_base
    :: BG.Ptr BG.Void
    -> IO BG.Int32

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_atoi@
hs_bindgen_7ec5dbb16b1ec441
  :: PtrConst.PtrConst BG.CChar
  -> IO BG.CInt
hs_bindgen_7ec5dbb16b1ec441 =
  BG.fromFFIType hs_bindgen_7ec5dbb16b1ec441_base

-- | Parse an @int@ from a string.
--
--     The result of calling @SDL_atoi(str)@ is equivalent to @(int)SDL_strtol(str, NULL, 10)@.
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
sDL_atoi
  :: PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@str@]: The null-terminated string to read. Must not be NULL.
  -> IO BG.CInt
sDL_atoi = hs_bindgen_7ec5dbb16b1ec441

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_atof@
foreign import ccall safe "hs_bindgen_3da67c3a67185baf"
  hs_bindgen_3da67c3a67185baf_base
    :: BG.Ptr BG.Void
    -> IO Double

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_atof@
hs_bindgen_3da67c3a67185baf
  :: PtrConst.PtrConst BG.CChar
  -> IO BG.CDouble
hs_bindgen_3da67c3a67185baf =
  BG.fromFFIType hs_bindgen_3da67c3a67185baf_base

-- | Parse a @double@ from a string.
--
--     The result of calling @SDL_atof(str)@ is equivalent to @SDL_strtod(str, NULL)@.
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
sDL_atof
  :: PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@str@]: The null-terminated string to read. Must not be NULL.
  -> IO BG.CDouble
sDL_atof = hs_bindgen_3da67c3a67185baf

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_strtoll@
foreign import ccall safe "hs_bindgen_2d4f949f38ae668c"
  hs_bindgen_2d4f949f38ae668c_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Int32
    -> IO BG.Int64

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_strtoll@
hs_bindgen_2d4f949f38ae668c
  :: PtrConst.PtrConst BG.CChar
  -> BG.Ptr (BG.Ptr BG.CChar)
  -> BG.CInt
  -> IO BG.CLLong
hs_bindgen_2d4f949f38ae668c =
  BG.fromFFIType hs_bindgen_2d4f949f38ae668c_base

-- | Parse a @long long@ from a string.
--
--     If @str@ starts with whitespace, then those whitespace characters are skipped before attempting to parse the number.
--
--     If the parsed number does not fit inside a @long long@, the result is clamped to the minimum and maximum representable @long long@ values.
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
  :: PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@str@]: The null-terminated string to read. Must not be NULL.
  -> BG.Ptr (BG.Ptr BG.CChar)
  -- ^
  --
  --           [@endp@]: If not NULL, the address of the first invalid character (i.e. the next character after the parsed number) will be written to this pointer.
  -> BG.CInt
  -- ^
  --
  --           [@base@]: The base of the integer to read. Supported values are 0 and 2 to 36 inclusive. If 0, the base will be inferred from the number\'s prefix (0x for hexadecimal, 0 for octal, decimal otherwise).
  -> IO BG.CLLong
sDL_strtoll = hs_bindgen_2d4f949f38ae668c

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_strtoull@
foreign import ccall safe "hs_bindgen_af470a839fcf6fbd"
  hs_bindgen_af470a839fcf6fbd_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Int32
    -> IO BG.Word64

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_strtoull@
hs_bindgen_af470a839fcf6fbd
  :: PtrConst.PtrConst BG.CChar
  -> BG.Ptr (BG.Ptr BG.CChar)
  -> BG.CInt
  -> IO BG.CULLong
hs_bindgen_af470a839fcf6fbd =
  BG.fromFFIType hs_bindgen_af470a839fcf6fbd_base

-- | Parse an @unsigned long long@ from a string.
--
--     If @str@ starts with whitespace, then those whitespace characters are skipped before attempting to parse the number.
--
--     If the parsed number does not fit inside an @unsigned long long@, the result is clamped to the maximum representable @unsigned long long@ value.
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
  :: PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@str@]: The null-terminated string to read. Must not be NULL.
  -> BG.Ptr (BG.Ptr BG.CChar)
  -- ^
  --
  --           [@endp@]: If not NULL, the address of the first invalid character (i.e. the next character after the parsed number) will be written to this pointer.
  -> BG.CInt
  -- ^
  --
  --           [@base@]: The base of the integer to read. Supported values are 0 and 2 to 36 inclusive. If 0, the base will be inferred from the number\'s prefix (0x for hexadecimal, 0 for octal, decimal otherwise).
  -> IO BG.CULLong
sDL_strtoull = hs_bindgen_af470a839fcf6fbd

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_strtod@
foreign import ccall safe "hs_bindgen_717e481bd213c968"
  hs_bindgen_717e481bd213c968_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO Double

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_strtod@
hs_bindgen_717e481bd213c968
  :: PtrConst.PtrConst BG.CChar
  -> BG.Ptr (BG.Ptr BG.CChar)
  -> IO BG.CDouble
hs_bindgen_717e481bd213c968 =
  BG.fromFFIType hs_bindgen_717e481bd213c968_base

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
--     [Returns]: the parsed @double@, or 0 if no number could be parsed.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_atoi', 'sDL_atof', @SDL_strtol@, 'sDL_strtoll', @SDL_strtoul@, 'sDL_strtoull'
--
--     [C declaration]: @SDL_strtod@, defined at @SDL3\/SDL_stdinc.h 3826:36@
sDL_strtod
  :: PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@str@]: the null-terminated string to read. Must not be NULL.
  -> BG.Ptr (BG.Ptr BG.CChar)
  -- ^
  --
  --           [@endp@]: if not NULL, the address of the first invalid character (i.e. the next character after the parsed number) will be written to this pointer.
  -> IO BG.CDouble
sDL_strtod = hs_bindgen_717e481bd213c968

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_strcmp@
foreign import ccall safe "hs_bindgen_114ae5114f0f2f61"
  hs_bindgen_114ae5114f0f2f61_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO BG.Int32

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_strcmp@
hs_bindgen_114ae5114f0f2f61
  :: PtrConst.PtrConst BG.CChar
  -> PtrConst.PtrConst BG.CChar
  -> IO BG.CInt
hs_bindgen_114ae5114f0f2f61 =
  BG.fromFFIType hs_bindgen_114ae5114f0f2f61_base

-- | Compare two null-terminated UTF-8 strings.
--
--     Due to the nature of UTF-8 encoding, this will work with Unicode strings, since effectively this function just compares bytes until it hits a null-terminating character. Also due to the nature of UTF-8, this can be used with @SDL_qsort()@ to put strings in (roughly) alphabetical order.
--
--     [Returns]: less than zero if str1 is \"less than\" str2, greater than zero if str1 is \"greater than\" str2, and zero if the strings match exactly.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_strcmp@, defined at @SDL3\/SDL_stdinc.h 3846:33@
sDL_strcmp
  :: PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@str1@]: the first string to compare. NULL is not permitted!
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@str2@]: the second string to compare. NULL is not permitted!
  -> IO BG.CInt
sDL_strcmp = hs_bindgen_114ae5114f0f2f61

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_strncmp@
foreign import ccall safe "hs_bindgen_07f412ca6ac64bca"
  hs_bindgen_07f412ca6ac64bca_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Word64
    -> IO BG.Int32

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_strncmp@
hs_bindgen_07f412ca6ac64bca
  :: PtrConst.PtrConst BG.CChar
  -> PtrConst.PtrConst BG.CChar
  -> HsBindgen.Runtime.LibC.CSize
  -> IO BG.CInt
hs_bindgen_07f412ca6ac64bca =
  BG.fromFFIType hs_bindgen_07f412ca6ac64bca_base

-- | Compare two UTF-8 strings up to a number of bytes.
--
--     Due to the nature of UTF-8 encoding, this will work with Unicode strings, since effectively this function just compares bytes until it hits a null-terminating character. Also due to the nature of UTF-8, this can be used with @SDL_qsort()@ to put strings in (roughly) alphabetical order.
--
--     Note that while this function is intended to be used with UTF-8, it is doing a bytewise comparison, and @maxlen@ specifies a /byte/ limit! If the limit lands in the middle of a multi-byte UTF-8 sequence, it will only compare a portion of the final character.
--
--     @maxlen@ specifies a maximum number of bytes to compare; if the strings match to this number of bytes (or both have matched to a null-terminator character before this number of bytes), they will be considered equal.
--
--     [Returns]: less than zero if str1 is \"less than\" str2, greater than zero if str1 is \"greater than\" str2, and zero if the strings match exactly.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_strncmp@, defined at @SDL3\/SDL_stdinc.h 3876:33@
sDL_strncmp
  :: PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@str1@]: the first string to compare. NULL is not permitted!
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@str2@]: the second string to compare. NULL is not permitted!
  -> HsBindgen.Runtime.LibC.CSize
  -- ^
  --
  --           [@maxlen@]: the maximum number of /bytes/ to compare.
  -> IO BG.CInt
sDL_strncmp = hs_bindgen_07f412ca6ac64bca

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_strcasecmp@
foreign import ccall safe "hs_bindgen_931c05e65f298770"
  hs_bindgen_931c05e65f298770_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO BG.Int32

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_strcasecmp@
hs_bindgen_931c05e65f298770
  :: PtrConst.PtrConst BG.CChar
  -> PtrConst.PtrConst BG.CChar
  -> IO BG.CInt
hs_bindgen_931c05e65f298770 =
  BG.fromFFIType hs_bindgen_931c05e65f298770_base

-- | Compare two null-terminated UTF-8 strings, case-insensitively.
--
--     This will work with Unicode strings, using a technique called \"case-folding\" to handle the vast majority of case-sensitive human languages regardless of system locale. It can deal with expanding values: a German Eszett character can compare against two ASCII \'s\' chars and be considered a match, for example. A notable exception: it does not handle the Turkish \'i\' character; human language is complicated!
--
--     Since this handles Unicode, it expects the string to be well-formed UTF-8 and not a null-terminated string of arbitrary bytes. Bytes that are not valid UTF-8 are treated as Unicode character U+FFFD (REPLACEMENT CHARACTER), which is to say two strings of random bits may turn out to match if they convert to the same amount of replacement characters.
--
--     [Returns]: less than zero if str1 is \"less than\" str2, greater than zero if str1 is \"greater than\" str2, and zero if the strings match exactly.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_strcasecmp@, defined at @SDL3\/SDL_stdinc.h 3904:33@
sDL_strcasecmp
  :: PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@str1@]: the first string to compare. NULL is not permitted!
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@str2@]: the second string to compare. NULL is not permitted!
  -> IO BG.CInt
sDL_strcasecmp = hs_bindgen_931c05e65f298770

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_strncasecmp@
foreign import ccall safe "hs_bindgen_974c20bb6f7b7d03"
  hs_bindgen_974c20bb6f7b7d03_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Word64
    -> IO BG.Int32

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_strncasecmp@
hs_bindgen_974c20bb6f7b7d03
  :: PtrConst.PtrConst BG.CChar
  -> PtrConst.PtrConst BG.CChar
  -> HsBindgen.Runtime.LibC.CSize
  -> IO BG.CInt
hs_bindgen_974c20bb6f7b7d03 =
  BG.fromFFIType hs_bindgen_974c20bb6f7b7d03_base

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
--     [Returns]: less than zero if str1 is \"less than\" str2, greater than zero if str1 is \"greater than\" str2, and zero if the strings match exactly.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_strncasecmp@, defined at @SDL3\/SDL_stdinc.h 3944:33@
sDL_strncasecmp
  :: PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@str1@]: the first string to compare. NULL is not permitted!
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@str2@]: the second string to compare. NULL is not permitted!
  -> HsBindgen.Runtime.LibC.CSize
  -- ^
  --
  --           [@maxlen@]: the maximum number of bytes to compare.
  -> IO BG.CInt
sDL_strncasecmp = hs_bindgen_974c20bb6f7b7d03

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_strpbrk@
foreign import ccall safe "hs_bindgen_50473abaffb3417e"
  hs_bindgen_50473abaffb3417e_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_strpbrk@
hs_bindgen_50473abaffb3417e
  :: PtrConst.PtrConst BG.CChar
  -> PtrConst.PtrConst BG.CChar
  -> IO (BG.Ptr BG.CChar)
hs_bindgen_50473abaffb3417e =
  BG.fromFFIType hs_bindgen_50473abaffb3417e_base

-- | Searches a string for the first occurrence of any character contained in a breakset, and returns a pointer from the string to that character.
--
--     [Returns]: A pointer to the location, in str, of the first occurrence of a character present in the breakset, or NULL if none is found.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_strpbrk@, defined at @SDL3\/SDL_stdinc.h 3962:36@
sDL_strpbrk
  :: PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@str@]: The null-terminated string to be searched. Must not be NULL, and must not overlap with @breakset@.
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@breakset@]: A null-terminated string containing the list of characters to look for. Must not be NULL, and must not overlap with @str@.
  -> IO (BG.Ptr BG.CChar)
sDL_strpbrk = hs_bindgen_50473abaffb3417e

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_StepUTF8@
foreign import ccall safe "hs_bindgen_e49242de1cec91d5"
  hs_bindgen_e49242de1cec91d5_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO BG.Word32

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_StepUTF8@
hs_bindgen_e49242de1cec91d5
  :: BG.Ptr (PtrConst.PtrConst BG.CChar)
  -> BG.Ptr HsBindgen.Runtime.LibC.CSize
  -> IO Uint32
hs_bindgen_e49242de1cec91d5 =
  BG.fromFFIType hs_bindgen_e49242de1cec91d5_base

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
--     [Returns]: the first Unicode codepoint in the string.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_StepUTF8@, defined at @SDL3\/SDL_stdinc.h 4022:36@
sDL_StepUTF8
  :: BG.Ptr (PtrConst.PtrConst BG.CChar)
  -- ^
  --
  --           [@pstr@]: a pointer to a UTF-8 string pointer to be read and adjusted.
  -> BG.Ptr HsBindgen.Runtime.LibC.CSize
  -- ^
  --
  --           [@pslen@]: a pointer to the number of bytes in the string, to be read and adjusted. NULL is allowed.
  -> IO Uint32
sDL_StepUTF8 = hs_bindgen_e49242de1cec91d5

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_StepBackUTF8@
foreign import ccall safe "hs_bindgen_0346c467944ee189"
  hs_bindgen_0346c467944ee189_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO BG.Word32

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_StepBackUTF8@
hs_bindgen_0346c467944ee189
  :: PtrConst.PtrConst BG.CChar
  -> BG.Ptr (PtrConst.PtrConst BG.CChar)
  -> IO Uint32
hs_bindgen_0346c467944ee189 =
  BG.fromFFIType hs_bindgen_0346c467944ee189_base

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
--     [Returns]: the previous Unicode codepoint in the string.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_StepBackUTF8@, defined at @SDL3\/SDL_stdinc.h 4053:36@
sDL_StepBackUTF8
  :: PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@start@]: a pointer to the beginning of the UTF-8 string.
  -> BG.Ptr (PtrConst.PtrConst BG.CChar)
  -- ^
  --
  --           [@pstr@]: a pointer to a UTF-8 string pointer to be read and adjusted.
  -> IO Uint32
sDL_StepBackUTF8 = hs_bindgen_0346c467944ee189

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_UCS4ToUTF8@
foreign import ccall safe "hs_bindgen_bdc98e385efc6ab7"
  hs_bindgen_bdc98e385efc6ab7_base
    :: BG.Word32
    -> BG.Ptr BG.Void
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_UCS4ToUTF8@
hs_bindgen_bdc98e385efc6ab7
  :: Uint32
  -> BG.Ptr BG.CChar
  -> IO (BG.Ptr BG.CChar)
hs_bindgen_bdc98e385efc6ab7 =
  BG.fromFFIType hs_bindgen_bdc98e385efc6ab7_base

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
--     [Returns]: the first byte past the newly-written UTF-8 sequence.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_UCS4ToUTF8@, defined at @SDL3\/SDL_stdinc.h 4082:36@
sDL_UCS4ToUTF8
  :: Uint32
  -- ^
  --
  --           [@codepoint@]: a Unicode codepoint to convert to UTF-8.
  -> BG.Ptr BG.CChar
  -- ^
  --
  --           [@dst@]: the location to write the encoded UTF-8. Must point to at least 4 bytes!
  -> IO (BG.Ptr BG.CChar)
sDL_UCS4ToUTF8 = hs_bindgen_bdc98e385efc6ab7

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_srand@
foreign import ccall safe "hs_bindgen_bd195a3a2b34e483"
  hs_bindgen_bd195a3a2b34e483_base
    :: BG.Word64
    -> IO ()

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_srand@
hs_bindgen_bd195a3a2b34e483
  :: Uint64
  -> IO ()
hs_bindgen_bd195a3a2b34e483 =
  BG.fromFFIType hs_bindgen_bd195a3a2b34e483_base

-- | Seeds the pseudo-random number generator.
--
--     Reusing the seed number will cause @SDL_rand()@ to repeat the same stream of \'random\' numbers.
--
--     [Thread safety]: This should be called on the same thread that calls @SDL_rand()@
--
--     @since 3.2.0
--
--     [See also]: 'sDL_rand', 'sDL_rand_bits', 'sDL_randf'
--
--     [C declaration]: @SDL_srand@, defined at @SDL3\/SDL_stdinc.h 4294:34@
sDL_srand
  :: Uint64
  -- ^
  --
  --           [@seed@]: the value to use as a random number seed, or 0 to use SDL_GetPerformanceCounter().
  -> IO ()
sDL_srand = hs_bindgen_bd195a3a2b34e483

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_rand@
foreign import ccall safe "hs_bindgen_4b2da7e53b63ed17"
  hs_bindgen_4b2da7e53b63ed17_base
    :: BG.Int32
    -> IO BG.Int32

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_rand@
hs_bindgen_4b2da7e53b63ed17
  :: Sint32
  -> IO Sint32
hs_bindgen_4b2da7e53b63ed17 =
  BG.fromFFIType hs_bindgen_4b2da7e53b63ed17_base

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
--     [Returns]: a random value in the range of [0 .. n-1].
--
--     [Thread safety]: All calls should be made from a single thread
--
--     @since 3.2.0
--
--     [See also]: 'sDL_srand', 'sDL_randf'
--
--     [C declaration]: @SDL_rand@, defined at @SDL3\/SDL_stdinc.h 4328:36@
sDL_rand
  :: Sint32
  -- ^
  --
  --           [@n@]: the number of possible outcomes. n must be positive.
  -> IO Sint32
sDL_rand = hs_bindgen_4b2da7e53b63ed17

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_randf@
foreign import ccall safe "hs_bindgen_91fe5edd016e0570"
  hs_bindgen_91fe5edd016e0570_base
    :: IO Float

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_randf@
hs_bindgen_91fe5edd016e0570 :: IO BG.CFloat
hs_bindgen_91fe5edd016e0570 =
  BG.fromFFIType hs_bindgen_91fe5edd016e0570_base

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
sDL_randf :: IO BG.CFloat
sDL_randf = hs_bindgen_91fe5edd016e0570

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_rand_bits@
foreign import ccall safe "hs_bindgen_5d81c1c12775308d"
  hs_bindgen_5d81c1c12775308d_base
    :: IO BG.Word32

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_rand_bits@
hs_bindgen_5d81c1c12775308d :: IO Uint32
hs_bindgen_5d81c1c12775308d =
  BG.fromFFIType hs_bindgen_5d81c1c12775308d_base

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
sDL_rand_bits :: IO Uint32
sDL_rand_bits = hs_bindgen_5d81c1c12775308d

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_rand_r@
foreign import ccall safe "hs_bindgen_59abfd01a8d7b8f7"
  hs_bindgen_59abfd01a8d7b8f7_base
    :: BG.Ptr BG.Void
    -> BG.Int32
    -> IO BG.Int32

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_rand_r@
hs_bindgen_59abfd01a8d7b8f7
  :: BG.Ptr Uint64
  -> Sint32
  -> IO Sint32
hs_bindgen_59abfd01a8d7b8f7 =
  BG.fromFFIType hs_bindgen_59abfd01a8d7b8f7_base

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
--     [Returns]: a random value in the range of [0 .. n-1].
--
--     [Thread safety]: This function is thread-safe, as long as the state pointer isn\'t shared between threads.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_rand', 'sDL_rand_bits_r', 'sDL_randf_r'
--
--     [C declaration]: @SDL_rand_r@, defined at @SDL3\/SDL_stdinc.h 4409:36@
sDL_rand_r
  :: BG.Ptr Uint64
  -- ^
  --
  --           [@state@]: a pointer to the current random number state, this may not be NULL.
  -> Sint32
  -- ^
  --
  --           [@n@]: the number of possible outcomes. n must be positive.
  -> IO Sint32
sDL_rand_r = hs_bindgen_59abfd01a8d7b8f7

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_randf_r@
foreign import ccall safe "hs_bindgen_5da60fff1ce7873d"
  hs_bindgen_5da60fff1ce7873d_base
    :: BG.Ptr BG.Void
    -> IO Float

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_randf_r@
hs_bindgen_5da60fff1ce7873d
  :: BG.Ptr Uint64
  -> IO BG.CFloat
hs_bindgen_5da60fff1ce7873d =
  BG.fromFFIType hs_bindgen_5da60fff1ce7873d_base

-- | Generate a uniform pseudo-random floating point number less than 1.0
--
--     If you want reproducible output, be sure to initialize with @SDL_srand()@ first.
--
--     There are no guarantees as to the quality of the random sequence produced, and this should not be used for security (cryptography, passwords) or where money is on the line (loot-boxes, casinos). There are many random number libraries available with different characteristics and you should pick one of those to meet any serious needs.
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
sDL_randf_r
  :: BG.Ptr Uint64
  -- ^
  --
  --           [@state@]: a pointer to the current random number state, this may not be NULL.
  -> IO BG.CFloat
sDL_randf_r = hs_bindgen_5da60fff1ce7873d

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_rand_bits_r@
foreign import ccall safe "hs_bindgen_23de01659ed6ba6b"
  hs_bindgen_23de01659ed6ba6b_base
    :: BG.Ptr BG.Void
    -> IO BG.Word32

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_rand_bits_r@
hs_bindgen_23de01659ed6ba6b
  :: BG.Ptr Uint64
  -> IO Uint32
hs_bindgen_23de01659ed6ba6b =
  BG.fromFFIType hs_bindgen_23de01659ed6ba6b_base

-- | Generate 32 pseudo-random bits.
--
--     You likely want to use @SDL_rand_r()@ to get a psuedo-random number instead.
--
--     There are no guarantees as to the quality of the random sequence produced, and this should not be used for security (cryptography, passwords) or where money is on the line (loot-boxes, casinos). There are many random number libraries available with different characteristics and you should pick one of those to meet any serious needs.
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
sDL_rand_bits_r
  :: BG.Ptr Uint64
  -- ^
  --
  --           [@state@]: a pointer to the current random number state, this may not be NULL.
  -> IO Uint32
sDL_rand_bits_r = hs_bindgen_23de01659ed6ba6b

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_acos@
foreign import ccall safe "hs_bindgen_217308a0a788520d"
  hs_bindgen_217308a0a788520d_base
    :: Double
    -> IO Double

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_acos@
hs_bindgen_217308a0a788520d
  :: BG.CDouble
  -> IO BG.CDouble
hs_bindgen_217308a0a788520d =
  BG.fromFFIType hs_bindgen_217308a0a788520d_base

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
--     [Returns]: arc cosine of @x@, in radians.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_acosf', 'sDL_asin', 'sDL_cos'
--
--     [C declaration]: @SDL_acos@, defined at @SDL3\/SDL_stdinc.h 4515:36@
sDL_acos
  :: BG.CDouble
  -- ^
  --
  --           [@x@]: floating point value.
  -> IO BG.CDouble
sDL_acos = hs_bindgen_217308a0a788520d

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_acosf@
foreign import ccall safe "hs_bindgen_f093db4bb5e8e494"
  hs_bindgen_f093db4bb5e8e494_base
    :: Float
    -> IO Float

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_acosf@
hs_bindgen_f093db4bb5e8e494
  :: BG.CFloat
  -> IO BG.CFloat
hs_bindgen_f093db4bb5e8e494 =
  BG.fromFFIType hs_bindgen_f093db4bb5e8e494_base

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
--     [Returns]: arc cosine of @x@, in radians.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_acos', 'sDL_asinf', 'sDL_cosf'
--
--     [C declaration]: @SDL_acosf@, defined at @SDL3\/SDL_stdinc.h 4545:35@
sDL_acosf
  :: BG.CFloat
  -- ^
  --
  --           [@x@]: floating point value.
  -> IO BG.CFloat
sDL_acosf = hs_bindgen_f093db4bb5e8e494

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_asin@
foreign import ccall safe "hs_bindgen_205d9f923dff59cd"
  hs_bindgen_205d9f923dff59cd_base
    :: Double
    -> IO Double

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_asin@
hs_bindgen_205d9f923dff59cd
  :: BG.CDouble
  -> IO BG.CDouble
hs_bindgen_205d9f923dff59cd =
  BG.fromFFIType hs_bindgen_205d9f923dff59cd_base

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
--     [Returns]: arc sine of @x@, in radians.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_asinf', 'sDL_acos', 'sDL_sin'
--
--     [C declaration]: @SDL_asin@, defined at @SDL3\/SDL_stdinc.h 4575:36@
sDL_asin
  :: BG.CDouble
  -- ^
  --
  --           [@x@]: floating point value.
  -> IO BG.CDouble
sDL_asin = hs_bindgen_205d9f923dff59cd

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_asinf@
foreign import ccall safe "hs_bindgen_79771d582742f165"
  hs_bindgen_79771d582742f165_base
    :: Float
    -> IO Float

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_asinf@
hs_bindgen_79771d582742f165
  :: BG.CFloat
  -> IO BG.CFloat
hs_bindgen_79771d582742f165 =
  BG.fromFFIType hs_bindgen_79771d582742f165_base

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
--     [Returns]: arc sine of @x@, in radians.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_asin', 'sDL_acosf', 'sDL_sinf'
--
--     [C declaration]: @SDL_asinf@, defined at @SDL3\/SDL_stdinc.h 4605:35@
sDL_asinf
  :: BG.CFloat
  -- ^
  --
  --           [@x@]: floating point value.
  -> IO BG.CFloat
sDL_asinf = hs_bindgen_79771d582742f165

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_atan@
foreign import ccall safe "hs_bindgen_3051cbc85bd5efba"
  hs_bindgen_3051cbc85bd5efba_base
    :: Double
    -> IO Double

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_atan@
hs_bindgen_3051cbc85bd5efba
  :: BG.CDouble
  -> IO BG.CDouble
hs_bindgen_3051cbc85bd5efba =
  BG.fromFFIType hs_bindgen_3051cbc85bd5efba_base

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
--     [Returns]: arc tangent of of @x@ in radians, or 0 if @x = 0@.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_atanf', 'sDL_atan2', 'sDL_tan'
--
--     [C declaration]: @SDL_atan@, defined at @SDL3\/SDL_stdinc.h 4637:36@
sDL_atan
  :: BG.CDouble
  -- ^
  --
  --           [@x@]: floating point value.
  -> IO BG.CDouble
sDL_atan = hs_bindgen_3051cbc85bd5efba

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_atanf@
foreign import ccall safe "hs_bindgen_7d0bcd6030adfae6"
  hs_bindgen_7d0bcd6030adfae6_base
    :: Float
    -> IO Float

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_atanf@
hs_bindgen_7d0bcd6030adfae6
  :: BG.CFloat
  -> IO BG.CFloat
hs_bindgen_7d0bcd6030adfae6 =
  BG.fromFFIType hs_bindgen_7d0bcd6030adfae6_base

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
--     [Returns]: arc tangent of of @x@ in radians, or 0 if @x = 0@.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_atan', 'sDL_atan2f', 'sDL_tanf'
--
--     [C declaration]: @SDL_atanf@, defined at @SDL3\/SDL_stdinc.h 4669:35@
sDL_atanf
  :: BG.CFloat
  -- ^
  --
  --           [@x@]: floating point value.
  -> IO BG.CFloat
sDL_atanf = hs_bindgen_7d0bcd6030adfae6

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_atan2@
foreign import ccall safe "hs_bindgen_9ae010b5b4d9f553"
  hs_bindgen_9ae010b5b4d9f553_base
    :: Double
    -> Double
    -> IO Double

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_atan2@
hs_bindgen_9ae010b5b4d9f553
  :: BG.CDouble
  -> BG.CDouble
  -> IO BG.CDouble
hs_bindgen_9ae010b5b4d9f553 =
  BG.fromFFIType hs_bindgen_9ae010b5b4d9f553_base

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
--     [Returns]: arc tangent of of @y \/ x@ in radians, or, if @x = 0@, either @-Pi\/2@, @0@, or @Pi\/2@, depending on the value of @y@.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_atan2f', 'sDL_atan', 'sDL_tan'
--
--     [C declaration]: @SDL_atan2@, defined at @SDL3\/SDL_stdinc.h 4705:36@
sDL_atan2
  :: BG.CDouble
  -- ^
  --
  --           [@y@]: floating point value of the numerator (y coordinate).
  -> BG.CDouble
  -- ^
  --
  --           [@x@]: floating point value of the denominator (x coordinate).
  -> IO BG.CDouble
sDL_atan2 = hs_bindgen_9ae010b5b4d9f553

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_atan2f@
foreign import ccall safe "hs_bindgen_3eac4b1bfc5aff58"
  hs_bindgen_3eac4b1bfc5aff58_base
    :: Float
    -> Float
    -> IO Float

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_atan2f@
hs_bindgen_3eac4b1bfc5aff58
  :: BG.CFloat
  -> BG.CFloat
  -> IO BG.CFloat
hs_bindgen_3eac4b1bfc5aff58 =
  BG.fromFFIType hs_bindgen_3eac4b1bfc5aff58_base

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
--     [Returns]: arc tangent of of @y \/ x@ in radians, or, if @x = 0@, either @-Pi\/2@, @0@, or @Pi\/2@, depending on the value of @y@.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_atan2', 'sDL_atan', 'sDL_tan'
--
--     [C declaration]: @SDL_atan2f@, defined at @SDL3\/SDL_stdinc.h 4741:35@
sDL_atan2f
  :: BG.CFloat
  -- ^
  --
  --           [@y@]: floating point value of the numerator (y coordinate).
  -> BG.CFloat
  -- ^
  --
  --           [@x@]: floating point value of the denominator (x coordinate).
  -> IO BG.CFloat
sDL_atan2f = hs_bindgen_3eac4b1bfc5aff58

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_ceil@
foreign import ccall safe "hs_bindgen_1630cb0e3a004beb"
  hs_bindgen_1630cb0e3a004beb_base
    :: Double
    -> IO Double

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_ceil@
hs_bindgen_1630cb0e3a004beb
  :: BG.CDouble
  -> IO BG.CDouble
hs_bindgen_1630cb0e3a004beb =
  BG.fromFFIType hs_bindgen_1630cb0e3a004beb_base

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
--     [Returns]: the ceiling of @x@.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_ceilf', 'sDL_floor', 'sDL_trunc', 'sDL_round', @SDL_lround@
--
--     [C declaration]: @SDL_ceil@, defined at @SDL3\/SDL_stdinc.h 4769:36@
sDL_ceil
  :: BG.CDouble
  -- ^
  --
  --           [@x@]: floating point value.
  -> IO BG.CDouble
sDL_ceil = hs_bindgen_1630cb0e3a004beb

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_ceilf@
foreign import ccall safe "hs_bindgen_04a706bfcc971297"
  hs_bindgen_04a706bfcc971297_base
    :: Float
    -> IO Float

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_ceilf@
hs_bindgen_04a706bfcc971297
  :: BG.CFloat
  -> IO BG.CFloat
hs_bindgen_04a706bfcc971297 =
  BG.fromFFIType hs_bindgen_04a706bfcc971297_base

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
--     [Returns]: the ceiling of @x@.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_ceil', 'sDL_floorf', 'sDL_truncf', 'sDL_roundf', @SDL_lroundf@
--
--     [C declaration]: @SDL_ceilf@, defined at @SDL3\/SDL_stdinc.h 4797:35@
sDL_ceilf
  :: BG.CFloat
  -- ^
  --
  --           [@x@]: floating point value.
  -> IO BG.CFloat
sDL_ceilf = hs_bindgen_04a706bfcc971297

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_copysign@
foreign import ccall safe "hs_bindgen_fed0484ab850ee6a"
  hs_bindgen_fed0484ab850ee6a_base
    :: Double
    -> Double
    -> IO Double

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_copysign@
hs_bindgen_fed0484ab850ee6a
  :: BG.CDouble
  -> BG.CDouble
  -> IO BG.CDouble
hs_bindgen_fed0484ab850ee6a =
  BG.fromFFIType hs_bindgen_fed0484ab850ee6a_base

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
--     [Returns]: the floating point value with the sign of y and the magnitude of x.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_copysignf', 'sDL_fabs'
--
--     [C declaration]: @SDL_copysign@, defined at @SDL3\/SDL_stdinc.h 4823:36@
sDL_copysign
  :: BG.CDouble
  -- ^
  --
  --           [@x@]: floating point value to use as the magnitude.
  -> BG.CDouble
  -- ^
  --
  --           [@y@]: floating point value to use as the sign.
  -> IO BG.CDouble
sDL_copysign = hs_bindgen_fed0484ab850ee6a

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_copysignf@
foreign import ccall safe "hs_bindgen_d21fe858af73dd98"
  hs_bindgen_d21fe858af73dd98_base
    :: Float
    -> Float
    -> IO Float

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_copysignf@
hs_bindgen_d21fe858af73dd98
  :: BG.CFloat
  -> BG.CFloat
  -> IO BG.CFloat
hs_bindgen_d21fe858af73dd98 =
  BG.fromFFIType hs_bindgen_d21fe858af73dd98_base

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
--     [Returns]: the floating point value with the sign of y and the magnitude of x.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_copysign', 'sDL_fabsf'
--
--     [C declaration]: @SDL_copysignf@, defined at @SDL3\/SDL_stdinc.h 4849:35@
sDL_copysignf
  :: BG.CFloat
  -- ^
  --
  --           [@x@]: floating point value to use as the magnitude.
  -> BG.CFloat
  -- ^
  --
  --           [@y@]: floating point value to use as the sign.
  -> IO BG.CFloat
sDL_copysignf = hs_bindgen_d21fe858af73dd98

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_cos@
foreign import ccall safe "hs_bindgen_a4c38d6732d22ffb"
  hs_bindgen_a4c38d6732d22ffb_base
    :: Double
    -> IO Double

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_cos@
hs_bindgen_a4c38d6732d22ffb
  :: BG.CDouble
  -> IO BG.CDouble
hs_bindgen_a4c38d6732d22ffb =
  BG.fromFFIType hs_bindgen_a4c38d6732d22ffb_base

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
--     [Returns]: cosine of @x@.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_cosf', 'sDL_acos', 'sDL_sin'
--
--     [C declaration]: @SDL_cos@, defined at @SDL3\/SDL_stdinc.h 4877:36@
sDL_cos
  :: BG.CDouble
  -- ^
  --
  --           [@x@]: floating point value, in radians.
  -> IO BG.CDouble
sDL_cos = hs_bindgen_a4c38d6732d22ffb

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_cosf@
foreign import ccall safe "hs_bindgen_ad11505e8fd49060"
  hs_bindgen_ad11505e8fd49060_base
    :: Float
    -> IO Float

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_cosf@
hs_bindgen_ad11505e8fd49060
  :: BG.CFloat
  -> IO BG.CFloat
hs_bindgen_ad11505e8fd49060 =
  BG.fromFFIType hs_bindgen_ad11505e8fd49060_base

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
--     [Returns]: cosine of @x@.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_cos', 'sDL_acosf', 'sDL_sinf'
--
--     [C declaration]: @SDL_cosf@, defined at @SDL3\/SDL_stdinc.h 4905:35@
sDL_cosf
  :: BG.CFloat
  -- ^
  --
  --           [@x@]: floating point value, in radians.
  -> IO BG.CFloat
sDL_cosf = hs_bindgen_ad11505e8fd49060

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_exp@
foreign import ccall safe "hs_bindgen_ffaa0913f3d0c63c"
  hs_bindgen_ffaa0913f3d0c63c_base
    :: Double
    -> IO Double

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_exp@
hs_bindgen_ffaa0913f3d0c63c
  :: BG.CDouble
  -> IO BG.CDouble
hs_bindgen_ffaa0913f3d0c63c =
  BG.fromFFIType hs_bindgen_ffaa0913f3d0c63c_base

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
--     [Returns]: value of @e^x@.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_expf', 'sDL_log'
--
--     [C declaration]: @SDL_exp@, defined at @SDL3\/SDL_stdinc.h 4937:36@
sDL_exp
  :: BG.CDouble
  -- ^
  --
  --           [@x@]: floating point value.
  -> IO BG.CDouble
sDL_exp = hs_bindgen_ffaa0913f3d0c63c

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_expf@
foreign import ccall safe "hs_bindgen_4d5e3977a4eb4c12"
  hs_bindgen_4d5e3977a4eb4c12_base
    :: Float
    -> IO Float

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_expf@
hs_bindgen_4d5e3977a4eb4c12
  :: BG.CFloat
  -> IO BG.CFloat
hs_bindgen_4d5e3977a4eb4c12 =
  BG.fromFFIType hs_bindgen_4d5e3977a4eb4c12_base

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
--     [Returns]: value of @e^x@.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_exp', 'sDL_logf'
--
--     [C declaration]: @SDL_expf@, defined at @SDL3\/SDL_stdinc.h 4969:35@
sDL_expf
  :: BG.CFloat
  -- ^
  --
  --           [@x@]: floating point value.
  -> IO BG.CFloat
sDL_expf = hs_bindgen_4d5e3977a4eb4c12

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_fabs@
foreign import ccall safe "hs_bindgen_89730ae2b638ee61"
  hs_bindgen_89730ae2b638ee61_base
    :: Double
    -> IO Double

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_fabs@
hs_bindgen_89730ae2b638ee61
  :: BG.CDouble
  -> IO BG.CDouble
hs_bindgen_89730ae2b638ee61 =
  BG.fromFFIType hs_bindgen_89730ae2b638ee61_base

-- | Compute the absolute value of @x@
--
--     Domain: @-INF \<= x \<= INF@
--
--     Range: @0 \<= y \<= INF@
--
--     This function operates on double-precision floating point values, use SDL_fabsf for single-precision floats.
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
sDL_fabs
  :: BG.CDouble
  -- ^
  --
  --           [@x@]: floating point value to use as the magnitude.
  -> IO BG.CDouble
sDL_fabs = hs_bindgen_89730ae2b638ee61

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_fabsf@
foreign import ccall safe "hs_bindgen_4e76324c9b8f7453"
  hs_bindgen_4e76324c9b8f7453_base
    :: Float
    -> IO Float

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_fabsf@
hs_bindgen_4e76324c9b8f7453
  :: BG.CFloat
  -> IO BG.CFloat
hs_bindgen_4e76324c9b8f7453 =
  BG.fromFFIType hs_bindgen_4e76324c9b8f7453_base

-- | Compute the absolute value of @x@
--
--     Domain: @-INF \<= x \<= INF@
--
--     Range: @0 \<= y \<= INF@
--
--     This function operates on single-precision floating point values, use SDL_fabs for double-precision floats.
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
sDL_fabsf
  :: BG.CFloat
  -- ^
  --
  --           [@x@]: floating point value to use as the magnitude.
  -> IO BG.CFloat
sDL_fabsf = hs_bindgen_4e76324c9b8f7453

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_floor@
foreign import ccall safe "hs_bindgen_4c646d1d6b7e922f"
  hs_bindgen_4c646d1d6b7e922f_base
    :: Double
    -> IO Double

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_floor@
hs_bindgen_4c646d1d6b7e922f
  :: BG.CDouble
  -> IO BG.CDouble
hs_bindgen_4c646d1d6b7e922f =
  BG.fromFFIType hs_bindgen_4c646d1d6b7e922f_base

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
--     [Returns]: the floor of @x@.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_floorf', 'sDL_ceil', 'sDL_trunc', 'sDL_round', @SDL_lround@
--
--     [C declaration]: @SDL_floor@, defined at @SDL3\/SDL_stdinc.h 5039:36@
sDL_floor
  :: BG.CDouble
  -- ^
  --
  --           [@x@]: floating point value.
  -> IO BG.CDouble
sDL_floor = hs_bindgen_4c646d1d6b7e922f

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_floorf@
foreign import ccall safe "hs_bindgen_db6fbb0a591a2804"
  hs_bindgen_db6fbb0a591a2804_base
    :: Float
    -> IO Float

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_floorf@
hs_bindgen_db6fbb0a591a2804
  :: BG.CFloat
  -> IO BG.CFloat
hs_bindgen_db6fbb0a591a2804 =
  BG.fromFFIType hs_bindgen_db6fbb0a591a2804_base

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
--     [Returns]: the floor of @x@.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_floor', 'sDL_ceilf', 'sDL_truncf', 'sDL_roundf', @SDL_lroundf@
--
--     [C declaration]: @SDL_floorf@, defined at @SDL3\/SDL_stdinc.h 5067:35@
sDL_floorf
  :: BG.CFloat
  -- ^
  --
  --           [@x@]: floating point value.
  -> IO BG.CFloat
sDL_floorf = hs_bindgen_db6fbb0a591a2804

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_trunc@
foreign import ccall safe "hs_bindgen_2b4f0ab682c421b7"
  hs_bindgen_2b4f0ab682c421b7_base
    :: Double
    -> IO Double

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_trunc@
hs_bindgen_2b4f0ab682c421b7
  :: BG.CDouble
  -> IO BG.CDouble
hs_bindgen_2b4f0ab682c421b7 =
  BG.fromFFIType hs_bindgen_2b4f0ab682c421b7_base

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
--     [Returns]: @x@ truncated to an integer.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_truncf', 'sDL_fmod', 'sDL_ceil', 'sDL_floor', 'sDL_round', @SDL_lround@
--
--     [C declaration]: @SDL_trunc@, defined at @SDL3\/SDL_stdinc.h 5096:36@
sDL_trunc
  :: BG.CDouble
  -- ^
  --
  --           [@x@]: floating point value.
  -> IO BG.CDouble
sDL_trunc = hs_bindgen_2b4f0ab682c421b7

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_truncf@
foreign import ccall safe "hs_bindgen_afe8ddb39d52a293"
  hs_bindgen_afe8ddb39d52a293_base
    :: Float
    -> IO Float

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_truncf@
hs_bindgen_afe8ddb39d52a293
  :: BG.CFloat
  -> IO BG.CFloat
hs_bindgen_afe8ddb39d52a293 =
  BG.fromFFIType hs_bindgen_afe8ddb39d52a293_base

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
--     [Returns]: @x@ truncated to an integer.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_trunc', 'sDL_fmodf', 'sDL_ceilf', 'sDL_floorf', 'sDL_roundf', @SDL_lroundf@
--
--     [C declaration]: @SDL_truncf@, defined at @SDL3\/SDL_stdinc.h 5125:35@
sDL_truncf
  :: BG.CFloat
  -- ^
  --
  --           [@x@]: floating point value.
  -> IO BG.CFloat
sDL_truncf = hs_bindgen_afe8ddb39d52a293

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_fmod@
foreign import ccall safe "hs_bindgen_f1fc4d1a8a6fd613"
  hs_bindgen_f1fc4d1a8a6fd613_base
    :: Double
    -> Double
    -> IO Double

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_fmod@
hs_bindgen_f1fc4d1a8a6fd613
  :: BG.CDouble
  -> BG.CDouble
  -> IO BG.CDouble
hs_bindgen_f1fc4d1a8a6fd613 =
  BG.fromFFIType hs_bindgen_f1fc4d1a8a6fd613_base

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
--     [Returns]: the remainder of @x \/ y@.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_fmodf', 'sDL_modf', 'sDL_trunc', 'sDL_ceil', 'sDL_floor', 'sDL_round', @SDL_lround@
--
--     [C declaration]: @SDL_fmod@, defined at @SDL3\/SDL_stdinc.h 5155:36@
sDL_fmod
  :: BG.CDouble
  -- ^
  --
  --           [@x@]: the numerator.
  -> BG.CDouble
  -- ^
  --
  --           [@y@]: the denominator. Must not be 0.
  -> IO BG.CDouble
sDL_fmod = hs_bindgen_f1fc4d1a8a6fd613

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_fmodf@
foreign import ccall safe "hs_bindgen_19c2a30dd6614c51"
  hs_bindgen_19c2a30dd6614c51_base
    :: Float
    -> Float
    -> IO Float

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_fmodf@
hs_bindgen_19c2a30dd6614c51
  :: BG.CFloat
  -> BG.CFloat
  -> IO BG.CFloat
hs_bindgen_19c2a30dd6614c51 =
  BG.fromFFIType hs_bindgen_19c2a30dd6614c51_base

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
--     [Returns]: the remainder of @x \/ y@.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_fmod', 'sDL_truncf', 'sDL_modff', 'sDL_ceilf', 'sDL_floorf', 'sDL_roundf', @SDL_lroundf@
--
--     [C declaration]: @SDL_fmodf@, defined at @SDL3\/SDL_stdinc.h 5185:35@
sDL_fmodf
  :: BG.CFloat
  -- ^
  --
  --           [@x@]: the numerator.
  -> BG.CFloat
  -- ^
  --
  --           [@y@]: the denominator. Must not be 0.
  -> IO BG.CFloat
sDL_fmodf = hs_bindgen_19c2a30dd6614c51

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_isinf@
foreign import ccall safe "hs_bindgen_9be13530739c3139"
  hs_bindgen_9be13530739c3139_base
    :: Double
    -> IO BG.Int32

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_isinf@
hs_bindgen_9be13530739c3139
  :: BG.CDouble
  -> IO BG.CInt
hs_bindgen_9be13530739c3139 =
  BG.fromFFIType hs_bindgen_9be13530739c3139_base

-- | Return whether the value is infinity.
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
sDL_isinf
  :: BG.CDouble
  -- ^
  --
  --           [@x@]: double-precision floating point value.
  -> IO BG.CInt
sDL_isinf = hs_bindgen_9be13530739c3139

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_isinff@
foreign import ccall safe "hs_bindgen_d063ada15b71ed19"
  hs_bindgen_d063ada15b71ed19_base
    :: Float
    -> IO BG.Int32

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_isinff@
hs_bindgen_d063ada15b71ed19
  :: BG.CFloat
  -> IO BG.CInt
hs_bindgen_d063ada15b71ed19 =
  BG.fromFFIType hs_bindgen_d063ada15b71ed19_base

-- | Return whether the value is infinity.
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
sDL_isinff
  :: BG.CFloat
  -- ^
  --
  --           [@x@]: floating point value.
  -> IO BG.CInt
sDL_isinff = hs_bindgen_d063ada15b71ed19

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_isnan@
foreign import ccall safe "hs_bindgen_bb4d9f6611f2a512"
  hs_bindgen_bb4d9f6611f2a512_base
    :: Double
    -> IO BG.Int32

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_isnan@
hs_bindgen_bb4d9f6611f2a512
  :: BG.CDouble
  -> IO BG.CInt
hs_bindgen_bb4d9f6611f2a512 =
  BG.fromFFIType hs_bindgen_bb4d9f6611f2a512_base

-- | Return whether the value is NaN.
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
sDL_isnan
  :: BG.CDouble
  -- ^
  --
  --           [@x@]: double-precision floating point value.
  -> IO BG.CInt
sDL_isnan = hs_bindgen_bb4d9f6611f2a512

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_isnanf@
foreign import ccall safe "hs_bindgen_48e10ed50de37991"
  hs_bindgen_48e10ed50de37991_base
    :: Float
    -> IO BG.Int32

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_isnanf@
hs_bindgen_48e10ed50de37991
  :: BG.CFloat
  -> IO BG.CInt
hs_bindgen_48e10ed50de37991 =
  BG.fromFFIType hs_bindgen_48e10ed50de37991_base

-- | Return whether the value is NaN.
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
sDL_isnanf
  :: BG.CFloat
  -- ^
  --
  --           [@x@]: floating point value.
  -> IO BG.CInt
sDL_isnanf = hs_bindgen_48e10ed50de37991

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_log@
foreign import ccall safe "hs_bindgen_46922ccc470e92e0"
  hs_bindgen_46922ccc470e92e0_base
    :: Double
    -> IO Double

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_log@
hs_bindgen_46922ccc470e92e0
  :: BG.CDouble
  -> IO BG.CDouble
hs_bindgen_46922ccc470e92e0 =
  BG.fromFFIType hs_bindgen_46922ccc470e92e0_base

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
--     [Returns]: the natural logarithm of @x@.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_logf', 'sDL_log10', 'sDL_exp'
--
--     [C declaration]: @SDL_log@, defined at @SDL3\/SDL_stdinc.h 5271:36@
sDL_log
  :: BG.CDouble
  -- ^
  --
  --           [@x@]: floating point value. Must be greater than 0.
  -> IO BG.CDouble
sDL_log = hs_bindgen_46922ccc470e92e0

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_logf@
foreign import ccall safe "hs_bindgen_7ef0b9f4239eb37e"
  hs_bindgen_7ef0b9f4239eb37e_base
    :: Float
    -> IO Float

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_logf@
hs_bindgen_7ef0b9f4239eb37e
  :: BG.CFloat
  -> IO BG.CFloat
hs_bindgen_7ef0b9f4239eb37e =
  BG.fromFFIType hs_bindgen_7ef0b9f4239eb37e_base

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
--     [Returns]: the natural logarithm of @x@.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_log', 'sDL_expf'
--
--     [C declaration]: @SDL_logf@, defined at @SDL3\/SDL_stdinc.h 5300:35@
sDL_logf
  :: BG.CFloat
  -- ^
  --
  --           [@x@]: floating point value. Must be greater than 0.
  -> IO BG.CFloat
sDL_logf = hs_bindgen_7ef0b9f4239eb37e

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_log10@
foreign import ccall safe "hs_bindgen_bc1ad316da1b3bbc"
  hs_bindgen_bc1ad316da1b3bbc_base
    :: Double
    -> IO Double

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_log10@
hs_bindgen_bc1ad316da1b3bbc
  :: BG.CDouble
  -> IO BG.CDouble
hs_bindgen_bc1ad316da1b3bbc =
  BG.fromFFIType hs_bindgen_bc1ad316da1b3bbc_base

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
--     [Returns]: the logarithm of @x@.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_log10f', 'sDL_log', 'sDL_pow'
--
--     [C declaration]: @SDL_log10@, defined at @SDL3\/SDL_stdinc.h 5330:36@
sDL_log10
  :: BG.CDouble
  -- ^
  --
  --           [@x@]: floating point value. Must be greater than 0.
  -> IO BG.CDouble
sDL_log10 = hs_bindgen_bc1ad316da1b3bbc

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_log10f@
foreign import ccall safe "hs_bindgen_310aebbf28df3250"
  hs_bindgen_310aebbf28df3250_base
    :: Float
    -> IO Float

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_log10f@
hs_bindgen_310aebbf28df3250
  :: BG.CFloat
  -> IO BG.CFloat
hs_bindgen_310aebbf28df3250 =
  BG.fromFFIType hs_bindgen_310aebbf28df3250_base

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
--     [Returns]: the logarithm of @x@.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_log10', 'sDL_logf', 'sDL_powf'
--
--     [C declaration]: @SDL_log10f@, defined at @SDL3\/SDL_stdinc.h 5360:35@
sDL_log10f
  :: BG.CFloat
  -- ^
  --
  --           [@x@]: floating point value. Must be greater than 0.
  -> IO BG.CFloat
sDL_log10f = hs_bindgen_310aebbf28df3250

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_modf@
foreign import ccall safe "hs_bindgen_93a468f91c55ba99"
  hs_bindgen_93a468f91c55ba99_base
    :: Double
    -> BG.Ptr BG.Void
    -> IO Double

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_modf@
hs_bindgen_93a468f91c55ba99
  :: BG.CDouble
  -> BG.Ptr BG.CDouble
  -> IO BG.CDouble
hs_bindgen_93a468f91c55ba99 =
  BG.fromFFIType hs_bindgen_93a468f91c55ba99_base

-- | Split @x@ into integer and fractional parts
--
--     This function operates on double-precision floating point values, use SDL_modff for single-precision floats.
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
sDL_modf
  :: BG.CDouble
  -- ^
  --
  --           [@x@]: floating point value.
  -> BG.Ptr BG.CDouble
  -- ^
  --
  --           [@y@]: output pointer to store the integer part of @x@.
  -> IO BG.CDouble
sDL_modf = hs_bindgen_93a468f91c55ba99

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_modff@
foreign import ccall safe "hs_bindgen_76a18e33bbbed6ee"
  hs_bindgen_76a18e33bbbed6ee_base
    :: Float
    -> BG.Ptr BG.Void
    -> IO Float

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_modff@
hs_bindgen_76a18e33bbbed6ee
  :: BG.CFloat
  -> BG.Ptr BG.CFloat
  -> IO BG.CFloat
hs_bindgen_76a18e33bbbed6ee =
  BG.fromFFIType hs_bindgen_76a18e33bbbed6ee_base

-- | Split @x@ into integer and fractional parts
--
--     This function operates on single-precision floating point values, use SDL_modf for double-precision floats.
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
sDL_modff
  :: BG.CFloat
  -- ^
  --
  --           [@x@]: floating point value.
  -> BG.Ptr BG.CFloat
  -- ^
  --
  --           [@y@]: output pointer to store the integer part of @x@.
  -> IO BG.CFloat
sDL_modff = hs_bindgen_76a18e33bbbed6ee

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_pow@
foreign import ccall safe "hs_bindgen_b8c28ba00815fbb9"
  hs_bindgen_b8c28ba00815fbb9_base
    :: Double
    -> Double
    -> IO Double

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_pow@
hs_bindgen_b8c28ba00815fbb9
  :: BG.CDouble
  -> BG.CDouble
  -> IO BG.CDouble
hs_bindgen_b8c28ba00815fbb9 =
  BG.fromFFIType hs_bindgen_b8c28ba00815fbb9_base

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
--     [Returns]: @x@ raised to the power @y@.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_powf', 'sDL_exp', 'sDL_log'
--
--     [C declaration]: @SDL_pow@, defined at @SDL3\/SDL_stdinc.h 5432:36@
sDL_pow
  :: BG.CDouble
  -- ^
  --
  --           [@x@]: the base.
  -> BG.CDouble
  -- ^
  --
  --           [@y@]: the exponent.
  -> IO BG.CDouble
sDL_pow = hs_bindgen_b8c28ba00815fbb9

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_powf@
foreign import ccall safe "hs_bindgen_d853802a7561099f"
  hs_bindgen_d853802a7561099f_base
    :: Float
    -> Float
    -> IO Float

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_powf@
hs_bindgen_d853802a7561099f
  :: BG.CFloat
  -> BG.CFloat
  -> IO BG.CFloat
hs_bindgen_d853802a7561099f =
  BG.fromFFIType hs_bindgen_d853802a7561099f_base

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
--     [Returns]: @x@ raised to the power @y@.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_pow', 'sDL_expf', 'sDL_logf'
--
--     [C declaration]: @SDL_powf@, defined at @SDL3\/SDL_stdinc.h 5464:35@
sDL_powf
  :: BG.CFloat
  -- ^
  --
  --           [@x@]: the base.
  -> BG.CFloat
  -- ^
  --
  --           [@y@]: the exponent.
  -> IO BG.CFloat
sDL_powf = hs_bindgen_d853802a7561099f

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_round@
foreign import ccall safe "hs_bindgen_097e1eceb090a078"
  hs_bindgen_097e1eceb090a078_base
    :: Double
    -> IO Double

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_round@
hs_bindgen_097e1eceb090a078
  :: BG.CDouble
  -> IO BG.CDouble
hs_bindgen_097e1eceb090a078 =
  BG.fromFFIType hs_bindgen_097e1eceb090a078_base

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
--     [Returns]: the nearest integer to @x@.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_roundf', @SDL_lround@, 'sDL_floor', 'sDL_ceil', 'sDL_trunc'
--
--     [C declaration]: @SDL_round@, defined at @SDL3\/SDL_stdinc.h 5493:36@
sDL_round
  :: BG.CDouble
  -- ^
  --
  --           [@x@]: floating point value.
  -> IO BG.CDouble
sDL_round = hs_bindgen_097e1eceb090a078

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_roundf@
foreign import ccall safe "hs_bindgen_5b677097112f1617"
  hs_bindgen_5b677097112f1617_base
    :: Float
    -> IO Float

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_roundf@
hs_bindgen_5b677097112f1617
  :: BG.CFloat
  -> IO BG.CFloat
hs_bindgen_5b677097112f1617 =
  BG.fromFFIType hs_bindgen_5b677097112f1617_base

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
--     [Returns]: the nearest integer to @x@.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_round', @SDL_lroundf@, 'sDL_floorf', 'sDL_ceilf', 'sDL_truncf'
--
--     [C declaration]: @SDL_roundf@, defined at @SDL3\/SDL_stdinc.h 5522:35@
sDL_roundf
  :: BG.CFloat
  -- ^
  --
  --           [@x@]: floating point value.
  -> IO BG.CFloat
sDL_roundf = hs_bindgen_5b677097112f1617

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_scalbn@
foreign import ccall safe "hs_bindgen_8038e0526522260c"
  hs_bindgen_8038e0526522260c_base
    :: Double
    -> BG.Int32
    -> IO Double

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_scalbn@
hs_bindgen_8038e0526522260c
  :: BG.CDouble
  -> BG.CInt
  -> IO BG.CDouble
hs_bindgen_8038e0526522260c =
  BG.fromFFIType hs_bindgen_8038e0526522260c_base

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
--     [Returns]: @x * 2^n@.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_scalbnf', 'sDL_pow'
--
--     [C declaration]: @SDL_scalbn@, defined at @SDL3\/SDL_stdinc.h 5605:36@
sDL_scalbn
  :: BG.CDouble
  -- ^
  --
  --           [@x@]: floating point value to be scaled.
  -> BG.CInt
  -- ^
  --
  --           [@n@]: integer exponent.
  -> IO BG.CDouble
sDL_scalbn = hs_bindgen_8038e0526522260c

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_scalbnf@
foreign import ccall safe "hs_bindgen_fc0cb80cec8a11b0"
  hs_bindgen_fc0cb80cec8a11b0_base
    :: Float
    -> BG.Int32
    -> IO Float

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_scalbnf@
hs_bindgen_fc0cb80cec8a11b0
  :: BG.CFloat
  -> BG.CInt
  -> IO BG.CFloat
hs_bindgen_fc0cb80cec8a11b0 =
  BG.fromFFIType hs_bindgen_fc0cb80cec8a11b0_base

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
--     [Returns]: @x * 2^n@.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_scalbn', 'sDL_powf'
--
--     [C declaration]: @SDL_scalbnf@, defined at @SDL3\/SDL_stdinc.h 5630:35@
sDL_scalbnf
  :: BG.CFloat
  -- ^
  --
  --           [@x@]: floating point value to be scaled.
  -> BG.CInt
  -- ^
  --
  --           [@n@]: integer exponent.
  -> IO BG.CFloat
sDL_scalbnf = hs_bindgen_fc0cb80cec8a11b0

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_sin@
foreign import ccall safe "hs_bindgen_d062c0d717121757"
  hs_bindgen_d062c0d717121757_base
    :: Double
    -> IO Double

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_sin@
hs_bindgen_d062c0d717121757
  :: BG.CDouble
  -> IO BG.CDouble
hs_bindgen_d062c0d717121757 =
  BG.fromFFIType hs_bindgen_d062c0d717121757_base

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
--     [Returns]: sine of @x@.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_sinf', 'sDL_asin', 'sDL_cos'
--
--     [C declaration]: @SDL_sin@, defined at @SDL3\/SDL_stdinc.h 5658:36@
sDL_sin
  :: BG.CDouble
  -- ^
  --
  --           [@x@]: floating point value, in radians.
  -> IO BG.CDouble
sDL_sin = hs_bindgen_d062c0d717121757

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_sinf@
foreign import ccall safe "hs_bindgen_4ee3ee787bd19e91"
  hs_bindgen_4ee3ee787bd19e91_base
    :: Float
    -> IO Float

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_sinf@
hs_bindgen_4ee3ee787bd19e91
  :: BG.CFloat
  -> IO BG.CFloat
hs_bindgen_4ee3ee787bd19e91 =
  BG.fromFFIType hs_bindgen_4ee3ee787bd19e91_base

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
--     [Returns]: sine of @x@.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_sin', 'sDL_asinf', 'sDL_cosf'
--
--     [C declaration]: @SDL_sinf@, defined at @SDL3\/SDL_stdinc.h 5686:35@
sDL_sinf
  :: BG.CFloat
  -- ^
  --
  --           [@x@]: floating point value, in radians.
  -> IO BG.CFloat
sDL_sinf = hs_bindgen_4ee3ee787bd19e91

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_sqrt@
foreign import ccall safe "hs_bindgen_45b7bf5fa33e3269"
  hs_bindgen_45b7bf5fa33e3269_base
    :: Double
    -> IO Double

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_sqrt@
hs_bindgen_45b7bf5fa33e3269
  :: BG.CDouble
  -> IO BG.CDouble
hs_bindgen_45b7bf5fa33e3269 =
  BG.fromFFIType hs_bindgen_45b7bf5fa33e3269_base

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
--     [Returns]: square root of @x@.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_sqrtf'
--
--     [C declaration]: @SDL_sqrt@, defined at @SDL3\/SDL_stdinc.h 5712:36@
sDL_sqrt
  :: BG.CDouble
  -- ^
  --
  --           [@x@]: floating point value. Must be greater than or equal to 0.
  -> IO BG.CDouble
sDL_sqrt = hs_bindgen_45b7bf5fa33e3269

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_sqrtf@
foreign import ccall safe "hs_bindgen_da05b17837e5fa68"
  hs_bindgen_da05b17837e5fa68_base
    :: Float
    -> IO Float

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_sqrtf@
hs_bindgen_da05b17837e5fa68
  :: BG.CFloat
  -> IO BG.CFloat
hs_bindgen_da05b17837e5fa68 =
  BG.fromFFIType hs_bindgen_da05b17837e5fa68_base

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
--     [Returns]: square root of @x@.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_sqrt'
--
--     [C declaration]: @SDL_sqrtf@, defined at @SDL3\/SDL_stdinc.h 5738:35@
sDL_sqrtf
  :: BG.CFloat
  -- ^
  --
  --           [@x@]: floating point value. Must be greater than or equal to 0.
  -> IO BG.CFloat
sDL_sqrtf = hs_bindgen_da05b17837e5fa68

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_tan@
foreign import ccall safe "hs_bindgen_8e3c4624ada8d754"
  hs_bindgen_8e3c4624ada8d754_base
    :: Double
    -> IO Double

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_tan@
hs_bindgen_8e3c4624ada8d754
  :: BG.CDouble
  -> IO BG.CDouble
hs_bindgen_8e3c4624ada8d754 =
  BG.fromFFIType hs_bindgen_8e3c4624ada8d754_base

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
--     [Returns]: tangent of @x@.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_tanf', 'sDL_sin', 'sDL_cos', 'sDL_atan', 'sDL_atan2'
--
--     [C declaration]: @SDL_tan@, defined at @SDL3\/SDL_stdinc.h 5768:36@
sDL_tan
  :: BG.CDouble
  -- ^
  --
  --           [@x@]: floating point value, in radians.
  -> IO BG.CDouble
sDL_tan = hs_bindgen_8e3c4624ada8d754

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_tanf@
foreign import ccall safe "hs_bindgen_b4a5a33f270aeb8d"
  hs_bindgen_b4a5a33f270aeb8d_base
    :: Float
    -> IO Float

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_tanf@
hs_bindgen_b4a5a33f270aeb8d
  :: BG.CFloat
  -> IO BG.CFloat
hs_bindgen_b4a5a33f270aeb8d =
  BG.fromFFIType hs_bindgen_b4a5a33f270aeb8d_base

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
--     [Returns]: tangent of @x@.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_tan', 'sDL_sinf', 'sDL_cosf', 'sDL_atanf', 'sDL_atan2f'
--
--     [C declaration]: @SDL_tanf@, defined at @SDL3\/SDL_stdinc.h 5798:35@
sDL_tanf
  :: BG.CFloat
  -- ^
  --
  --           [@x@]: floating point value, in radians.
  -> IO BG.CFloat
sDL_tanf = hs_bindgen_b4a5a33f270aeb8d

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_iconv_open@
foreign import ccall safe "hs_bindgen_4c58e728caad9aa3"
  hs_bindgen_4c58e728caad9aa3_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_iconv_open@
hs_bindgen_4c58e728caad9aa3
  :: PtrConst.PtrConst BG.CChar
  -> PtrConst.PtrConst BG.CChar
  -> IO SDL_iconv_t
hs_bindgen_4c58e728caad9aa3 =
  BG.fromFFIType hs_bindgen_4c58e728caad9aa3_base

-- | This function allocates a context for the specified character set conversion.
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
  :: PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@tocode@]: The target character encoding, must not be NULL.
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@fromcode@]: The source character encoding, must not be NULL.
  -> IO SDL_iconv_t
sDL_iconv_open = hs_bindgen_4c58e728caad9aa3

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_iconv_close@
foreign import ccall safe "hs_bindgen_85fcb2de02d7791f"
  hs_bindgen_85fcb2de02d7791f_base
    :: BG.Ptr BG.Void
    -> IO BG.Int32

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_iconv_close@
hs_bindgen_85fcb2de02d7791f
  :: SDL_iconv_t
  -> IO BG.CInt
hs_bindgen_85fcb2de02d7791f =
  BG.fromFFIType hs_bindgen_85fcb2de02d7791f_base

-- | This function frees a context used for character set conversion.
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
sDL_iconv_close
  :: SDL_iconv_t
  -- ^
  --
  --           [@cd@]: The character set conversion handle.
  -> IO BG.CInt
sDL_iconv_close = hs_bindgen_85fcb2de02d7791f

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_iconv@
foreign import ccall safe "hs_bindgen_73663c44fcaa8f9d"
  hs_bindgen_73663c44fcaa8f9d_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO BG.Word64

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_iconv@
hs_bindgen_73663c44fcaa8f9d
  :: SDL_iconv_t
  -> BG.Ptr (PtrConst.PtrConst BG.CChar)
  -> BG.Ptr HsBindgen.Runtime.LibC.CSize
  -> BG.Ptr (BG.Ptr BG.CChar)
  -> BG.Ptr HsBindgen.Runtime.LibC.CSize
  -> IO HsBindgen.Runtime.LibC.CSize
hs_bindgen_73663c44fcaa8f9d =
  BG.fromFFIType hs_bindgen_73663c44fcaa8f9d_base

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
  :: SDL_iconv_t
  -- ^
  --
  --           [@cd@]: The character set conversion context, created in @SDL_iconv_open()@.
  -> BG.Ptr (PtrConst.PtrConst BG.CChar)
  -- ^
  --
  --           [@inbuf@]: Address of variable that points to the first character of the input sequence.
  -> BG.Ptr HsBindgen.Runtime.LibC.CSize
  -- ^
  --
  --           [@inbytesleft@]: The number of bytes in the input buffer.
  -> BG.Ptr (BG.Ptr BG.CChar)
  -- ^
  --
  --           [@outbuf@]: Address of variable that points to the output buffer.
  -> BG.Ptr HsBindgen.Runtime.LibC.CSize
  -- ^
  --
  --           [@outbytesleft@]: The number of bytes in the output buffer.
  -> IO HsBindgen.Runtime.LibC.CSize
sDL_iconv = hs_bindgen_73663c44fcaa8f9d

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_iconv_string@
foreign import ccall safe "hs_bindgen_066c0e98a41d1c6b"
  hs_bindgen_066c0e98a41d1c6b_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Word64
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_iconv_string@
hs_bindgen_066c0e98a41d1c6b
  :: PtrConst.PtrConst BG.CChar
  -> PtrConst.PtrConst BG.CChar
  -> PtrConst.PtrConst BG.CChar
  -> HsBindgen.Runtime.LibC.CSize
  -> IO (BG.Ptr BG.CChar)
hs_bindgen_066c0e98a41d1c6b =
  BG.fromFFIType hs_bindgen_066c0e98a41d1c6b_base

-- | Helper function to convert a string\'s encoding in one call.
--
--     This function converts a buffer or string between encodings in one pass.
--
--     The string does not need to be NULL-terminated; this function operates on the number of bytes specified in @inbytesleft@ whether there is a NULL character anywhere in the buffer.
--
--     The returned string is owned by the caller, and should be passed to SDL_free when no longer needed.
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
  :: PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@tocode@]: the character encoding of the output string. Examples are \"UTF-8\", \"UCS-4\", etc.
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@fromcode@]: the character encoding of data in @inbuf@.
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@inbuf@]: the string to convert to a different encoding.
  -> HsBindgen.Runtime.LibC.CSize
  -- ^
  --
  --           [@inbytesleft@]: the size of the input string /in bytes/.
  -> IO (BG.Ptr BG.CChar)
sDL_iconv_string = hs_bindgen_066c0e98a41d1c6b

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_size_mul_check_overflow_builtin@
foreign import ccall safe "hs_bindgen_cb7ffceaa134d628"
  hs_bindgen_cb7ffceaa134d628_base
    :: BG.Word64
    -> BG.Word64
    -> BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_size_mul_check_overflow_builtin@
hs_bindgen_cb7ffceaa134d628
  :: HsBindgen.Runtime.LibC.CSize
  -> HsBindgen.Runtime.LibC.CSize
  -> BG.Ptr HsBindgen.Runtime.LibC.CSize
  -> IO BG.CBool
hs_bindgen_cb7ffceaa134d628 =
  BG.fromFFIType hs_bindgen_cb7ffceaa134d628_base

-- | [C declaration]: @SDL_size_mul_check_overflow_builtin@, defined at @SDL3\/SDL_stdinc.h 6101:23@
sDL_size_mul_check_overflow_builtin
  :: HsBindgen.Runtime.LibC.CSize
  -- ^ [C declaration]: @a@
  -> HsBindgen.Runtime.LibC.CSize
  -- ^ [C declaration]: @b@
  -> BG.Ptr HsBindgen.Runtime.LibC.CSize
  -- ^ [C declaration]: @ret@
  -> IO BG.CBool
sDL_size_mul_check_overflow_builtin =
  hs_bindgen_cb7ffceaa134d628

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_size_add_check_overflow_builtin@
foreign import ccall safe "hs_bindgen_ca88dcdcdddd2954"
  hs_bindgen_ca88dcdcdddd2954_base
    :: BG.Word64
    -> BG.Word64
    -> BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Stdinc_Safe_SDL_size_add_check_overflow_builtin@
hs_bindgen_ca88dcdcdddd2954
  :: HsBindgen.Runtime.LibC.CSize
  -> HsBindgen.Runtime.LibC.CSize
  -> BG.Ptr HsBindgen.Runtime.LibC.CSize
  -> IO BG.CBool
hs_bindgen_ca88dcdcdddd2954 =
  BG.fromFFIType hs_bindgen_ca88dcdcdddd2954_base

-- | [C declaration]: @SDL_size_add_check_overflow_builtin@, defined at @SDL3\/SDL_stdinc.h 6139:23@
sDL_size_add_check_overflow_builtin
  :: HsBindgen.Runtime.LibC.CSize
  -- ^ [C declaration]: @a@
  -> HsBindgen.Runtime.LibC.CSize
  -- ^ [C declaration]: @b@
  -> BG.Ptr HsBindgen.Runtime.LibC.CSize
  -- ^ [C declaration]: @ret@
  -> IO BG.CBool
sDL_size_add_check_overflow_builtin =
  hs_bindgen_ca88dcdcdddd2954
