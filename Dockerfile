FROM alpine:edge
# -------------- OS -----------------------
RUN { \
    echo "http://ftp.tsukuba.wide.ad.jp/Linux/alpine/edge/main/" ; \
    echo "http://ftp.tsukuba.wide.ad.jp/Linux/alpine/edge/community/" ; \
    echo "http://dl-cdn.alpinelinux.org/alpine/edge/main" ; \
    echo "http://dl-cdn.alpinelinux.org/alpine/edge/community" ; \
    } >/etc/apk/repositories
RUN apk update && \
	apk upgrade && \
	apk add --no-cache bash tzdata ca-certificates && \
    cp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime && \
    echo "Asia/Tokyo" > /etc/timezone && \
    apk del tzdata && \
    update-ca-certificates && \
    rm -rf /var/cache/apk/*
