#!/bin/bash
ver=$(grep "FROM" ./Dockerfile | awk -F':' '{ print $2 }')
if [[ $ver == "" ]]; then
	echo "Version not found"
	exit
fi
echo "VERSION: $ver"
docker build -t alpine .
docker tag alpine:latest intellisrc/alpine:$ver
docker push intellisrc/alpine:$ver
