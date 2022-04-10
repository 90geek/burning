include $(SDK_DIR)/burning.mak

LIBS = libch341prog

OBJS = ch341_api.o ch341.o misc.o time_api.o spi_flash.o spi_ids.o spi_ids.o
#===============================================================================
# rules
#===============================================================================
.PHONY: all clean install uninstall

all:	$(LIBS)
	
clean:
	$(AT)rm -rf $(OBJS)
	$(AT)rm -rf $(LIBS).a
	$(AT)rm -rf $(LIBS).so
	$(AT)rm -rf $(DRV_LIB_OUT)/$(LIBS).a
	$(AT)rm -rf $(DRV_LIB_OUT)/$(LIBS).so
	$(AT)rm -rf *~

$(LIBS) : $(OBJS)
ifeq ($(LINK_TYPE), static)
	$(AT)$(AR) -rs $@.a $^
else
	$(AT)$(CC) $^ $(CFLAGS) -shared -o $@.so
endif

install:

uninstall:

