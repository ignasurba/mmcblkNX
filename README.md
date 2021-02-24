![mmcblkNX](https://github.com/ignasurba/mmcblkNX/blob/main/images/mmcblkNX.jpg?raw=true)
# mmcblkNX
Hardware eMMC reader capable of reading *Nintendo Switch* raw partitions including **boot0**, **boot1** with rtsx Linux driver.

# About
eMMC chips wear out, and recovery can be tricky.  
Luckily, the Nintendo Switch (except Lite) has a removable eMMC board.  
It is encrypted, but still readable and writable as raw partitions.  
  
When the eMMC fails it often becomes read-only or worse - corrupt.  
I have recovered a couple broken Nintendo this way, it might help you too!

# How it works
Almost any SD card reader can read eMMC chips. However they only access the main partitions.  
After discovering a Realtek card reader with rtsx Linux driver in an old laptop,  
I could read the boot0 and boot1 partitions too.

# Hardware
It is fully open-source reader based on Realtek **RTS5170** card reader and designed in KiCad.  
Uses the same Molex 500913-0302 connector.

# Software
Requires Linux and rtsx drivers to be installed.  
Works out of the box with Ubuntu 20.04.1  
How to build the required drivers for Raspberry Pi 4 is [here](https://github.com/ignasurba/mmcblkNX/blob/main/raspberry4.md).
  
Read and write speed is about 20MB/s. (USB 2.0)

## Usage
```
sudo dd if=/dev/mmcblk0boot0 of=boot0.bin
sudo dd if=/dev/mmcblk0boot1 of=boot1.bin
sudo dd if=/dev/mmcblk0 of=rawnand.bin
```

## Disable read-only mode
```
sudo su
echo 0 > /sys/block/mmcblk0/force_ro
echo 0 > /sys/block/mmcblk0boot0/force_ro
echo 0 > /sys/block/mmcblk0boot1/force_ro
exit
```

# Where can I get one
I made a small batch and they are available on Tindie.  
https://www.tindie.com/products/ignas/emmc-reader-for-nintendo-switch/  
Or feel free to assemble one yourself.

# Disclaimer
It does not decrypt your files or enable piracy of any kind.  
It is created to make recovery possible.  
In full support of the right to repair movement.  
