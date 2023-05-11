FROM alpine:edge

ENV TZ="Asia/Tokyo"
ENV ALPINE="edge"
ENV CUSTOM_REP="http://ftp.tsukuba.wide.ad.jp/Linux/alpine"

# -------------- OS -----------------------
RUN { \
    echo "$CUSTOM_REP/$ALPINE/main/" ; \
    echo "$CUSTOM_REP/$ALPINE/community/" ; \
    echo "$CUSTOM_REP/$ALPINE/testing/" ; \
    echo "http://dl-cdn.alpinelinux.org/alpine/$ALPINE/main" ; \
    echo "http://dl-cdn.alpinelinux.org/alpine/$ALPINE/community" ; \
    echo "http://dl-cdn.alpinelinux.org/alpine/$ALPINE/testing" ; \
    } >/etc/apk/repositories

COPY inputrc.patch /etc/inputrc.patch

RUN echo "Setting Time Zone to: $TZ" && \
	apk update && \
	apk upgrade && \
	apk add --no-cache bash tzdata ca-certificates patch && \
    cp "/usr/share/zoneinfo/$TZ" /etc/localtime && \
    echo "$TZ" > /etc/timezone && \
    update-ca-certificates && \
	patch -u /etc/inputrc -i /etc/inputrc.patch && \
	rm /etc/inputrc.patch && \
	apk del patch && \
    rm -rf /var/cache/apk/*

RUN echo "alias l='ls -lh'" >> /root/.bashrc && \
	echo "alias ll='ls -lAh'" >> /root/.bashrc && \
	echo "alias vim='vi'" >> /root/.bashrc

