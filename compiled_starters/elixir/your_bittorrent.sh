#!/bin/sh
#
set -e

mix local.hex --force
mix deps.get
mix escript.build

./bittorrent "$@"
