# TODO: Understand out of order execution why

FROM elixir:1.10-alpine

# prepare build dir
RUN mkdir /app
WORKDIR /app

# install hex + rebar
RUN mix local.hex --force && \
  mix local.rebar --force

# install and compile mix dependencies
COPY mix.exs ./
COPY mix.lock ./
RUN mix deps.get && \
    mix deps.compile

# copy compiled dependencies
RUN mkdir -p /app-cached
RUN mv _build/ /app-cached/
RUN mv deps/ /app-cached/

# modify your_bittorrent.sh as a precompile step
# comment lines starting with mix
# uncomment lines starting with ##
RUN echo "cd \${CODECRAFTERS_SUBMISSION_DIR} && sed -i 's/^\(mix .*\)/#\1/' ./your_bittorrent.sh && sed -i 's/^##\(.*\)/\1/' ./your_bittorrent.sh" > /codecrafters-precompile.sh
