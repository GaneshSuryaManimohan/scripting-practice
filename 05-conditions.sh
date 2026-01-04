#!/bin/bash

echo "Please enter a number:: "

read NUMBER

if [ $NUMBER -gt 10 ]
then
    echo "Given number is greater than 10"
else
    echo "Given number is less than 10"
fi