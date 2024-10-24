# Install to Wyse 3040

## Using setup scripts on usb

Make a mount directory
```
mkdir /mnt/setup
```
Mount the usb
```
mount /dev/sda1 /mnt/setup
```

Run the disk setup script
```
sh /mnt/setup/puppy_setup/disk_setup.sh
```

The GUI for the frugal install should load.

Select the "DiskPup" option.

Select "directory".

Then select /mnt/sda1 (the usb you're using)

Select mmcblk1p2 as the partition to contain puppy

Select mmcblk1p1 as the boot partition

Once the installer has finished, reboot and remove the USB.

Select Save Session?

### After Reboot

Run the setup file by clicking on the mmcblk1p2 drive (or you can mount it using the cli)

Right click -> Window -> Terminal here (or F4)

```
./setup.sh
```




