#!/bin/sh
set -e
tmpFile=$(mktemp)
gcc app/*.c -o $tmpFile
exec "$tmpFile" "$@"
