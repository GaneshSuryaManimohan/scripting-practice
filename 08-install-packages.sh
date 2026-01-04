#!/bin/bash

#USERID=$(id -u)

for i in $@
do
    echo "Package to Install: $i"
    dnf list installed $i
done