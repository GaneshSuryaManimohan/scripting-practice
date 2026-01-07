#!/bin/bash

MEM_USAGE=$(free -m | awk 'NR==1 {h1=$1; h2=$2; h3=$3; h4=$NF} NR==2 {print h1 ":" $2 ,h2 ":" $3, h3 ":" $4, h4 ":" $NF}')
MAIL="Current memory Usage on server $HOSTNAME is $MEM_USAGE"
#echo "Current RAM on Server $HOSTNAME:: $MEM_USAGE"

echo $MAIL | mail -s "Memory Utilization on Server"  thuttagunta.suryamanimohan@gmail.com

#               total        used        free      shared  buff/cache   available
# Mem:            742         127         234           0         381         504
# Swap:             0           0           0

# awk 'NR==1 {h1=$1; h2=$2; h3=$3; h4=$NF} NR==2 {print h1 ":" $2 ,h2 ":" $3, h3 ":" $4, h4 ":" $NF}'
# NR==1 1st line (header)
# h1=$1 --> total
# h2=$2 --> used
# h3=$3 --> free
# h4=$NF --> available
# NR==2 2nd line (here, Mem: line)
# $2 --> 742
# $3 --> 127
# $4 --> 234
# $NF --> 504
