#!/bin/sh
set -e

test -d /app-cached && mv /app-cached/* /app

exec /tester/test.sh
