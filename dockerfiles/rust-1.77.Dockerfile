# syntax=docker/dockerfile:1.7-labs
FROM rust:1.77-buster

WORKDIR /app

# .git & README.md are unique per-repository. We ignore them on first copy to prevent cache misses
COPY --exclude=.git --exclude=README.md . /app

RUN cargo build --release --target-dir=/tmp/codecrafters-bittorrent-target

RUN cargo clean -p bittorrent-starter-rust --release --target-dir=/tmp/codecrafters-bittorrent-target

RUN rm -rf /app/src

RUN echo "cd \${CODECRAFTERS_REPOSITORY_DIR} && cargo build --release --target-dir=/tmp/codecrafters-bittorrent-target --manifest-path Cargo.toml" > /codecrafters-precompile.sh
RUN chmod +x /codecrafters-precompile.sh

ENV CODECRAFTERS_DEPENDENCY_FILE_PATHS="Cargo.toml,Cargo.lock"

# Once the heavy steps are done, we can copy all files back
COPY . /app
