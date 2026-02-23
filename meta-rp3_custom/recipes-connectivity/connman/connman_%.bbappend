FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI += "file://Bowling2000.config"

do_install:append() {
    install -d ${D}/var/lib/connman
    install -m 0600 ${UNPACKDIR}/Bowling2000.config ${D}/var/lib/connman/
}