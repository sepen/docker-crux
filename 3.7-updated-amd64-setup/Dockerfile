# 3.7-updated-amd64-setup
# Updated and setup variant, which contains patches or updates on top of the base image

# Stage 1: Build dependencies
FROM alpine AS builder

# file prepared with iso2tar.sh
COPY crux-3.7-updated.tar /tmp

RUN install -d -m 0755 -o root -g root /iso && \
    install -d -m 0755 -o root -g root /rootfs && \
    tar -C /iso -xf /tmp/crux-3.7-updated.tar && \
    tar -C /rootfs -xf /iso/rootfs.tar.xz && \
    rm -rf /iso/boot /iso/rootfs.tar.xz && \
    rm -rf /rootfs/boot /rootfs/lib/firmware /rootfs/lib/modules

# Stage 2: Production image
FROM scratch

COPY --from=builder /rootfs /
COPY --from=builder /iso /media

RUN install -d -m 0755 /var/lib/pkg && \
    touch /var/lib/pkg/db && \
    find /media/crux -type f -name 'pkgutils#*' | xargs pkgadd -f && \
    find /media/crux -type f -name 'dialog#*' | xargs pkgadd -f

CMD /usr/bin/setup
