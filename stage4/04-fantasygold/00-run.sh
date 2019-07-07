#!/bin/sh -e
install -v -o 1000 -g 1000 -d "${ROOTFS_DIR}/home/${FIRST_USER_NAME}/FantasyGold"
install -v -o 1000 -g 1000 -m 755 "${ROOTFS_DIR}/usr/local/bin/FantasyGold" "${ROOTFS_DIR}/home/${FIRST_USER_NAME}/FantasyGold/"
install -v -o 1000 -g 1000 -m 644 "files/splash.png" "${ROOTFS_DIR}/home/${FIRST_USER_NAME}/FantasyGold/"
