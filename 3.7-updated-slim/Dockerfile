# 3.7-updated-slim/Dockerfile

FROM sepen/crux:3.7-updated as builder

RUN ports -u && prt-get remove \
  autoconf automake cmake dhcpcd e2fsprogs eudev exim hdparm iptables \
  kmod make man-pages meson mlocate nftables ninja patch pciutils python3 \
  python3-setuptools rdate sqlite3 start-stop-daemon sudo sysklogd sysvinit \
  usbutils vim && \
  rm -rf /mnt /boot 

FROM scratch
COPY --from=builder / /

CMD /usr/bin/crux
