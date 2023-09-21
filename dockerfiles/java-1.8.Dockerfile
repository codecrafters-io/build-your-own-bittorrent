FROM maven:3.9.4-eclipse-temurin-8-alpine

COPY pom.xml /app/pom.xml

WORKDIR /app

RUN mkdir -p /app/.m2/
ENV APP_MVN_REPO=/app/.m2

# Download the dependencies
RUN mvn -B --quiet -Dmaven.repo.local=$APP_MVN_REPO dependency:go-offline

# Cache Dependencies
RUN mkdir -p /app-cached
RUN mv -v $APP_MVN_REPO /app-cached/.m2

# Pre-compile steps
ENV MAVEN_OPTS="-Dmaven.repo.local=$APP_MVN_REPO -Ddir=/tmp/codecrafters-bittorrent-target"
RUN echo "cd \${CODECRAFTERS_SUBMISSION_DIR} && mvn -B --quiet package" > /codecrafters-precompile.sh
RUN chmod +x /codecrafters-precompile.sh