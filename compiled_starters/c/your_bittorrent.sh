#!/bin/sh
set -e
tmpFile=$(mktemp)
gcc -lcurl -lcrypto app/*.c -o $tmpFile
exec "$tmpFile" "$@"
