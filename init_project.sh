#!/bin/bash

git submodule update --init
mkdir -p build
source sources/poky/oe-init-build-env build

cp meta-my-layer/conf/local.conf.sample build/conf/local.conf
cp meta-my-layer/conf/bblayers.conf.sample build/conf/bblayers.conf

bitbake-layers add-layer ../sources/meta-raspberrypi
bitbake-layers add-layer ../meta-rp3_custom

TARGET_FILE="./conf/local.conf"
# Write the configuration to the file
cat > "$TARGET_FILE" << 'EOF'
MACHINE ??= "raspberrypi3-64"
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
EXTRA_IMAGE_FEATURES = "ssh-server-dropbear allow-empty-password empty-root-password allow-root-login"
IMAGE_INSTALL += "net-tools"
EOF
