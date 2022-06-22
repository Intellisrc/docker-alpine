FROM alpine:3.14
# -------------- OS -----------------------
RUN { \
    echo "http://ftp.tsukuba.wide.ad.jp/Linux/alpine/v3.14/main/" ; \
    echo "http://ftp.tsukuba.wide.ad.jp/Linux/alpine/v3.14/community/" ; \
    echo "http://dl-cdn.alpinelinux.org/alpine/v3.14/main" ; \
    echo "http://dl-cdn.alpinelinux.org/alpine/v3.14/community" ; \
    } >/etc/apk/repositories
RUN apk add --no-cache bash tzdata ca-certificates && \
    cp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime && \
    echo "Asia/Tokyo" > /etc/timezone && \
    apk del tzdata && \
    update-ca-certificates && \
    rm -rf /var/cache/apk/*
