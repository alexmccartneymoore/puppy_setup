#!/bin/bash

# This script runs from the usb puppy 

# make a mount directory
mkdir /mnt/setup
# mount the usb
mount /dev/sda1 /mnt/setup

# partition the disk

# install sfdisk 
apt install fdisk -y

sfdisk /dev/mmcblk < /mnt/setup/disk_table.sfdisk

# mount the second partition
mkdir /mnt/second_p

mount /dev/mmcblk1p2 /mnt/second_p

# copy the config from the mounted usb
cp -r /mnt/setup/puppy_setup /mnt/second_p

# unmount the drives
umount /mnt/setup
umount /mnt/second_p

# remove the mount dir -- necessary?
#rm -r /mnt/setup
#rm -r /mnt/second_p

# Show disk size
fdisk -l /dev/mmcblk*

# Show disk space on sector
df -h /dev/mmcblk*

# Show peripherals
lspci



