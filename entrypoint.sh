#!/bin/sh
# Docker entrypoint script.

# Wait until Postgres is ready
while ! pg_isready -q -h $DB_HOST -p 5432 -U $DB_USER
do
  ping -c 3 $DB_HOST
  echo $DB_HOST
  echo $DB_USER
  echo "$(date) - waiting for database to start"
  sleep 2
done

./prod/rel/demo/bin/demo eval Demo.Release.migrate

./prod/rel/demo/bin/demo start