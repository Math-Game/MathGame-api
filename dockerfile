FROM elixir:latest

RUN mkdir /mathgame/api
COPY . /mathgame/api
WORKDIR /mathgame/app

RUN mix local.hex --force

RUN mix do compile