#!/bin/bash -e

readonly BASE_DIR=$(cd $(dirname $0) && pwd)
readonly ISO2TAR_CMD="$BASE_DIR/iso2tar.sh"
readonly CURL_CMD="curl -SL -O"

# we need the version parameter and folder destination
if [ $# -ne 2 ]; then
  echo "Usage: $(basename $0) FOLDER"
  exit 0
fi

readonly FOLDER=$1

if [ ! -d $FOLDER ]; then
  echo "ERROR: Folder $FOLDER doesn't exists"
  exit 1
fi

cd "$FOLDER"
echo "Preparing files for $FOLDER"

case $FOLDER in
  3.7-updated-amd64)
    $CURL_CMD https://crux.ninja/updated-iso/crux-3.7-updated.iso
    sudo $ISO2TAR_CMD crux-3.7-updated.iso
    ;;
  3.7-amd64)
    $CURL_CMD http://ftp.spline.inf.fu-berlin.de/pub/crux/crux-3.7/iso/crux-3.7.iso
    sudo $ISO2TAR_CMD crux-3.7.iso
    ;;
  3.7-arm64)
    $CURL_CMD https://master.dl.sourceforge.net/project/crux-arm/releases/3.7/crux-arm-3.7-aarch64-rc5.rootfs.tar.xz
    ;;
  3.7-armhf)
    $CURL_CMD https://master.dl.sourceforge.net/project/crux-arm/releases/3.7/crux-arm-3.7-rc4.rootfs.tar.xz
    ;;
  2.6-amd64)
    $CURL_CMD http://ftp.spline.inf.fu-berlin.de/pub/crux/crux-2.6/iso/crux-2.6.iso
    sudo $ISO2TAR_CMD crux-2.6.iso && \
      mkdir tmp && \
      tar -C tmp -xf crux-2.6.tar && \
      tmp/tools/unsquashfs -d rootfs tmp/crux.squashfs 2>/dev/null && \
      cd rootfs && tar cf ../rootfs-2.6.tar * && cd .. && \
      rm -r tmp rootfs
    ;;
  *)
    echo "Nothing to do ($FOLDER)"
    ;;
esac

exit 0
