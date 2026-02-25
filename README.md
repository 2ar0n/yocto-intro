# Yocto-intro

## Initial setup

Init submodule, create `build` dir then:
```sh
TEMPLATECONF=$PWD/sources/meta-yocto/meta-poky/conf/templates/default source ./sources/openembedded-core/oe-init-build-env build

bitbake-layers add-layer ../sources/meta-raspberrypi
bitbake-layers add-layer ../meta-rp3_custom
```

And update the `conf/local.conf` file with the correct machine and distro name.

## Build

Build image with:
```sh
source ./sources/openembedded-core/oe-init-build-env

bitbake core-image-minimal
```

# TODO:
- [x] Create Yocto distro which connects to network
- [ ] Update .dtb to include DAC on SPI bus
- [ ] Write kernel driver for DAC