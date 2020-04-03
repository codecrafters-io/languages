#!/bin/sh
set -e
tmpFile=$(mktemp)
go build -o "$tmpFile" app/main.go
exec "$tmpFile" "$@"
