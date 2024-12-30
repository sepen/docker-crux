# 3.7-amd64-slim
# Base image with a minimal set of packages

# Stage 1: Build dependencies
FROM sepen/crux:3.7 as builder

RUN prt-get remove --no-std-config \
  autoconf automake cmake dhcpcd e2fsprogs eudev exim hdparm iptables \
  kmod make man-pages meson mlocate nftables ninja patch pciutils python3 \
  python3-setuptools rdate sqlite3 start-stop-daemon sudo sysklogd sysvinit \
  usbutils vim && \
  rm -rf /mnt /boot 

get# Stage 2: Production image
FROM scratch
COPY --from=builder / /

CMD /usr/bin/crux
