#!/bin/bash -e

# check root privileges
if [ $(id -u) -ne 0 ]; then
  echo "ERROR: You must run this script with root privileges"
  exit 1
fi

# we need the iso file parameter
if [ $# -ne 1 ]; then
  echo "Usage: $(basename $0) ISO_FILE"
  exit 0
fi

readonly ISO_FILE=$1

# check iso file
if [ ! -f $ISO_FILE ]; then
  echo "ERROR: File $ISO_FILE not found"
  exit 1
fi

readonly TAR_FILE="$(basename $ISO_FILE .iso).tar"
readonly WORK_DIR=$(pwd)
readonly TMP_DIR=$(mktemp -d)
readonly LOOP_DEVICE=$(losetup -f)

# check if loop device exists
if [ ! -b ${LOOP_DEVICE} ]; then
  echo "ERROR: No available loop devices found"
  exit 1
fi

# mount the image
losetup ${LOOP_DEVICE} ${ISO_FILE}
mount ${LOOP_DEVICE} ${TMP_DIR}

# create tarball
cd ${TMP_DIR} && pwd && ls && tar -cf ${WORK_DIR}/${TAR_FILE} * && cd ${WORK_DIR}

# umount
umount ${TMP_DIR}
losetup -d ${LOOP_DEVICE}

echo "Successfully created ${WORK_DIR}/${ISO_FILE}.tar"
rm -rf ${TMP_DIR}
