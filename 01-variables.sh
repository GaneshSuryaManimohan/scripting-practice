#!/bin/bash

echo "Please enter username::"

read -s USERNAME

echo "Please enter password::"

read -s PASSWORD

echo "username is $USERNAME and password is $PASSWORD"

#here the read command takes the input provided and stores it as a variable USERNAME/PASSWORD
# -s option will make sure the entered values are not displayed on terminal
# at last, for verification purpose we are using echo to display the values stored in USERNAME and PASSWORD variables 