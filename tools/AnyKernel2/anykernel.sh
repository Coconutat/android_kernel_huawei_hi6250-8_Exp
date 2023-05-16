# AnyKernel2 Ramdisk Mod Script
# osm0sis @ xda-developers

## AnyKernel setup
# begin properties
properties() {
kernel.string="KernelSU for Huawei Nova 2 by Coconutat"
do.devicecheck=0
do.modules=0
do.cleanup=1
do.cleanuponabort=1
device.name1=
device.name2=
} # end properties

## AnyKernel methods (DO NOT CHANGE)
# import patching functions/variables - see for reference
. /tmp/anykernel/tools/ak2-core.sh;



# shell variables
block=/dev/block/bootdevice/by-name/ramdisk;
is_slot_device=auto;
ramdisk_compression=auto;


## AnyKernel ramdisk install

ui_print "------------Installing KernelSU Kernel------------";
ui_print "---------KernelSU integrate By Coconutat----------";
ui_print "-----------------加油华为，加油中国！-----------------";


dump_boot;

write_boot;

## end install


# shell variables
block=/dev/block/bootdevice/by-name/kernel;
ramdisk_compression=auto;

# reset for kernel patching
reset_ak;
mv /tmp/anykernel/Image.gz /tmp/anykernel/Image.gz;


## AnyKernel kernel install

ui_print "Done!"
split_boot;

flash_boot;

## end install
