#!/bin/sh
set -e

exec java -jar /tmp/codecrafters-bittorrent-target/java_bittorrent.jar "$@"