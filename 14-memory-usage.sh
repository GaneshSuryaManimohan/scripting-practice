#!/bin/bash

MEM_USAGE=$(free -mh |grep Mem )
MEM_THR=100

while IFS= read -r line
do
    USAGE=$(echo $line |awk -F " " '{print $3F}')
    AVAIL=$(echo $line |awk -F " " '{print $NF}')
    if [ $USAGE -ge $MEM_THR ]
    then
        echo "Memory Usage $USAGE is more than $MEM_THR, free space available is $AVAIL"
    fi
done <<< $MEM_USAGE