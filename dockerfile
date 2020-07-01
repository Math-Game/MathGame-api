FROM elixir:latest

RUN mkdir -p /mathgame/api
COPY . /mathgame/api
WORKDIR /mathgame/api

RUN mix local.hex --force
RUN mix local.rebar --force

RUN mix deps.get
RUN mix deps.compile

RUN mix do compile

CMD MIX_ENV=prod mix phx.server
