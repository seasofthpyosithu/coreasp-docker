#!/bin/bash

/usr/sbin/gearmand --port=7001 -u root -d --verbose DEBUG -l /dev/stdout
/usr/sbin/gearmand --port=7002 -u root -d --verbose DEBUG -l /dev/stdout
/usr/sbin/gearmand --port=7003 -u root -d --verbose DEBUG -l /dev/stdout
/usr/sbin/gearmand --port=7004 -u root -d --verbose DEBUG -l /dev/stdout
/usr/sbin/gearmand --port=7005 -u root -d --verbose DEBUG -l /dev/stdout
/usr/sbin/gearmand --port=7006 -u root -d --verbose DEBUG -l /dev/stdout

while sleep 60; do
  ps aux |grep 'gearmand --port=7001' |grep -q -v grep
  PROCESS_1_STATUS=$?
  ps aux |grep 'gearmand --port=7002' |grep -q -v grep
  PROCESS_2_STATUS=$?
  ps aux |grep 'gearmand --port=7003' |grep -q -v grep
  PROCESS_3_STATUS=$?
  ps aux |grep 'gearmand --port=7004' |grep -q -v grep
  PROCESS_4_STATUS=$?
  ps aux |grep 'gearmand --port=7005' |grep -q -v grep
  PROCESS_5_STATUS=$?
  ps aux |grep 'gearmand --port=7006' |grep -q -v grep
  PROCESS_6_STATUS=$?
  # If the greps above find anything, they exit with 0 status
  # If they are not both 0, then something is wrong
  if [ $PROCESS_1_STATUS -ne 0 -o $PROCESS_2_STATUS -ne 0 -o $PROCESS_3_STATUS -ne 0  -o $PROCESS_4_STATUS -ne 0  -o $PROCESS_5_STATUS -ne 0 -o $PROCESS_6_STATUS -ne 0 ]; then
    echo "One of the processes has already exited."
    exit 1
  fi
done