#!/bin/bash

USERID=$(id -u)
LOGS_DIR=/var/log/shell-script
LOGS_FILE="$LOGS_DIR/$0.log"

TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")

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
        echo "$TIMESTAMP [ERROR] Intsalling $1 is .. failed" | tee -a $LOGS_FILE
        exit 1
    else
        echo "$$TIMESTAMP [INFO] installed $1 .. sucessfully" | tee -a $LOGS_FILE
    fi

}

for package in $@
do
    echo "installing $package"
    dnf list installed $package &>> $LOGS_FILE
    if [ $? -ne 0 ]; then
        dnf install $package -y &>> $LOGS_FILE
        VALIDATE "Installing $package" $?
    else 
        echo "$package already installed... skiping"
    fi
done

