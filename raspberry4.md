# Steps to build rtsx driver for Raspberry Pi 4
```
sudo apt install git bc bison flex libssl-dev libncurses-dev
rpi-source
cd linux
 
KERNEL=kernel7l
make bcm2711_defconfig
make menuconfig
```
Select:
- CONFIG_MISC_RTSX=m  
- CONFIG_MISC_RTSX_USB=m  
- CONFIG_MMC_REALTEK_USB=m  
```
make modules_prepare
make -C . M=drivers/misc/cardreader
make -C . KBUILD_EXTRA_SYMBOLS=drivers/misc/cardreader/Module.symvers M=drivers/mmc/host
sudo cp drivers/mmc/host/rtsx_usb_sdmmc.ko /lib/modules/$(uname -r)/kernel/drivers/mmc/host/
sudo cp drivers/misc/cardreader/rtsx_usb.ko /lib/modules/$(uname -r)/kernel/drivers/misc/cardreader/
sudo depmod
sudo modprobe rtsx_usb_sdmmc
sudo modprobe rtsx_usb
```
