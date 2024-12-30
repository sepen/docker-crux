#!/bin/bash -e

readonly ISO2TAR_CMD="./iso2tar.sh"
readonly CURL_CMD="curl -SL -O"

# we need the version parameter and folder destination
if [ $# -ne 2 ]; then
  echo "Usage: $(basename $0) VERSION FOLDER"
  exit 0
fi

readonly VERSION=$1
readonly FOLDER=$2

if [ ! -d $FOLDER ]; then
  echo "ERROR: Folder $FOLDER doesn't exists"
  exit 1
fi

cd "$FOLDER"

case $VERSION in
  3.7-updated|3.7-updated-amd64)
    $CURL_CMD https://crux.ninja/updated-iso/crux-3.7-updated.iso
    sudo $ISO2TAR_CMD crux-3.7-updated.iso
    ;;
  3.7|3.7-amd64)
    $CURL_CMD http://ftp.spline.inf.fu-berlin.de/pub/crux/crux-3.7/iso/crux-3.7.iso
    sudo $ISO2TAR_CMD crux-3.7.iso
    ;;
  2.6|2.6-amd64)
    $CURL_CMD http://ftp.spline.inf.fu-berlin.de/pub/crux/crux-2.6/iso/crux-2.6.iso
		sudo $ISO2TAR_CMD crux-2.6.iso && \
		  mkdir tmp && \
		  tar -C tmp -xf crux-2.6.tar && \
		  tmp/tools/unsquashfs -d rootfs tmp/crux.squashfs 2>/dev/null && \
		  cd rootfs && tar cf ../rootfs-2.6.tar * && cd .. && \
	    rm -r tmp rootfs
    ;;
  *)
    echo "Nothing to do ($VERSION)"
    ;;
esac

exit 0