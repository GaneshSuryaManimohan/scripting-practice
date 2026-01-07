#!/bin/bash

MEM_USAGE=$(free -m | awk 'NR==1 {h1=$1; h2=$2; h3=$3; h4=$NF} NR==2 {print h1 ":" $2 ,h2 ":" $3, h3 ":" $4, h4 ":" $NF}')

echo "Current RAM on Server:: $MEM_USAGE"