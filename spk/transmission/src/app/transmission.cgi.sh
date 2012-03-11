#!/bin/sh

if transmission-ctl status >/dev/null
then
  echo "Location: http://${SERVER_NAME}:9091/"
  echo
fi
