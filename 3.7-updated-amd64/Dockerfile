# 3.7-updated-amd64
# Updated variant, which contains patches or updates on top of the base image

FROM sepen/crux:3.7-updated-setup as builder
RUN install -d -m 0755 -o root -g root /mnt/var/lib/pkg && \
    touch /mnt/var/lib/pkg/db && \
    find /media/crux/core -type f -name '*.pkg.tar.*' -exec pkgadd -r /mnt -f {} \;

FROM scratch
COPY --from=builder /mnt /

CMD /usr/bin/crux
