#!/usr/bin/env bash
set -Eeuo pipefail

service postgresql start
exec "$@"
