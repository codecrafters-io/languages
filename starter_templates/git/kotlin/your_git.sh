#!/bin/sh
set -e

tmpFile=$(mktemp --suffix=.jar)
kotlinc "$(dirname $0)/app/main.kt" -include-runtime -d "$tmpFile"
exec kotlin -classpath "$tmpFile" MainKt "$@"
