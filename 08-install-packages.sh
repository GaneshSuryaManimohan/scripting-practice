#!/bin/bash

#USERID=$(id -u)

for i in $@
do
    echo "Package to Install: $i"
    dnf list installed $i
    if [ $? -eq 0 ]
    then
        echo "$i is already installed....SKIPPING"
    else
        echo "$i needs to be installed"
    fi
done