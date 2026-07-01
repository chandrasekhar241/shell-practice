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
        echo "Intsalling $1 is .. failed"
        exit 1
    else
        echo "installed $1 .. sucessfully"
    fi

}

dnf list installed nginx &>> $LOGS_FILE

if [ $? -eq 0 ]; then
    echo "ngnix already installed"
else
    echo "Installing /ngnix"
    dnf install nginx -y &>> $LOGS_FILE
    VALIDATE nginx $?
fi