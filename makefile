#===============================================================================
# export variable
#===============================================================================
include $(SDK_DIR)/burning.mak

#===============================================================================
# local variable
#===============================================================================
SUBDIRS := ch341prog

APP = burning.bin
OBJS = main.o

#===============================================================================
# rules
#===============================================================================
.PHONY: all clean  install uninstall info subdirs libs app
all: subdirs app

app:$(OBJS)
	$(AT)$(CC) $(LDFLAGS) -o $(APP) $(OBJS) $(LIBPATH) ${LIB}

subdirs:
	for dir in $(SUBDIRS);\
	do make -C $$dir all || exit 1;\
	done

.PHONY:clean 
clean:
	for dir in $(SUBDIRS);do make -C $$dir clean||exit 1;done
	-$(AT)rm -f  $(OBJS)
	-$(AT)rm -f $(APP)
	-$(AT)rm -f *~

install:

uninstall:

	
# libs:
	# $(SDK_DIR)/lib/update_lib.sh


