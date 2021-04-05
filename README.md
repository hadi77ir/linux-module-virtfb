# Linux Virtual Framebuffer Device Driver

This is the `drivers/video/fbdev/vfb.c` kernel module, turned into a kernel module.

This is a 'virtual' frame buffer device. It operates on a chunk of unswappable kernel memory instead of on the memory of a graphics board. This means you cannot see any output sent to this frame buffer device without reading it using tools like `ffplay`, while it does consume precious memory. The main use of this frame buffer device is testing and debugging the frame buffer subsystem and improving Embedded Linux application development.

Do NOT enable it for normal systems! To protect the innocent, it has to be enabled explicitly at boot time using the kernel option `video=virtfb:`.

## Building

```
git clone https://github.com/hadi77ir/linux-module-virtfb.git
make all
```

## Installation

```
sudo make install
```

To load and enable the module, you should run the following command:

```
sudo modprobe virtfb vfb_enable=1
```

You can use additional parameters to set resolution and the size of video memory (in bytes).

```
videomemorysize=2097152 mode_option=640x480-8@60
```

## License

GPLv2
