#!/bin/bash -e

readonly BASE_DIR=$(cd $(dirname $0) && pwd)

if [ $# -ne 1 ]; then
  echo "Usage: $(basename $0) FOLDER"
  exit 0
fi
FOLDER="$1"

# Get extra tags from symlinks
find $BASE_DIR -type l -exec basename {} \; | while read symlink; do
  target_dir=$(basename $(readlink -f $symlink))
  case ${target_dir} in
    ${FOLDER}) echo -ne "-t sepen/crux:${symlink}" ;;
  esac
done
