# syntax=docker/dockerfile:1.7-labs
FROM mcr.microsoft.com/dotnet/sdk:9.0-alpine

WORKDIR /app

# .git & README.md are unique per-repository. We ignore them on first copy to prevent cache misses
COPY --exclude=.git --exclude=README.md . /app

# This saves nuget packages to ~/.nuget
RUN dotnet build --configuration Release .

# This seems to cause a caching issue with the dotnet build command, where old contents are used
# https://github.com/codecrafters-io/build-your-own-redis/pull/203
# TODO: See if this needs to be brought back?
# RUN rm -rf /app/obj
# RUN rm -rf /app/bin

RUN echo "cd \${CODECRAFTERS_REPOSITORY_DIR} && dotnet build --configuration Release ." > /codecrafters-precompile.sh
RUN chmod +x /codecrafters-precompile.sh

ENV CODECRAFTERS_DEPENDENCY_FILE_PATHS="CodeCrafters.Bittorrent.csproj,CodeCrafters.Bittorrent.sln"
