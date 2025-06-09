
ifeq ($(PLATFORM), host)
TOOLCHAIN_DIR = /bin/
else ifeq ($(PLATFORM), mips64el)
TOOLCHAIN_DIR = /home/zhubo/loongson/toolchain/opt/mips-loongson-gcc4.9-linux-gnu/2019.08-05
export TOOLCHAIN_PREFIX = ${TOOLCHAIN_DIR}/bin/mips-linux-gnu-
# else ifeq ($(PLATFORM), mstar)
# TOOLCHAIN_DIR = $(SDK_DIR)/../toolchain/mstar/mips-2014.05
# export TOOLCHAIN_PREFIX = ${TOOLCHAIN_DIR}/bin/mips-linux-gnu
# else 
# $(error PLATFORM not define) 
endif

CC := $(TOOLCHAIN_PREFIX)gcc
CXX := $(TOOLCHAIN_PREFIX)g++
AR=$(TOOLCHAIN_PREFIX)ar
AS=$(TOOLCHAIN_PREFIX)as
LD=$(TOOLCHAIN_PREFIX)ld
CPP=$(TOOLCHAIN_PREFIX)cpp
CC=$(TOOLCHAIN_PREFIX)gcc
NM=$(TOOLCHAIN_PREFIX)nm
STRIP=$(TOOLCHAIN_PREFIX)strip
OBJCOPY=$(TOOLCHAIN_PREFIX)objcopy
OBJDUMP=$(TOOLCHAIN_PREFIX)objdump

#header include
INCLUDEFLAGS := -I$(SDK_DIR)/include

INCLUDEFLAGS += -I$(SDK_DIR)/ch341prog

# Link Type: static / dynamic
LINK_TYPE = static

CFLAGS :=
SUBDIRS := ch341prog
LIBPATH := -L$(SDK_DIR)/ch341prog
LIB :=
#########################################################################
# 
#########################################################################
LIB += -lrt -lm -lpthread -lstdc++ -ldl
LIB += -lch341prog
LIB += -lusb-1.0 -ludev

ifeq ($(PLATFORM), host)
  ifeq ($(uname -m), x86_64)
    LIBPATH += -L$(SDK_DIR)/lib/usb-1.0/x64
  else ifeq ($(uname -m), loongarch64)
    LIBPATH += -L$(SDK_DIR)/lib/usb-1.0/loongarch64
  else
    LIBPATH += -L$(SDK_DIR)/lib/usb-1.0/loongarch64
  endif
endif

CFLAGS += -Wl,--gc-sections  -O0 -g 
CFLAGS += -Wno-implicit-fallthrough

#compile error report
CFLAGS += -Wall -Werror -Wfatal-errors -Wextra -Wno-unused-parameter  \
		-Wno-unused-variable -Wno-unused-function  -Wno-unused-but-set-variable -Wno-sign-compare \
		-Wno-unused-but-set-parameter -Wno-unused-label -Wno-empty-body -Wno-undef 

LDFLAGS = -Wl,--gc-sections -g -Wall ${LIBPATH} 

CFLAGS += $(INCLUDEFLAGS)
ifeq ($(LINK_TYPE), static)

else
CFLAGS += -fPIC
endif	
#########################################################################
# 
########################################################################
%.o: %.c
	$(AT)$(CC) $(CFLAGS)  -c -o $@ $^

%.o: %.cxx
	$(AT)$(CXX) $(CFLAGS) -c -o $@ $^
