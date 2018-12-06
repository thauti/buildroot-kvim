Khadas VIM

Note
===============

Working:

- Bootable

Not Tested:

- Wifi
- Ethernet

To do:

- HDMI/Mali support

Intro
=====

This script will generate an booting image from a SD card.

How to build it
===============

  $ make kvim_defconfig

Then you can edit the build options using

  $ make menuconfig

Compile all and build rootfs image:

  $ make

Note: you will need to have access to the network, since Buildroot will
download the packages' sources.

Result of the build
-------------------

Once the build process is finished you will have an image called "sdcard.img"
in the output/images/ directory.

Copy the bootable "sdcard.img" onto an microSD card:

  $ sudo dd if=output/images/sdcard.img of=/dev/sdX bs=8M

Insert the SD Card into your VIM, and power it up. Your new system
should come up now.
