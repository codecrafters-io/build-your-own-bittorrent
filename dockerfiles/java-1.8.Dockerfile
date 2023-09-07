# JAVA SUPPORT with Jar Copy (alpine should also work but no curl so using this right now for easier testing)
# FROM openjdk:8-jdk

## MAVEN SUPPORT
FROM maven:3.9.4-eclipse-temurin-8-focal

COPY pom.xml /app/pom.xml

WORKDIR /app

RUN mkdir -p .m2
# ENV M2_HOME=/app/.m2
ENV M2_REPO=/app/.m2
RUN ls -alh /app/.m2

# downloads the dependencies
RUN mvn dependency:go-offline
RUN ls -alh /app/.m2

RUN mvn clean

RUN rm -rf /app

RUN echo "cd \${CODECRAFTERS_SUBMISSION_DIR} && mvn package -Ddir=/tmp/codecrafters-bittorrent-target" > /codecrafters-precompile.sh
RUN chmod +x /codecrafters-precompile.sh

# RUN mkdir -p /app-cached
# RUN cp -r /app/.m2/* /app-cached/.m2

## JBANG SUPPORT
# RUN echo '///usr/bin/env jbang "$0" "$@" ; exit $?' >> init.java
# RUN echo '//JAVA 17' >> init.java
# RUN echo '//DEPS com.fasterxml.jackson.core:jackson-databind:2.14.2' >> init.java
# RUN echo 'public class init {public static void main(String[] args) {}}' >> init.java

# RUN curl -Ls https://sh.jbang.dev | bash -s - app setup
# RUN $HOME/.jbang/bin/jbang --verbose init.java