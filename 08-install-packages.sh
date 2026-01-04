#!/bin/bash

USERID=$(id -u)
TIME_STAMP=$(date +%F-%H-%M-%S)
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOGFILE=/tmp/$SCRIPT_NAME-$TIME_STAMP.log
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

for i in $@
do
    echo "Package to Install: $i"
    dnf list installed $i 
    if [ $? -eq 0 ]
    then
        echo -e "$i is already installed.... $Y SKIPPING $N"
    else
        echo "$i needs to be installed"
    fi
done