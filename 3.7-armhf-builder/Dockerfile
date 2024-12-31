# 3.7-armhf-builder
# Builder variant with necessary packages to build ports and clone git repositories

FROM sepen/crux:3.7-armhf-core as builder

RUN ports -u && prt-get depinst fakeroot git

CMD /usr/bin/crux