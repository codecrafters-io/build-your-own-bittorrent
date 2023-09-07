#!/bin/sh
set -e
# tmpFile=$(mktemp -d)

## Java with Jar COPY Support
# databind="jars/jackson-databind-2.14.2.jar"
# core="jars/jackson-core-2.14.2.jar"
# annotations="jars/jackson-annotations-2.14.2.jar"
# gson="jars/gson-2.10.1.jar"

# classpath="${core}:${annotations}:${databind}:${gson}"

# javac -classpath "$classpath" -sourcepath src/main/java src/main/java/Main.java -d "$tmpFile"
# jar cf java_bittorrent.jar -C "$tmpFile"/ .
# exec java -cp "$classpath:java_bittorrent.jar" Main "$@"

## MAVEN SUPPORT
# mvn package -Ddir="$tmpFile"
# exec java -jar "$tmpFile"/java_bittorrent.jar "$@"
exec java -jar /tmp/codecrafters-bittorrent-target/java_bittorrent.jar "$@"

## JBANG SUPPORT
# JBANG_DEFAULT_JAVA_VERSION=17 $HOME/.jbang/bin/jbang src/main/java/Main.java "$@"
