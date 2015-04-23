#!/bin/sh

p=9292

bundle exec ruhoh server $p&
sleep 0.5
open http://localhost:$p
