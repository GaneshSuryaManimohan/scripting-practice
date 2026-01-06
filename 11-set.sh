#!/bin/bash

set -e
failure(){
    echo "Error on line $1:$2"
}
trap 'failure "${LINENO}" "$BASH_COMMAND"' ERR

USERID=$(id -u) #storing output of command "id -u" to a variable called USERID

if [ $USERID -ne 0 ]
then
    echo "Please run this command as a root user"
    exit 1 #manually exiting the script incase of error
else
    echo "Running the command as a root user"
fi

dnf install mysdffgqdsl -y
dnf install git -y
echo "script is proceeding"

# Instead of writing VALIDATE everytime after a step, we can use set -e command. The shell script will stop executing the script in case of any error without proceeding to next steps.