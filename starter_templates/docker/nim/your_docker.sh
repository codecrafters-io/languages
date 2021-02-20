#!/bin/sh
set -e
tmpFile=$(mktemp)
nim compile --verbosity:0 --hints:off --out:"$tmpFile" app/main.nim
exec "$tmpFile" "$@"
