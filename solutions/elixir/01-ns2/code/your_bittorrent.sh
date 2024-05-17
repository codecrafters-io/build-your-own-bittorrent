#!/bin/sh
#
# DON'T EDIT THIS!
#
# CodeCrafters uses this file to test your code. Don't make any changes here!
#
# DON'T EDIT THIS!
set -e

mix local.hex --force
mix deps.get
mix escript.build

./bittorrent "$@"
