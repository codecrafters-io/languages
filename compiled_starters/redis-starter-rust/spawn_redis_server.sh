#!/bin/sh
#
# DON'T EDIT THIS!
#
# CodeCrafters uses this file to test your code. Don't make any changes here!
#
# DON'T EDIT THIS!
exec cargo run \
    --quiet \
    --release \
    --target-dir=/tmp/codecrafters-git-target \
    --manifest-path $(dirname $0)/Cargo.toml "$@"
