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

