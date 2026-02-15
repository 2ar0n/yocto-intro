# Yocto-intro

## Initial setup

Init submodule, create `build` dir then:
```sh
TEMPLATECONF=$PWD/sources/meta-yocto/meta-poky/conf/templates/default source ./sources/openembedded-core/oe-init-build-env build

bitbake-layers add-layer ../sources/meta-raspberrypi
bitbake-layers add-layer ../meta-rp3_custom
```

And update the `conf/local.conf` file with the correct machine.

## Build

Build image with:
```sh
source ./sources/openembedded-core/oe-init-build-env

bitbake rpi-test-image
```
