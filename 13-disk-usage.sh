#!/bin/bash

DISK_USAGE=$(df -hT |grep xfs)
DISK_THRESHOLD=30
MSG=""

while IFS= read -r line
do
    USAGE=$(echo $line | awk -F " " '{print $6F}' |cut -d "%" -f1)
    FOLDER=$(echo $line | awk -F " " '{print $NF}')
    if [ $USAGE -ge $DISK_THRESHOLD ]
    then
        MSG+="$FOLDER usage is more than $DISK_THRESHOLD, current usage is $USAGE \n"
    fi
done <<< $DISK_USAGE

echo -e "Message::\n$MSG"

echo $MSG | mail -s "Disk Usage Alert" thuttagunta.suryamanimohan@gmail.com

# echo "body of the mail" | mail -s "subject of the mail" <to-address> 
 