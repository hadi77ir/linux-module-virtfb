ifeq ($(KVERSION),)
	KVERSION := $(shell uname -r)
	KERNELDIR ?= /lib/modules/$(shell uname -r)/build
	PWD := $(shell pwd)
endif

obj-m := virtfb.o
virtfb-objs := virtual_fb.o syscopyarea.o sysfillrect.o sysimgblt.o

all:
	make -C $(KERNELDIR) M=$(PWD) modules

install: all
	mkdir -p $(DESTDIR)/lib/modules/$(KVERSION)/kernel/drivers/video/fbdev/
	cp virtfb.ko $(DESTDIR)/lib/modules/$(KVERSION)/kernel/drivers/video/fbdev/ -f

clean:
	-rm -f *.ko* *.mod *.mod.* *.o modules.order Module.symvers

.PHONY: install all clean
