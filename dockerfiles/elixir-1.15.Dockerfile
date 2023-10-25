FROM elixir:1.15.6-alpine

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

# after precompile, modifies your_bittorrent.sh to comment out lines starting with mix
RUN echo "cd \${CODECRAFTERS_SUBMISSION_DIR} && mix escript.build && sed -i 's/^\(mix .*\)/#\1/' ./your_bittorrent.sh" > /codecrafters-precompile.sh

ENV CODECRAFTERS_DEPENDENCY_FILE_PATHS="mix.exs,mix.lock"
