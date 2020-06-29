FROM elixir:latest as build-stage

RUN mkdir -p /mathgame/api
COPY . /mathgame/api
WORKDIR /mathgame/api

RUN mix local.hex --force
RUN mix deps.get
RUN mix local.rebar --force

EXPOSE 433

CMD MIX_ENV=prod mix phx.server
