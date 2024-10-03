#!/bin/bash

while true; do
  ./create.sh
  if [ $? -eq 0 ]; then
    break
  else
    echo "Script failed, retrying..."
    sleep 1
  fi
done
