# !/bin/sh
# Docker entrypoint script.
# Wait until Postgres is ready

# ping -c 3 db.math.game

while ! pg_isready -p 5432 -h $DB_HOST -U $DB_USER -q; do 
 pg_isready -p 5432 -h $DB_HOST -U $DB_USER -q
 echo $?
 echo "$(date) - waiting for database to start"
 sleep 2
done


./prod/rel/api/bin/api eval Api.Release.migrate

./prod/rel/api/bin/api start
