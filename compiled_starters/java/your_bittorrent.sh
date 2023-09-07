#!/bin/sh
set -e
tmpFile=$(mktemp -d)
# jacksonJar="/home/gitpod/.m2/repository/com/fasterxml/jackson/core/jackson-databind/2.14.2/jackson-databind-2.14.2.jar"
# if [[ ! -r "$jacksonJar" ]]; then
    # echo "Jackson library not found." >&2
    # exit 1
# fi
# classPath="$classPath:$jacksonJar"
# echo $jacksonJar
# echo "-----1"
# javac -cp "/home/gitpod/.m2/repository/com/fasterxml/jackson/core/jackson-core/2.14.2/jackson-core-2.14.2.jar" -sourcepath src/main/java src/main/java/Main.java -d "$tmpFile"
# echo "-----2"
# jar cf java_bittorrent.jar -C "$tmpFile"/ .
# echo 3
# exec java -cp "$classPath" java_bittorrent.jar Main "$@"
# exec java -cp "$classPath" Main "$@"

# Location of JAR used by source code
# com.fasterxml.jackson.core:jackson-databind:2.14.2
jackson="/home/gitpod/.m2/repository/com/fasterxml/jackson/core"
databind="jackson-databind/2.14.2/jackson-databind-2.14.2.jar"
core="jackson-core/2.14.2/jackson-core-2.14.2.jar"
annotations="jackson-annotations/2.14.2/jackson-annotations-2.14.2.jar"

# Source code 
srcDir=src/main/java

# Output classes
outDir="$tmpFile"

# Compile with classpath containing depJar
# "${jackson}\${core}"
# echo "${jackson}/${core}" "${jackson}/${annotations}" "${jackson}/${databind}"
classpath="${jackson}/${core}:${jackson}/${annotations}:${jackson}/${databind}"
# javac -sourcepath $srcDir -d $outDir -cp "$classpath" $srcDir/*.java "$@"
# javac -sourcepath $srcDir -d $outDir -cp "${jackson}/${core}" "${jackson}/${annotations}" "${jackson}/${databind}" $srcDir/*.java
javac -cp "$classpath" -sourcepath src/main/java src/main/java/Main.java -d "$tmpFile"
jar cf java_bittorrent.jar -C "$tmpFile"/ .
exec java -cp "$classpath:java_bittorrent.jar" Main "$@"

# JBANG_DEFAULT_JAVA_VERSION=17 $HOME/.jbang/bin/jbang src/main/java/Main.java "$@"

#!/bin/sh
# set -e
# tmpFile=$(mktemp -d)
# javac -sourcepath src/main/java src/main/java/Main.java -d "$tmpFile"
# jar cf java_redis.jar -C "$tmpFile"/ .
# exec java -cp java_redis.jar Main "$@"
