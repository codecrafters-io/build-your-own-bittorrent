FROM alpine:3.20

# Add the testing repository
RUN echo "@community http://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories

# Update the package list and install Zig
RUN apk add --no-cache zig@community=0.12.0-r0

RUN printf "cd \${CODECRAFTERS_REPOSITORY_DIR} && zig build-exe ./app/main.zig && sed -i 's/^\(zig .*\)/#\1/' ./your_bittorrent.sh" > /codecrafters-precompile.sh
RUN chmod +x /codecrafters-precompile.sh
