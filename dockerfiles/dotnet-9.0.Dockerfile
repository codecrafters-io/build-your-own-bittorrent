FROM mcr.microsoft.com/dotnet/sdk:9.0-alpine

COPY codecrafters-bittorrent.csproj /app/codecrafters-bittorrent.csproj
COPY codecrafters-bittorrent.sln /app/codecrafters-bittorrent.sln

RUN mkdir /app/src
RUN (echo 'System.Console.WriteLine("If you are seeing this, there is something wrong with our caching mechanism! Please contact us at hello@codecrafters.io.");' > /app/src/Program.cs) > /dev/null

WORKDIR /app

# This saves nuget packages to ~/.nuget
RUN dotnet build --configuration Release .

# Overwrite Program.cs to remove the echoed line
RUN rm /app/src/Program.cs

# This seems to cause a caching issue with the dotnet build command, where contents from the removed /src/Program.cs are used
RUN rm -rf /app/obj
RUN rm -rf /app/bin

RUN echo "cd \${CODECRAFTERS_REPOSITORY_DIR} && dotnet build --configuration Release ." > /codecrafters-precompile.sh
RUN chmod +x /codecrafters-precompile.sh

ENV CODECRAFTERS_DEPENDENCY_FILE_PATHS="codecrafters-bittorrent.csproj,codecrafters-bittorrent.sln"
