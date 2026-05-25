FROM alpine:edge

ENV TZ="Asia/Tokyo"
ENV ALPINE="edge"
ENV CUSTOM_REP="http://ap.edge.kernel.org/alpine/"

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

RUN echo "Setting Time Zone to: $TZ"
RUN apk update
RUN apk upgrade || true
RUN apk add --no-cache bash tzdata ca-certificates patch
RUN cp "/usr/share/zoneinfo/$TZ" /etc/localtime
RUN echo "$TZ" > /etc/timezone
RUN update-ca-certificates
RUN patch -u /etc/inputrc -i /etc/inputrc.patch
RUN rm /etc/inputrc.patch
RUN apk del patch
RUN rm -rf /var/cache/apk/*

RUN echo "alias l='ls -lh'" >> /root/.bashrc && \
	echo "alias ll='ls -lAh'" >> /root/.bashrc && \
	echo "alias vim='vi'" >> /root/.bashrc

