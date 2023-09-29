#!/bin/sh
#
# DON'T EDIT THIS!
#
# CodeCrafters uses this file to test your code. Don't make any changes here!
#
# DON'T EDIT THIS!
set -e
# Check if directory exists
if [! -d "/tmp/codecrafters-bittorrent-target"]; then
  # Download dependencies if it does not exist
  mvn -B --quiet package -Ddir=/tmp/codecrafters-bittorrent-target
fi
exec java -jar /tmp/codecrafters-bittorrent-target/java_bittorrent.jar "$@"
