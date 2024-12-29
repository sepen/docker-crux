# 2.6-amd64-setup
# Setup variant, typically used for environment initialization and ready to use as installation media

FROM alpine AS builder

COPY crux-2.6.tar /tmp
COPY rootfs-2.6.tar /tmp

RUN install -d -m 0755 -o root -g root /iso && \
    install -d -m 0755 -o root -g root /rootfs && \
    tar -C /iso -xf /tmp/crux-2.6.tar && \
    tar -C /rootfs -xf /tmp/rootfs-2.6.tar && \
    rm -rf /rootfs/boot /rootfs/lib/firmware /rootfs/lib/modules

FROM scratch
COPY --from=builder /rootfs /
COPY --from=builder /iso /media

RUN install -d -m 0755 /var/lib/pkg && \
    touch /var/lib/pkg/db && \
    find /media/crux -type f -name 'pkgutils#*' | xargs pkgadd -f && \
    find /media/crux -type f -name 'dialog#*' | xargs pkgadd -f

CMD /usr/bin/setup
