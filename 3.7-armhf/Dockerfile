# 3.7-armhf/Dockefile

FROM alpine AS builder
COPY crux-arm-3.7-rc4.rootfs.tar.xz /tmp
RUN install -d -m 0755 -o root -g root /rootfs && \
    tar -C /rootfs -xf /tmp/crux-arm-3.7-rc4.rootfs.tar.xz && \
    rm -rf /rootfs/boot /rootfs/lib/firmware /rootfs/lib/modules

FROM scratch
COPY --from=builder /rootfs /

CMD /usr/bin/crux
