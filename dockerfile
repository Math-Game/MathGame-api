FROM elixir:alpine as build-stage

ENV MIX_ENV=prod

RUN mix local.hex --force
RUN mix local.rebar --force

RUN mkdir -p /mathgame/api
COPY . /mathgame/api
WORKDIR /mathgame/api

RUN mix deps.get
RUN mix deps.compile

RUN mix release

FROM alpine:latest as production-stage

RUN apk add --update postgresql-client

RUN mkdir -p /home/mathgame/api
WORKDIR /home/mathgame/api
RUN adduser -D -h /home/mathgame/api api

COPY --from=build-stage /mathgame/api/_build .
COPY --from=build-stage /mathgame/api/entrypoint.sh .

RUN chmod +x entrypoint.sh
RUN chown -R api: ./prod
RUN chown api: entrypoint.sh

USER api

ENTRYPOINT [ "./entrypoint.sh" ]
