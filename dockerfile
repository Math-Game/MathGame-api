FROM elixir:latest as build-stage

ENV MIX_ENV=prod

RUN mix local.hex --force
RUN mix local.rebar --force

RUN mkdir -p /mathgame/api
COPY . /mathgame/api
WORKDIR /mathgame/api

RUN mix deps.get
RUN mix deps.compile

RUN mix do compile, release

FROM elixir:latest as production-stage

# RUN apk add --update postgresql-client

RUN mkdir -p /home/mathgame/api
WORKDIR /home/mathgame/api

COPY --from=build-stage /mathgame/api/_build .
COPY --from=build-stage /mathgame/api/entrypoint.sh .

RUN chmod +x entrypoint.sh

CMD [ "./entrypoint.sh" ]
