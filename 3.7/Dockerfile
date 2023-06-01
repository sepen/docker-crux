FROM alpine AS builder

WORKDIR /tmp

ARG CRUX_PACKAGES_URL=https://crux.mirror.garr.it/loop/crux/core

RUN wget -q -O - $CRUX_PACKAGES_URL | grep '".*pkg.tar.xz"' | cut -d'"' -f2 > packages.list && \
    while read pkg; do wget -O $(echo $pkg | sed 's|%23|#|') $CRUX_PACKAGES_URL/$pkg; done < packages.list && \
    find -name 'pkgutils*.pkg.tar.xz' | xargs tar xvf && \
    install -d -m 0755 /rootfs/var/lib/pkg && touch /rootfs/var/lib/pkg/db && \
    find -name '*.pkg.tar.xz' | while read pkg; do echo "> Installing $pkg"; /tmp/usr/bin/pkgadd -r /rootfs $pkg; done 

FROM scratch
COPY --from=builder /rootfs ./
