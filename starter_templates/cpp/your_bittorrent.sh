#!/bin/sh
#
# DON'T EDIT THIS!
#
# CodeCrafters uses this file to test your code. Don't make any changes here!
#
# DON'T EDIT THIS!
set -e
cmake $(dirname $0) -B build > /dev/null
cmake --build build > /dev/null
exec ./build/bittorrent "$@"