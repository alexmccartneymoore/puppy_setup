#!/bin/bash

# This script is run from the flash memory puppy

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

# clone the repo
#git clone https://github.com/alexmccartneymoore/puppy_setup.git

# mount the second partition
mkdir /mnt/second_p

mount /dev/mmcblk1p2 /mnt/second_p


# cp or move the config files 
cp /mnt/second_p/puppy_setup/jwmrc-theme ~/.jwm/jwmrc-theme
cp /mnt/second_p/puppy_setup/.jwmrc-tray ~/.jwmrc-tray

# copy the background image
cp /mnt/second_p/puppy_setup/background.jpg /usr/share/backgrounds/background.jpg
# either download image to use 
# or change the background for ROX
#sed -i -e 's/\/.*.jpg/\/Blue.jpg/' /root/Choices/ROX-Filer/PuppyPin
cp /mnt/second_p/puppy_setup/PuppyPin ~/Choices/ROX-Filer/PuppyPin

# reload rox
rox -p /root/Choices/ROX-Filer/PuppyPin
roxfiler -p /root/Choices/ROX-Filer/PuppyPin

# restart jwm
jwm -restart

# remove conky
apt remove conky -y

# remove the startup script that resets the background and conky
rm /root/Startup/conkystart

# unmount the drive
umount /mnt/second_p

# remove the mount dir
#rm -r /mnt/setup

# save puppy session
sh /usr/sbin/savesession-archive

# lshw for hardware details

# Show disk size
fdisk -l /dev/mmcblk1
read -p "Press enter to continue"

# Show disk space on sector
df -h /dev/mmcblk*
read -p "Press enter to continue"

# Show peripherals
lspci



