#!/bin/sh
set -e
tmpFile=$(mktemp -d)
# javac -sourcepath src/main/java src/main/java/Main.java -d "$tmpFile"
# jar cf java_bittorrent.jar -C "$tmpFile"/ .
# exec java -cp java_bittorrent.jar Main "$@"

JBANG_DEFAULT_JAVA_VERSION=17 $HOME/.jbang/bin/jbang src/main/java/Main.java "$@"