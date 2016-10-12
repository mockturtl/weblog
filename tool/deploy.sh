#!/bin/sh

unversioned=$(git ls-files --other | wc -l)

if [ $unversioned -gt 0 ]; then
  cat<<EOF
  ERROR: $unversioned files will be deleted if you deploy.
  'git add|stash' them.
EOF
  exit 13
fi

git submodule update && \
bundle exec ruhoh publish github && \
git submodule update

prod="https://mockturtl.github.io/weblog"
sleep 1
xdg-open $prod
