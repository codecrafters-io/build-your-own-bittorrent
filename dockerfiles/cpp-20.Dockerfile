FROM gcc:12.2.0-bullseye

RUN apt-get update
RUN apt-get install -y cmake

RUN echo "cd \${CODECRAFTERS_SUBMISSION_DIR} && cmake \$(pwd) -B build && cmake --build build && sed -i 's/^\(cmake .*\)/#\1/' ./your_bittorrent.sh" > /codecrafters-precompile.sh
RUN chmod +x /codecrafters-precompile.sh