# docker-alpine

It will add Japan Alpine repositories and set Japan timezone by default.

You can customize the Time zone by setting the environment variable `TZ`, for example: `TZ="Asia/Tokyo"`.

You can set a custom repository (to use instead of the japanese) by setting the variable: `CUSTOM_REP`, for example:
`CUSTOM_REP=http://ftp.tsukuba.wide.ad.jp/Linux/alpine` (do not include version or repository name, it will be added automatically).
