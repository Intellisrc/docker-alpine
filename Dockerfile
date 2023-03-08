FROM alpine:edge

# -------------- OS -----------------------
RUN { \
    echo "http://ftp.tsukuba.wide.ad.jp/Linux/alpine/edge/main/" ; \
    echo "http://ftp.tsukuba.wide.ad.jp/Linux/alpine/edge/community/" ; \
    echo "http://ftp.tsukuba.wide.ad.jp/Linux/alpine/edge/testing/" ; \
    echo "http://dl-cdn.alpinelinux.org/alpine/edge/main" ; \
    echo "http://dl-cdn.alpinelinux.org/alpine/edge/community" ; \
    echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing" ; \
    } >/etc/apk/repositories

ENV TZ="Asia/Tokyo"

RUN apk update && \
	apk upgrade && \
	apk add --no-cache bash tzdata ca-certificates && \
    cp "/usr/share/zoneinfo/$TZ" /etc/localtime && \
    echo "$TZ" > /etc/timezone && \
    apk del tzdata && \
    update-ca-certificates && \
    rm -rf /var/cache/apk/*
