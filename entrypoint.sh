#!/bin/sh
# Docker entrypoint script.
# Wait until Postgres is ready

# TODO fix pg_isready

#while ! pg_isready -p 5432 -h $DB_HOST -U $DB_USER -q; do
#  pg_isready -p 5432 -h $DB_HOST -U $DB_USER -q
#  echo $?
#  echo "$(date) - waiting for database to start"
#  sleep 2
#done

sleep 10

./prod/rel/api/bin/api eval Api.Release.migrate

./prod/rel/api/bin/api start
