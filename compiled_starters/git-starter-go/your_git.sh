#!/bin/sh
set -e
tmpFile=$(mktemp)
go build -o "$tmpFile" $(dirname $0)/app/main.go
exec "$tmpFile" "$@"
