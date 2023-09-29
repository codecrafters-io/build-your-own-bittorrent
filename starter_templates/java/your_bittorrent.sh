#!/bin/sh
#
# DON'T EDIT THIS!
#
# CodeCrafters uses this file to test your code. Don't make any changes here!
#
# DON'T EDIT THIS!
set -e
FILE_TO_WATCH="./src/main/java/Main.java"
LAST_BUILD_FILE=".last_build_timestamp"

if [[ "$(uname)" == "Darwin" ]]; then
    CURRENT_TIMESTAMP=$(stat -f '%m' "$FILE_TO_WATCH")
else
    CURRENT_TIMESTAMP=$(stat -c '%Y' "$FILE_TO_WATCH")
fi

if [ -f "$LAST_BUILD_FILE" ]; then
    LAST_BUILD_TIMESTAMP=$(cat "$LAST_BUILD_FILE")
else
    LAST_BUILD_TIMESTAMP=0
fi

if [ "$CURRENT_TIMESTAMP" -gt "$LAST_BUILD_TIMESTAMP" ]; then
    mvn -B --quiet package -Ddir=/tmp/codecrafters-bittorrent-target
    echo "$CURRENT_TIMESTAMP" > "$LAST_BUILD_FILE"
fi
exec java -jar /tmp/codecrafters-bittorrent-target/java_bittorrent.jar "$@"
