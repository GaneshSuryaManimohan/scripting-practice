#!/bin/bash

USERID=$(id -u) #storing output of command "id -u" to a variable called USERID
TIME_STAMP=$(date +%F-%H:%M:%S)
SCRIPT_NAME=$(echo $0 |awk -F "." '{print $1}')
#SCRIPT_NAME=$(echo $0 |cut -d "." -f1)
LOGFILE=/tmp/$SCRIPT_NAME-$TIME_STAMP.log
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
echo -e "$Y Script started at $TIME_STAMP $N"

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo -e "$2....$R FAILURE $N"
    else
        echo -e "$2....$G SUCCESS $N"
    fi
}

if [ $USERID -ne 0 ]
then
    echo "Please run this command as a root user"
    exit 1 #manually exiting the script incase of error
else
    echo "Running the command as a root user"
fi

dnf install mysql -y &>>$LOGFILE

VALIDATE $? "Installation of MYSQL"

dnf install git -y &>>$LOGFILE

VALIDATE $? "Installation of GIT"

dnf install dockerrr -y &>>$LOGFILE
VALIDATE $? "Installation of Docker"


#In functions, we are trying to avoid repetition of code.
#In 10-installation.sh, after every installation, we used to a step to validate whether the exit code is 0 or not and the proceed with installation.
#Here, we created a VALIDATE function in which we are validating the variables $1 that is whether the exit code of previous run is 0 or not ($?)
#And, vatiable $2, which is the operation that we are performing
#We can call the function by simply giving the name as shown above
#We are using the redirector to append the output to $LOGFILE
# > by default it will redirect only success output
# 1> it will ONLY redirect success output
# 2> it will ONLY redirect error output
# &> it will redirect both success & error output
# &>> it will append both success & error output
# Color Codes:
##### Red = \e[31m
##### Green = \e[32m
##### Yellow = \e[33m
##### No color = \e[0m