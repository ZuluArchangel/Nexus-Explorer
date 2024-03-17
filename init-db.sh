#!/bin/bash
set -e

# Perform all actions as $POSTGRES_USER
export PGUSER="$POSTGRES_USER"

# Create a new PostgreSQL database with the name specified in POSTGRES_DB environment variable
"${psql[@]}" <<- 'EOSQL'
CREATE DATABASE $POSTGRES_DB;
EOSQL

echo "Database $POSTGRES_DB created."
