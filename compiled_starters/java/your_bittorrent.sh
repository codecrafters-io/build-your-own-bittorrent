#!/bin/sh
set -e
tmpFile=$(mktemp -d)

databind="jars/jackson-databind-2.14.2.jar"
core="jars/jackson-core-2.14.2.jar"
annotations="jars/jackson-annotations-2.14.2.jar"

classpath="${core}:/${annotations}:/${databind}"

javac -classpath "$classpath" -sourcepath src/main/java src/main/java/Main.java -d "$tmpFile"
jar cf java_bittorrent.jar -C "$tmpFile"/ .
exec java -cp "$classpath:java_bittorrent.jar" Main "$@"