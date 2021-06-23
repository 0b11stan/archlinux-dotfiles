#!/bin/bash

filepath=$1

tab=$(echo $QUTE_URL | grep http://localhost)
if [ -z $filepath ] || [ -z $tab ]; then exit; fi

old=$(stat -c %X $filepath)

while true; do
  sleep 1
  new=$(stat -c %X $filepath)
  if [ $old -eq $new ]; then continue; fi
  old=$new
  echo "reload" >> "$QUTE_FIFO"
done
