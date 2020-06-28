FROM elixir:latest

RUN mkdir -p /mathgame/api
COPY . /mathgame/api
WORKDIR /mathgame/api

RUN mix local.hex --force
RUN mix deps.get

RUN mix do compile