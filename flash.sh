#!/bin/bash

echo "unmounting the partitions if already present"
if mount | grep /dev/mmcblk0; then
    echo "Unmounting partitions on /dev/mmcblk0"
    sudo umount /dev/mmcblk0*
fi

cp build/tmp/deploy/images/raspberrypi3-64/rpi-test-image-raspberrypi3-64.rootfs.wic.bz2 ./
bunzip2 rpi-test-image-raspberrypi3-64.rootfs.wic.bz2
sudo dd if=rpi-test-image-raspberrypi3-64.rootfs.wic of=/dev/mmcblk0 bs=4M status=progress
sleep 5
rm rpi-test-image-raspberrypi3-64.rootfs.wic
sync
echo "Checking partitions on /dev/mmcblk0..."
sudo fdisk -l /dev/mmcblk0