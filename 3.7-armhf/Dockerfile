# 3.7-armhf
# CRUX for ARMv7 (32-bit architecture)

# Stage 1: Build dependencies
FROM alpine AS builder

RUN apk add curl tar xz

RUN install -d -m 0755 -o root -g root /rootfs && \
    curl -SL -O https://master.dl.sourceforge.net/project/crux-arm/releases/3.7/crux-arm-3.7-rc4.rootfs.tar.xz && \
    tar -C /rootfs -xf crux-arm-3.7-rc4.rootfs.tar.xz && \
    rm -rf /rootfs/boot /rootfs/lib/firmware /rootfs/lib/modules crux-arm-3.7-rc4.rootfs.tar.xz

# Stage 2: Production image
FROM scratch

COPY --from=builder /rootfs /

CMD /usr/bin/crux
