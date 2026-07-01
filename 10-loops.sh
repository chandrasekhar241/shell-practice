#!/bin/bash

USERID=$(id -u)
LOGS_DIR=/var/log/shell-script
LOGS_FILE="$LOGS_DIR/$0.log"

#check root acess or not
if [ $USERID -ne 0 ]; then
    echo "please run this script using root access"
    exit 1
fi

#echo  "I am continued"

#first arg - what are u trying to install
#second arg - exit code
VALIDATE(){
    if  [ $2 -ne 0 ]; then
        echo "Intsalling $1 is .. failed" | tee -a $LOGS_FILE
        exit 1
    else
        echo "installed $1 .. sucessfully" | tee -a $LOGS_FILE
    fi

}

for package in $@
do
    echo "installing $package

done

