#!/usr/bin/env bash

set -e

#rm -rf /plugins/connection-filter/

if [ ! -d "/plugins/connection-filter/node_modules" ]; then
  cd /plugins/connection-filter/ && yarn install
fi

# /wait && postgraphile -n 0.0.0.0 --cors -c postgres://$POSTGRES_USER:$POSTGRES_PASSWORD@$PGHOST:$DB_PORT/$POSTGRES_DB -o -a -j -M --append-plugins /plugins/connection-filter/index.js

#/wait && npx postgraphile -n 0.0.0.0 --cors -c postgres://$POSTGRES_USER:$POSTGRES_PASSWORD@$PGHOST/$POSTGRES_DB --schema $PG_SCHEMA

node --inspect /node_modules/.bin/postgraphile -i / -n 0.0.0.0 --port 80 -c postgres://$POSTGRES_USER:$POSTGRES_PASSWORD@$PGHOST:$DB_PORT/$POSTGRES_DB -o -a -j -M --append-plugins /plugins/connection-filter/index.js

#/bin/bash

exec "$@"
