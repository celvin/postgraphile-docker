#!/usr/bin/env bash

set -e

# /wait && postgraphile -n 0.0.0.0 --cors -c postgres://$POSTGRES_USER:$POSTGRES_PASSWORD@$PGHOST:$DB_PORT/$POSTGRES_DB -o -a -j -M --append-plugins /plugins/connection-filter/index.js
#/wait && npx postgraphile -n 0.0.0.0 --cors -c postgres://$POSTGRES_USER:$POSTGRES_PASSWORD@$PGHOST/$POSTGRES_DB --schema $PG_SCHEMA

#node --inspect /node_modules/.bin/postgraphile -i / -n $GRAPHILE_LISTEN --port $GRAPHILE_LISTEN_PORT -c postgres://$POSTGRES_USER:$POSTGRES_PASSWORD@$POSTGRES_HOST:$POSTGRES_PORT/$POSTGRES_DATABASE $GRAPHILE_EXTRAS

/node_modules/.bin/postgraphile -i / -n $GRAPHILE_LISTEN --port $GRAPHILE_LISTEN_PORT -c postgres://$POSTGRES_USER:$POSTGRES_PASSWORD@$POSTGRES_HOST:$POSTGRES_PORT/$POSTGRES_DATABASE $GRAPHILE_EXTRAS

exec "$@"
