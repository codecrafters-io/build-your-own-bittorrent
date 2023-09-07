# JAVA SUPPORT with Jar Copy (alpine should also work but no curl so using this right now for easier testing)
FROM openjdk:8-jdk

## MAVEN SUPPORT
# FROM maven:3.9.4-eclipse-temurin-8-focal

# COPY pom.xml /app/pom.xml

# WORKDIR /app
# RUN mvn dependency:go-offline

# RUN mvn clean

# RUN rm -rf /app/src
# what is this and how to use it
# RUN echo "cd \${CODECRAFTERS_SUBMISSION_DIR} && cargo build --release --target-dir=/tmp/codecrafters-bittorrent-target --manifest-path Cargo.toml" > /codecrafters-precompile.sh
# RUN chmod +x /codecrafters-precompile.sh

## JBANG SUPPORT
# RUN echo '///usr/bin/env jbang "$0" "$@" ; exit $?' >> init.java
# RUN echo '//JAVA 17' >> init.java
# RUN echo '//DEPS com.fasterxml.jackson.core:jackson-databind:2.14.2' >> init.java
# RUN echo 'public class init {public static void main(String[] args) {}}' >> init.java

# RUN curl -Ls https://sh.jbang.dev | bash -s - app setup
# RUN $HOME/.jbang/bin/jbang --verbose init.java