#!/bin/bash

echo -n "|  |"

#warsaw orange
results=$(speedtest -s 4166)
#echo -e "$results" | while read -r line; do echo "$line"; done
echo "$results" > spdtst.pl.log

echo -ne "\r|. |"

#warsaw retn
results=$(speedtest -s 32927)
#echo -e "$results" | while read -r line; do echo "$line"; done
echo "$results" >> spdtst.pl.log

echo -e "\r|..|"
