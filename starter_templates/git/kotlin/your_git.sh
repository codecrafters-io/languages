#!/bin/sh
set -e

tmpFile=$(mktemp tmp.XXXXXXXXXX.jar)
kotlinc "$(dirname $0)/app/main.kt" -include-runtime -d "$tmpFile"
kotlin -classpath "$tmpFile" MainKt "$@"

rm "$tmpFile"
