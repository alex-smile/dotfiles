#!/usr/bin/env bash
set -e

envfile="${PROJECT_ENVFILE}"
if [ -f "${envfile}" ]; then
    set -a
    source "${envfile}"
    set +a
fi

exec "$@"

