# 3.7-arm64
# CRUX for ARMv8 (64-bit architecture)

# Stage 1: Build dependencies
FROM alpine AS builder

COPY crux-arm-3.7-aarch64-rc5.rootfs.tar.xz /tmp

RUN install -d -m 0755 -o root -g root /rootfs && \
    curl -SL -O https://master.dl.sourceforge.net/project/crux-arm/releases/3.7/crux-arm-3.7-aarch64-rc5.rootfs.tar.xz && \
    tar -C /rootfs -xf /tmp/crux-arm-3.7-aarch64-rc5.rootfs.tar.xz && \
    rm -rf /rootfs/boot /rootfs/lib/firmware /rootfs/lib/modules

# Stage 2: Production image
FROM scratch

COPY --from=builder /rootfs /

CMD /usr/bin/crux
