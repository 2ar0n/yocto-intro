# Links

Using LTS scarthgap
https://docs.yoctoproject.org/5.0.15/ref-manual/system-requirements.html#supported-linux-distributions

`bitbake rpi-test-image`

## Docker image clean-up
```sh
docker kill $(docker ps -q)
docker rmi -f $(docker images -aq)
docker container prune -f
docker system df
```

https://meta-raspberrypi.readthedocs.io/en/latest/ipcompliance.html#linux-firmware-rpidistro

## Flash

```sh
echo "unmounting the partitions if already present"
if mount | grep /dev/mmcblk0; then
    echo "Unmounting partitions on /dev/mmcblk0"
    sudo umount /dev/mmcblk0*
fi

cd build/tmp/deploy/images/raspberrypi3
bunzip2 rpi-test-image-raspberrypi3.rootfs.wic.bz2
sudo dd if=rpi-test-image-raspberrypi3.rootfs.wic of=/dev/mmcblk0 bs=4M status=progress
sleep 5
rm rpi-test-image-raspberrypi3.rootfs.wic
sync
echo "Checking partitions on /dev/mmcblk0..."
sudo fdisk -l /dev/mmcblk0
```
