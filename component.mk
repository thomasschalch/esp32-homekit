COMPONENT_SRCDIRS := src
COMPONENT_ADD_INCLUDEDIRS := include
COMPONENT_PRIV_INCLUDEDIRS := wolfssl src

HOMEKIT_OBJS := $(patsubst %.c,%.o,$(wildcard $(COMPONENT_PATH)/src/*.c))
HOMEKIT_OBJS := $(patsubst $(COMPONENT_PATH)/%,%,$(HOMEKIT_OBJS))

COMPONENT_OBJS := $(HOMEKIT_OBJS)

WOLFSSL_SETTINGS =        \
	-DHAVE_ED25519_KEY_EXPORT\
	-DHAVE_ED25519_KEY_IMPORT\
    -DHAVE_OCSP           \
    -DHAVE_SNI            \
    -DTIME_OVERRIDES      \
    -DNO_DES              \
    -DNO_STDIO_FILESYSTEM \
    -DNO_WOLFSSL_DIR      \
    -DWOLFSSL_STATIC_RSA  \
    -DWOLFSSL_IAR_ARM     \
    -DNDEBUG              \
    -DHAVE_CERTIFICATE_STATUS_REQUEST \
    -DCUSTOM_RAND_GENERATE_SEED=os_get_random

CFLAGS = \
    -fstrict-volatile-bitfields \
    -ffunction-sections         \
    -fdata-sections             \
    -mlongcalls                 \
    -nostdlib                   \
    -ggdb                       \
    -Os                         \
    -DNDEBUG                    \
    -std=gnu99                  \
    -Wno-old-style-declaration  
