#!/bin/bash

filepath=$1

if [ -z $filepath ]; then return; fi

old=$(stat -c %X $filepath)

while true; do
  new=$(stat -c %X $filepath)
  if [ $old -eq $new ]; then continue; fi
  old=$new
  if [ $(echo $QUTE_URL | grep http://localhost) ]; then
    echo "reload" >> "$QUTE_FIFO"
  fi
  sleep 1
done
