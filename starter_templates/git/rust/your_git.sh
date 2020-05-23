#!/bin/sh
exec cargo run --quiet --manifest-path $(dirname $0)/Cargo.toml "$@"
