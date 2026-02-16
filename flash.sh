#!/bin/bash

echo "unmounting the partitions if already present"
if mount | grep /dev/mmcblk0; then
    echo "Unmounting partitions on /dev/mmcblk0"
    sudo umount /dev/mmcblk0*
fi

machine_name="raspberrypi3-64"
image_name="core-image-full-cmdline"

cp build/tmp/deploy/images/${machine_name}/${image_name}-${machine_name}.rootfs.wic.bz2 ./
bunzip2 ${image_name}-${machine_name}.rootfs.wic.bz2
sudo dd if=${image_name}-${machine_name}.rootfs.wic of=/dev/mmcblk0 bs=4M status=progress
sleep 5
rm ${image_name}-${machine_name}.rootfs.wic
sync
echo "Checking partitions on /dev/mmcblk0..."
sudo fdisk -l /dev/mmcblk0