#!/bin/bash
set -e

if [ ! -f Gemfile ]; then
  echo "No Gemfile found. Have you mounted volumes?"
  exit 1
fi

bundle install --retry 5 --jobs 20

exec "$@"