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
currentHash=$(tar -c "$(dirname "$0")/app" | sha1sum)

if [ "$previousHash" != "$currentHash" ]
then
  kotlinc "$(dirname $0)/app/main.kt" -include-runtime -d "$jarFile"
  echo "$currentHash" > "$cacheFile"
fi

exec kotlin -classpath "$jarFile" MainKt "$@"
