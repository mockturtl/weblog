#!/bin/sh

cmd="ruho[h]"
unalias grep 2> /dev/null
pid=$(ps -o pid,cmd | grep $cmd | awk '{ print $1 }')

if ! [ "$pid" -eq "$pid" ] 2> /dev/null; then
  cat<<EOF
  Preview not running.
EOF
  exit 11
fi

kill $pid
