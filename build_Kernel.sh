#!/bin/bash
#设置环境

# Special Clean For Huawei Kernel.
if [ -d include/config ];
then
    echo "Find config,will remove it"
	rm -rf include/config
else
	echo "No Config,good."
fi


echo " "
echo "***Setting environment...***"
# 交叉编译器路径
export PATH=$PATH:/home/coconutat/Downloads/Github/android_kernel_huawei_hi6250-8_Exp/aarch64-linux-android-4.9/bin
export CROSS_COMPILE=aarch64-linux-android-

export GCC_COLORS=auto
export ARCH=arm64
if [ ! -d "out" ];
then
	mkdir out
fi

date="$(date +%Y.%m.%d-%I:%M)"

# 输入内核版本号
printf "Please enter KernelSU Kernel version number: "
read v
echo " "
echo "Setting EXTRAVERSION"
export EV=EXTRAVERSION=_KSU_V$v

#构建hi6250内核部分
echo "***Building for hi6250 version...***"
make ARCH=arm64 O=out $EV merge_hi6250_KSU_defconfig
# 定义编译线程数
make ARCH=arm64 O=out $EV -j256 2>&1 | tee log-${date}.txt

#打包hi6250版内核

if [ -f out/arch/arm64/boot/Image.gz ];
then
	echo "***Packing hi6250 version kernel...***"
	cp out/arch/arm64/boot/Image.gz Image.gz 
	cp out/arch/arm64/boot/Image.gz tools/AnyKernel2/Image.gz
	cp out/arch/arm64/boot/Image.gz tools/AnyKernel3/Image.gz
	cd tools/AnyKernel2
	zip -r9 hi6250_KSU_V"$v"-${date}.zip * > /dev/null
	cd ../..
	mv tools/AnyKernel2/hi6250_KSU_V"$v"-${date}.zip hi6250_KSU_V"$v"-${date}.zip
	rm -rf tools/AnyKernel2/Image.gz
	cd tools/AnyKernel3
	zip -r9 hi6250_KSU_V"$v"-${date}_AK3.zip * > /dev/null
	cd ../..
	mv tools/AnyKernel3/hi6250_KSU_V"$v"-${date}_AK3.zip hi6250_KSU_V"$v"-${date}_AK3.zip
	rm -rf tools/AnyKernel3/Image.gz
	echo " "
	echo "***Sucessfully built hi6250 version kernel...***"
	echo " "
	exit 0
else
	echo " "
	echo "***Failed!***"
	exit 0
fi