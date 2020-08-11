#!/bin/sh
#
# DON'T EDIT THIS!
#
# CodeCrafters uses this file to test your code. Don't make any changes here!
#
# DON'T EDIT THIS!
set -e

tmpFile=$(mktemp --suffix=.jar)
kotlinc "$(dirname $0)/app/main.kt" -include-runtime -d "$tmpFile"
exec kotlin -classpath "$tmpFile" MainKt "$@"
