#!/bin/sh
echo ""
echo "$(date) $0 $@"

apk update
apk fix
apk upgrade -U
apk cache clean
