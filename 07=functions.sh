#!/bin/bash

USERID=$(id -u)

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

dnf list installed mysql

if [ $? -eq 0 ]; then
    echo "MYSQL is already installed..SKIPPING"
else
    echo "Installing /mySQL"
    dnf install mysql -y
    VALIDATE Mysql $?
fi
