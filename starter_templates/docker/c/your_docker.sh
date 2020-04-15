#!/bin/sh
set -e
tmpFile=$(mktemp)
gcc -lcurl app/*.c -o $tmpFile
exec "$tmpFile" "$@"
