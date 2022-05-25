#!/bin/sh
#
# DON'T EDIT THIS!
#
# CodeCrafters uses this file to test your code. Don't make any changes here!
#
# DON'T EDIT THIS!
set -e

# mv /app-cached/build $(dirname $0)/build

exec $(dirname $0)/gradlew --project-dir $(dirname $0) --project-cache-dir ~/.gradle/codecrafters-git --stacktrace --console plain run
