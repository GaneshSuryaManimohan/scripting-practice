#!/bin/bash

NAME="GANESH SURYA MANIMOHAN"

echo "Name from current script is:: $NAME"
echo "Process ID of the current script is:: $$"

./10-other-script.sh

echo "Other script is called here and name from other script is:: $NAME"