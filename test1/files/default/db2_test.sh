#!/bin/sh
#set -x

status=0
if [ ! -f /var/tmp/bobo.txt ]; then
  echo "`date` - Hello, first creation of bobo.txt" >> /var/tmp/bobo.txt
else
   echo "`date` - Hello, SECOND creation of bobo.txt" >> /var/tmp/bobo.txt
   status=2
fi

echo $status	


