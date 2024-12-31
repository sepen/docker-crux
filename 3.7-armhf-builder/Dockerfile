# 3.7-armhf-builder
# Builder variant with necessary packages to build ports and clone git repositories

# Stage 1: Build dependencies
FROM sepen/crux:3.7-armhf-core as builder

RUN ports -u && prt-get depinst fakeroot git

# Stage 2: Production image
FROM scratch
COPY --from=builder /mnt /

CMD /usr/bin/crux