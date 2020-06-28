#!/bin/sh
set -e
exec (cd app && mix run --no-halt)
