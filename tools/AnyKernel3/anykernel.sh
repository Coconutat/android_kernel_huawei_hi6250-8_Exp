### AnyKernel3 Ramdisk Mod Script
## osm0sis @ xda-developers

### AnyKernel setup
# begin properties
properties() { '
kernel.string=Huawei Nova2 KSU kernel by Coconutat
do.devicecheck=0
do.modules=0
do.systemless=0
do.cleanup=1
do.cleanuponabort=0
ramdisk_compression=auto
'; } # end properties

### AnyKernel install
ui_print "Huawei Nova2 KSU kernel by Coconutat";
ui_print "Install...";
# 设置变量
block=/dev/block/bootdevice/by-name/ramdisk
ramdisk_compression=auto;

# import functions/variables and setup patching - see for reference (DO NOT REMOVE)
. tools/ak3-core.sh

# shell variables
block=/dev/block/bootdevice/by-name/kernel;
ramdisk_compression=auto;

ui_print "------------Installing KernelSU Kernel------------";
ui_print "---------KernelSU integrate By Coconutat----------";
ui_print "-----------------加油华为，加油中国！-----------------";

# reset for kernel patching
reset_ak;
mv /tmp/anykernel/kernel-Image.gz /tmp/anykernel/Image.gz;


## AnyKernel kernel install

split_boot;

flash_boot;

## end install




