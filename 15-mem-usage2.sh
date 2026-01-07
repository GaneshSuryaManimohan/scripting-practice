#!/bin/bash

MEM_USAGE=$(free -m | awk 'NR==1 {h1=$1; h2=$2; h3=$3; h4=$NF} NR==2 {print h1 ":" $2 ,h2 ":" $3, h3 ":" $4, h4 ":" $NF}')
MAIL="Current memory Usage on server $HOSTNAME is $MEM_USAGE"
#echo "Current RAM on Server $HOSTNAME:: $MEM_USAGE"

echo $MAIL | mail -s "Memory Utilization on Server"  thuttagunta.suryamanimohan@gmail.com