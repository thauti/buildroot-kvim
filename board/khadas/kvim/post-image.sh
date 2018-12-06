#!/bin/sh

BOARD_DIR="$(dirname $0)"
GENIMAGE_CFG="${BOARD_DIR}/genimage.cfg"
GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"

cp ${BOARD_DIR}/boot.ini ${BINARIES_DIR}/
cp ${BINARIES_DIR}/kvim_linux.dtb ${BINARIES_DIR}/dtb.img
mkimage -A arm -O linux -T script -C none -d ${BOARD_DIR}/boot.ini ${BINARIES_DIR}/s905_autoscript

rm -rf "${GENIMAGE_TMP}"

genimage                           \
	--rootpath "${TARGET_DIR}"     \
	--tmppath "${GENIMAGE_TMP}"    \
	--inputpath "${BINARIES_DIR}"  \
	--outputpath "${BINARIES_DIR}" \
	--config "${GENIMAGE_CFG}"

dd if=${BINARIES_DIR}/u-boot.bin.sd.bin of=${BINARIES_DIR}/sdcard.img conv=fsync,notrunc bs=1 count=444
dd if=${BINARIES_DIR}/u-boot.bin.sd.bin of=${BINARIES_DIR}/sdcard.img conv=fsync,notrunc bs=512 skip=1 seek=1
