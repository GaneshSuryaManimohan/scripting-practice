#!/bin/bash

NAME="GANESH SURYA MANIMOHAN"

echo "Name from current script is:: $NAME"
echo "Process ID of the current script is:: $$"

#Method1
./10-other-script.sh

#Method2
source ./10-other-script.sh

echo "Other script is called here and name from other script is:: $NAME"

# Output Method1: ./10-other-script.sh
# sh 09-current-script.sh
# Name from current script is:: GANESH SURYA MANIMOHAN
# Process ID of the current script is:: 1836
# Name from current script is:: THUTTAGUNTA
# Process ID of this script is:: 1837
# Other script is called here and name from other script is:: GANESH SURYA MANIMOHAN

# In this method the variable values will not change after calling other script
# PIDs of two scripts are also different

# Output Method2: source ./10-other-script.sh

