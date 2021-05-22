#!/bin/sh
#
# DON'T EDIT THIS!
#
# CodeCrafters uses this file to test your code. Don't make any changes here!
#
# DON'T EDIT THIS!
set -e

mkdir -p "$HOME/.cache"
cacheFile="$HOME/.cache/codecrafters-git-kotlin-hash"
jarFile="$HOME/.cache/codecrafters-git-kotlin.jar"

# Kotlin doesn't do incremental compilation, so let's hack this in ourselves.
previousHash=$(cat "$cacheFile" 2>/dev/null || echo '')
currentHash=$(tar -cP "$(dirname "$0")/app" | openssl sha1)

if [ "$previousHash" != "$currentHash" ]
then
  # The JAVA_OPTS here prevents a warning on 1.4, see: https://youtrack.jetbrains.com/issue/KT-43704#focus=Comments-27-4625141.0-0
  JAVA_OPTS="--add-opens java.base/java.util=ALL-UNNAMED" kotlinc "$(dirname $0)/app/main.kt" -include-runtime -d "$jarFile"
  echo "$currentHash" > "$cacheFile"
fi

exec kotlin -classpath "$jarFile" MainKt "$@"
