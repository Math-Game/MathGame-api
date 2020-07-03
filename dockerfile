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

FROM alpine as production-stage

RUN mkdir -p /home/mathgame/api
RUN adduser -D -h /home/mathgame/api api

WORKDIR /home/mathgame/api
COPY --from=build-stage /mathgame/api/_build .
RUN chown -R api: ./prod

COPY --from=build-stage /mathgame/api/entrypoint.sh .
RUN chown api: entrypoint.sh

USER api

CMD ["./entrypoint.sh"]
