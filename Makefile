ifeq ($(KVERSION),)
	KVERSION := $(shell uname -r)
endif

obj-m := virtual_fb.o

all:
	make -C /lib/modules/$(KVERSION)/build/ M=$(PWD) modules

install: all
	mkdir -p $(DESTDIR)/lib/modules/$(KVERSION)/kernel/drivers/video/fbdev/
	cp virtual_fb.ko $(DESTDIR)/lib/modules/$(KVERSION)/kernel/drivers/video/fbdev/ -f

clean:
	make -C /lib/modules/$(KVERSION)/build/ SUBDIRS=$(PWD) clean

.PHONY: install all clean
