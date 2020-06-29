FROM elixir:latest as build-stage

RUN mkdir -p /mathgame/api
COPY . /mathgame/api
WORKDIR /mathgame/api

RUN mix local.hex --force
RUN mix deps.get
RUN mix local.rebar --force

RUN mix do compile

FROM elixir:latest as production-stage
RUN mkdir -p /mathgame/api
COPY --from=build-stage . /mathgame/api
RUN mix phx.server
