#!/bin/sh
#
exec cargo run \
    --quiet \
    --release \
    --target-dir=/tmp/codecrafters-bittorrent-target \
    --manifest-path $(dirname "$0")/Cargo.toml -- "$@"
