#!/bin/bash

USERID=$(id -u) #storing output of command "id -u" to a variable called USERID

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo "$2....FAILURE"
    else
        echo "$2....SUCCESS"
    fi
}

if [ $USERID -ne 0 ]
then
    echo "Please run this command as a root user"
    exit 1 #manually exiting the script incase of error
else
    echo "Running the command as a root user"
fi

dnf install mysql -y

VALIDATE $? "Installation of MYSQL"

dnf install git -y

VALIDATE $? "Installation of GIT"

#In functions, we are trying to avoid repetition of code.
#In 10-installation.sh, after every installation, we used to a step to validate whether the exit code is 0 or not and the proceed with installation.
#Here, we created a VALIDATE function in which we are validating the variables $1 that is whether the exit code of previous run is 0 or not ($?)
#And, vatiable $2, which is the operation that we are performing
#We can call the function by simply giving the name as shown above