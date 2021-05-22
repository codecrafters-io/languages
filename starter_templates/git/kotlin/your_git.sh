#!/bin/sh
#
# DON'T EDIT THIS!
#
# CodeCrafters uses this file to test your code. Don't make any changes here!
#
# DON'T EDIT THIS!
set -e

tmpFile=$(mktemp)

# The JAVA_OPTS here prevents a warning on 1.4, see: https://youtrack.jetbrains.com/issue/KT-43704#focus=Comments-27-4625141.0-0
JAVA_OPTS="--add-opens java.base/java.util=ALL-UNNAMED" kotlinc "$(dirname $0)/app/main.kt" -include-runtime -d "${tmpFile}.jar"

exec kotlin -classpath "${tmpFile}.jar" MainKt "$@"
