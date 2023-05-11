FROM alpine:3.17

ENV TZ="Asia/Tokyo"
ENV ALPINE="v3.17"
ENV CUSTOM_REP="http://ftp.tsukuba.wide.ad.jp/Linux/alpine"

# -------------- OS -----------------------
RUN { \
    echo "$CUSTOM_REP/$ALPINE/main/" ; \
    echo "$CUSTOM_REP/$ALPINE/community/" ; \
    echo "http://dl-cdn.alpinelinux.org/alpine/$ALPINE/main" ; \
    echo "http://dl-cdn.alpinelinux.org/alpine/$ALPINE/community" ; \
    } >/etc/apk/repositories

RUN echo "Setting Time Zone to: $TZ" && \
    apk update && \
    apk upgrade && \
    apk add --no-cache bash tzdata ca-certificates && \
    cp "/usr/share/zoneinfo/$TZ" /etc/localtime && \
    echo "$TZ" > /etc/timezone && \
    update-ca-certificates && \
    rm -rf /var/cache/apk/*
