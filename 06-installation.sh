#!/bin/bash

USERID=$(id -u) #storing output of command "id -u" to a variable called USERID

if [ $USERID -ne 0 ]
then
    echo "Please run this command as a root user"
else
    echo "Running the command as a root user"
fi

dnf install mysql -y