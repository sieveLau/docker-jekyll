#!/bin/bash
set -e

if [ ! -f Gemfile ]; then
  echo "No Gemfile found. Have you mounted volumes?"
  echo "I assume you are creating a new site. Will install jekyll now."
  gem install jekyll
else
  bundle install --retry 5 --jobs 20
fi

exec "$@"