ifeq ($(KVERSION),)
	KVERSION := $(shell uname -r)
endif

obj-m := virtfb.o

virtfb-objs := virtual_fb.o syscopyarea.o sysfillrect.o sysimgblt.o

all:
	make -C /lib/modules/$(KVERSION)/build/ M=$(PWD) modules

install: all
	mkdir -p $(DESTDIR)/lib/modules/$(KVERSION)/kernel/drivers/video/fbdev/
	cp virtfb.ko $(DESTDIR)/lib/modules/$(KVERSION)/kernel/drivers/video/fbdev/ -f

clean:
	make -C /lib/modules/$(KVERSION)/build/ SUBDIRS=$(PWD) modules_clean

.PHONY: install all clean
