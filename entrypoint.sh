#!/bin/sh
# Docker entrypoint script.

# Wait until Postgres is ready
res=$(pg_isready -q -h $DB_HOST -p 5432 -U $DB_USER)
echo $res
while ! $res
do
  res=$(pg_isready -q -h $DB_HOST -p 5432 -U $DB_USER)
  echo $res
  echo "$(date) - waiting for database to start"
  sleep 2
done

./prod/rel/demo/bin/demo eval Demo.Release.migrate

./prod/rel/demo/bin/demo start