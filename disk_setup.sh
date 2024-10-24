#!/bin/bash

# This script runs from the usb puppy 

# set the system clock
ntpdate ntp.ubuntu.com

# set the hardware clock
hwclock --systohc

# refresh the apt lists
rm -vf /var/lib/apt/lists/*

# update the repos
apt update

# autoremove any un-needed libraries
apt autoremove


# make a mount directory
#mkdir /mnt/setup
# mount the usb
#mount /dev/sda1 /mnt/setup

# partition the disk

# unmount any mount points
umount /dev/mmcblk1*

# install sfdisk 
apt install fdisk -y

sfdisk /dev/mmcblk1 < /mnt/setup/puppy_setup/disk_table.sfdisk

# make the file systems

mkfs.fat -F 32 /dev/mmcblk1p1
mkfs.ext4 /dev/mmcblk1p2

# mount the second partition
mkdir /mnt/second_p

mount /dev/mmcblk1p2 /mnt/second_p

# copy the config from the mounted usb
cp -r /mnt/setup/puppy_setup /mnt/second_p

## Not necessary
# mount the boot partition
#mkdir /mnt/boot_drive
#mount /dev/mmcblk1p1 /mnt/boot_drive

# backup the original EFI boot files

# copy the EFI boot files


# unmount the drives -- won't work
# umount /mnt/setup
# umount /mnt/second_p

# remove the mount dir -- necessary?
#rm -r /mnt/setup
#rm -r /mnt/second_p

# Show disk size
fdisk -l /dev/mmcblk1p2
read -p "Press enter to continue"

# Show disk space on sector
df -h /dev/mmcblk*
read -p "Press enter to continue"

# Show peripherals
lspci
read -p "Press enter to continue"

# run the frugal pup installer
sh /usr/sbin/frugalpup-installers



