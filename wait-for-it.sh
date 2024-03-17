#!/bin/bash
# wait-for-it.sh

TIMEOUT=15
HOST="$1"
PORT="$2"

for i in `seq $TIMEOUT` ; do
  nc -z "$HOST" "$PORT" > /dev/null 2>&1

  result=$?
  if [ $result -eq 0 ] ; then
    echo "Service $HOST:$PORT is available now."
    exit 0
  fi
  echo "Waiting for $HOST:$PORT... $i/$TIMEOUT"
  sleep 1
done

echo "Operation timed out" >&2
exit 1