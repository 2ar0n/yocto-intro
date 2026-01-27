# Links

Using LTS scarthgap
https://docs.yoctoproject.org/5.0.15/ref-manual/system-requirements.html#supported-linux-distributions


## Docker image clean-up
```
docker kill $(docker ps -q)
docker rmi -f $(docker images -aq)
docker container prune -f
docker system df
```

```
  /workspaces/yocto-intro/meta-rp3_custom \
```

```
MACHINE ??= "raspberrypi3"
DISTRO ?= "poky"
PACKAGE_CLASSES ?= "package_ipk"
SDKMACHINE ?= "x86_64"
EXTRA_IMAGE_FEATURES ?= "debug-tweaks"
PATCHRESOLVE = "noop"
BB_DISKMON_DIRS = "\
    STOPTASKS,${TMPDIR},1G,100K \
    STOPTASKS,${DL_DIR},1G,100K \
    STOPTASKS,${SSTATE_DIR},1G,100K \
    STOPTASKS,/tmp,100M,100K \
    ABORT,${TMPDIR},100M,1K \
    ABORT,${DL_DIR},100M,1K \
    ABORT,${SSTATE_DIR},100M,1K \
    ABORT,/tmp,10M,1K"
LICENSE_FLAGS_ACCEPTED = "synaptics-killswitch"
```

https://meta-raspberrypi.readthedocs.io/en/latest/ipcompliance.html#linux-firmware-rpidistro
