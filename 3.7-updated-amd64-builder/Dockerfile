# 3.7-updated amd64-builder
# Builder variant with the updated version and necessary packages to build ports and clone git repositories

FROM sepen/crux:3.7-updated-amd64-core

RUN ports -u opt && \
    cd /usr/ports/opt/fakeroot && \
    pkgmk -d && pkgadd *.pkg.tar.* && \
    cd /usr/ports/opt/git && \
    pkgmk -d && pkgadd *.pkg.tar.* && \
    rm -rf /usr/ports/*

CMD /usr/bin/crux
