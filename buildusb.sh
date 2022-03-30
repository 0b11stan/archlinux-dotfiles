#!/bin/bash

DEVID=$1

if [[ -z $DEVID ]]; then
  echo "Usage: $0 /dev/sdx"
fi

cryptsetup luksFormat $DEVID
cryptsetup open $DEVID cryptlvm
