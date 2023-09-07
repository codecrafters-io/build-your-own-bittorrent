# FROM openjdk:8-jdk

# # RUN curl -s "https://get.sdkman.io" | bash 
# # RUN source ~/.bash_profile
# # RUN y|sdk install jbang

# RUN curl -Ls https://sh.jbang.dev | bash -s - app setup
# RUN echo pwd
# RUN ls
# FROM openjdk:8-jdk
FROM maven:3.9.4-eclipse-temurin-8-focal

COPY pom.xml /app/pom.xml

RUN mkdir /app/src
# RUN echo 'public class init {public static void main(String[] args) {}}' >> /app/src/main/java/init.java

WORKDIR /app
RUN mvn dependency:go-offline

RUN mvn clean

RUN rm -rf /app/src
# what is this and how to use it
# RUN echo "cd \${CODECRAFTERS_SUBMISSION_DIR} && cargo build --release --target-dir=/tmp/codecrafters-bittorrent-target --manifest-path Cargo.toml" > /codecrafters-precompile.sh
# RUN chmod +x /codecrafters-precompile.sh

# RUN curl -s "https://get.sdkman.io" | bash 
# RUN source ~/.bash_profile
# RUN y|sdk install jbang
RUN echo '///usr/bin/env jbang "$0" "$@" ; exit $?' >> init.java
RUN echo '//JAVA 17' >> init.java
RUN echo '//DEPS com.fasterxml.jackson.core:jackson-databind:2.14.2' >> init.java
# RUN echo '//SOURCES **.java' >> init.java
RUN echo 'public class init {public static void main(String[] args) {}}' >> init.java

RUN curl -Ls https://sh.jbang.dev | bash -s - app setup
RUN $HOME/.jbang/bin/jbang --verbose init.java