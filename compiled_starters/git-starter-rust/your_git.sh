#!/bin/sh
exec cargo run \
    --quiet \
    --release \
    --target-dir=/tmp/codecrafters-git-target \
    --manifest-path $(dirname $0)/Cargo.toml "$@"
