#!/bin/sh
#
# DON'T EDIT THIS!
#
# CodeCrafters uses this file to test your code. Don't make any changes here!
#
# DON'T EDIT THIS!
set -e
mix deps.get
mix compile
mix run -- "$@"
##mix compile > /dev/null
##mix run -- "empty.exs" "$@"