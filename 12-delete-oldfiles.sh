#!/bin/bash

SOURCE_DIR="/tmp/app-logs"

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

if [ -d "$SOURCE_DIR" ]
then
    echo -e "$G Source Directory exists $N"
else
    echo -e "$R Make sure "$SOURCE_DIR" exists $N"
    exit 1
fi

FILES=$(find "$SOURCE_DIR" -name "*.log" -mtime +14)

echo -e "$Y Files to delete:$N $FILES "

while IFS= read -r line
do
    echo "Deleting File: $line"
    rm -rf $line
done <<< $FILES