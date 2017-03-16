#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 -U admin <<-EOSQL
    CREATE USER pactbrokeruser WITH PASSWORD 'TheUserPassword';
    CREATE DATABASE pactbroker WITH OWNER pactbrokeruser;
    GRANT ALL PRIVILEGES ON DATABASE pactbroker TO pactbrokeruser;
EOSQL