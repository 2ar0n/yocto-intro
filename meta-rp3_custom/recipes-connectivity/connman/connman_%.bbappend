FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI += "file://wifi.config \
            file://settings \
"

do_install:append() {
    install -d ${D}/var/lib/connman

    install -m 0600 ${UNPACKDIR}/settings ${D}/var/lib/connman/
    install -m 0600 ${UNPACKDIR}/wifi.config ${D}/var/lib/connman/
}