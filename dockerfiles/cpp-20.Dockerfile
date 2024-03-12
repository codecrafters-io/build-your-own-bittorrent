FROM gcc:12.2.0-bullseye

RUN apt-get update && \
    apt-get install --no-install-recommends -y cmake=3.18.* && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN printf "cd \${CODECRAFTERS_SUBMISSION_DIR} && cmake \$(pwd) -B build && cmake --build build && sed -i 's/^\(cmake .*\)/#\1/' ./your_bittorrent.sh" > /codecrafters-precompile.sh
RUN chmod +x /codecrafters-precompile.sh
