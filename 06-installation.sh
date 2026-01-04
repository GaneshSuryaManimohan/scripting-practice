#!/bin/bash

USERID=$(id -u) #storing output of command "id -u" to a variable called USERID

if [ $USERID -ne 0 ]
then
    echo "Please run this command as a root user"
    exit 1 #manually exiting the script incase of error
else
    echo "Running the command as a root user"
fi

dnf install mysql -y

if [ $? -ne 0 ]
then
    echo "Installation of MYSQL....FAILURE"
    exit 1
else
    echo "Installation of MYSQL....SUCCESS"
fi

dnf install git -y

if [ $? -ne 0 ]
then
    echo "Installation of GIT....FAILURE"
    exit 1
else
    echo "Installation of GIT....SUCCESS"
fi

echo "script is proceeding"





#In shell scripting, even in case of an error at a step, the script will proceed to execute to next steps.
#To overcome this we are taking the exit codes into consideration
#When we run a valid command, then the exit code will be 0, else it be anything between 1-127
#So, in the above installation, even if we are not running the script as root user an error is thrown, but the script will still proceed and print echo statements below
#So, we are using exit code at the end of every step, so that if there's a failure at any step the script will not proceed further.
#To check the exit code of previous run, we use special variable $?, if it return 0 then the script runs, else it stops as we are giving exit 1 if $? is not equal to 0
