#!/bin/sh
set -e
mvn -B --quiet package -Ddir=/tmp/codecrafters-bittorrent-target
exec java -jar /tmp/codecrafters-bittorrent-target/kotlin_bittorrent.jar "$@"
