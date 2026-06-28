#!bin/bash

## if condition

NUMBER=$1

if [ $NUMBER -ge 20]; then
    echo "Given number is greater that or equal to 20"
    else
        echo "Given number is less than 20"
fi