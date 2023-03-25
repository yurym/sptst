#!/bin/bash

######### orange waw # retn waw # orange gdn ####
SERVERS="    4166       32927        7200       "
LOGFILE=spdtst.pl.log
LOGGING=0 #0 or 1
#################################################

spdtst () {
 results=$(speedtest -s $1)
 echo "$results" | tr -d '\r' | while read -r line
 do
  echo "$line" | grep Server
  downl=$(echo "$line" | grep Download)
  if [ ! -z "$downl" ]
  then
   set -- $downl
   echo "$1 $2 $3"
  fi
  upl=$(echo "$line" | grep Upload)
  if [ ! -z "$upl" ]
  then
   set -- $upl
   echo "$1   $2 $3"
  fi
  ploss=$(echo "$line" | grep Packet)
  if [ ! -z "$ploss" ]
  then
   set -- $ploss
   echo "$1 $2 $3"
  fi
done
}

log () {
 if [ -f "$LOGFILE" ]
 then
  echo "$results" >> $LOGFILE
 else
  echo "$results" > $LOGFILE
 fi
}

if [ -f "$LOGFILE" ]
then
 rm $LOGFILE
fi

for server in $SERVERS
do
 if [ $LOGGING -eq 1 ]
 then
  spdtst $server && log
 else
  spdtst $server
 fi
done

#warsaw orange
#spdtst "4166" && log

#warsaw retn
#spdtst "32927" #&& log
