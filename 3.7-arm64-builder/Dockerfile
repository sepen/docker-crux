# 3.7-arm64-builder
# Builder variant with necessary packages to build ports and clone git repositories

FROM sepen/crux:3.7-arm64-core

RUN sed -e '/[JOBS,MAKEFLAGS]=/ s/# export/export/' -i /etc/pkgmk.conf && \
    ports -u opt && \
    cd /usr/ports/opt/fakeroot && \
    pkgmk -d && pkgadd *.pkg.tar.* && \
    cd /usr/ports/opt/git && \
    pkgmk -d && pkgadd *.pkg.tar.* && \
    rm -rf /usr/ports/*

CMD /usr/bin/crux