#!/bin/sh

git submodule update && \
#git push origin --delete gh-pages && \
bundle exec ruhoh publish github && \
git submodule update

prod="https://mockturtl.github.io/weblog"
open $prod
