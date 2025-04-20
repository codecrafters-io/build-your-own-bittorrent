#!/bin/sh
set -e
zig build-exe ./app/main.zig
./main "$@"
