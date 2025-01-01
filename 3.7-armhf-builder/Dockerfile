# 3.7-armhf-builder
# Builder variant with necessary packages to build ports and clone git repositories

FROM sepen/crux:3.7-armhf-core

RUN ports -u opt && \
    cd /usr/ports/opt/fakeroot && \
    pkgmk -d && pkgadd *.pkg.tar.* && \
    cd /usr/ports/opt/git && \
    pkgmk -d && pkgadd *.pkg.tar.* && \
    rm -rf /usr/ports/*

CMD /usr/bin/crux