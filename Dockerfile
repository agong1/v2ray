FROM golang:alpine

RUN  apk add --update git \
 &&  go get -u github.com/v2ray/v2ray-core \
 &&  go install github.com/v2ray/v2ray-core/tools/build \
 &&  $GOPATH/bin/build
    
ENV CONFIG_JSON=... CERT_PEM=none KEY_PEM=none

ADD entrypoint.sh /entrypoint.sh

RUN chgrp -R 0 /go/bin \
    && chmod -R g+rwX /go/bin \
    && chmod +x /entrypoint.sh

ENTRYPOINT  /entrypoint.sh 

EXPOSE 8080