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


