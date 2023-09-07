# JAVA SUPPORT with Jar Copy (alpine should also work but no curl so using this right now for easier testing)
# FROM openjdk:8-jdk

## MAVEN SUPPORT
FROM maven:3.9.4-eclipse-temurin-8-alpine

COPY pom.xml /app/pom.xml

WORKDIR /app

RUN mkdir -p /app/.m2/
ENV APP_MVN_REPO=/app/.m2

# downloads the dependencies
RUN mvn -B --quiet -Dmaven.repo.local=$APP_MVN_REPO dependency:go-offline

# Cache MAVEN Dependencies
RUN mkdir -p /app-cached
RUN mv -v $APP_MVN_REPO /app-cached/.m2

# Pre-compile jar to directly run
ENV MAVEN_OPTS="-Dmaven.repo.local=$APP_MVN_REPO -Ddir=/tmp/codecrafters-bittorrent-target"
RUN echo "cd \${CODECRAFTERS_SUBMISSION_DIR} && mvn -B --quiet package " > /codecrafters-precompile.sh
RUN chmod +x /codecrafters-precompile.sh

# RUN rm -rf /app

## JBANG SUPPORT
# RUN echo '///usr/bin/env jbang "$0" "$@" ; exit $?' >> init.java
# RUN echo '//JAVA 17' >> init.java
# RUN echo '//DEPS com.fasterxml.jackson.core:jackson-databind:2.14.2' >> init.java
# RUN echo 'public class init {public static void main(String[] args) {}}' >> init.java

# RUN curl -Ls https://sh.jbang.dev | bash -s - app setup
# RUN $HOME/.jbang/bin/jbang --verbose init.java
