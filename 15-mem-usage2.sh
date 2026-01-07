#!/bin/bash

MEM_USAGE=$(free -mh)

while IFS= read -r line
do
    USAGE+=$(echo $line | awk 'NR==1 {h1=$1; h2=$2; h3=$3; h4=$NF} NR==2 {print h1 ":" $2 ,h2 ":" $3, h3 ":" $4, h4 ":" $NF}')
done <<< $MEM_USAGE

echo -e "Current RAM on Server::  $USAGE"