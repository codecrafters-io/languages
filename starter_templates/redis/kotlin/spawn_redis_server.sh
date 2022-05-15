#!/bin/sh
#
# DON'T EDIT THIS!
#
# CodeCrafters uses this file to test your code. Don't make any changes here!
set -e

kotlinc src/main/kotlin/Main.kt -include-runtime -d "$jarFile"
exec kotlin -classpath "$jarFile" MainKt "$@"
