lib_LIBRARIES = libflip.a

include_HEADERS = flip.h flip_interface.h flip_isfunc.h

built_SOURCE = flip_config.h

CFLAGS += -O2

if FLIP_FAST_VERSION
libflip_a_SOURCES = flip.c interface.c fadd.c fsub.c fmul.c\
  sqr.c fma.c fms.c fdiv_fast.c fsqrt_fast.c reciprocal.c invsqrt.c
else
libflip_a_SOURCES = flip.c interface.c fadd.c fsub.c fmul.c\
 fdiv.c fsqrt.c
endif

EXTRA_libflip_a_SOURCES = sqr.c fma.c fms.c fdiv.c fsqrt.c\
 fdiv_fast.c fsqrt_fast.c reciprocal.c invsqrt.c

EXTRA_DIST = internal/internal.h internal/misc.h internal/product.h internal/rounding.h
