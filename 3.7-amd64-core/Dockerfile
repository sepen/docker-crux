# 3.7-amd64-core
# Base variant with all core packages installed

# Stage 1: Build dependencies
FROM sepen/crux:3.7-amd64-setup as builder

RUN install -d -m 0755 -o root -g root /mnt/var/lib/pkg && \
    touch /mnt/var/lib/pkg/db && \
    find /media/crux/core -type f -name '*.pkg.tar.*' -exec pkgadd -r /mnt -f {} \;

# Stage 2: Production image
FROM scratch
COPY --from=builder /mnt /

CMD /usr/bin/crux
