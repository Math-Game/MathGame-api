#!/bin/sh
# Docker entrypoint script.
pg_isready -p 5432 -h $DB_HOST -q; echo $?
# Wait until Postgres is ready
res="$(pg_isready -p 5432 -h $DB_HOST -U $DB_USER -q; echo $?)"
echo "res is: ${res}"

while $res
do
  res="$(pg_isready -p 5432 -h $DB_HOST -U $DB_USER -q; $?)"
  echo "res is: ${res}"
  echo "$(date) - waiting for database to start"
  sleep 2
done

./prod/rel/api/bin/api eval Api.Release.migrate

./prod/rel/api/bin/api start
