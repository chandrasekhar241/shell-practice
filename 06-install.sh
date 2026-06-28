#!/bin/bash

USERID=$(id -u)

#check root acess or not
if [ $USERID -ne 0 ]; then
    echo "please run this script using root access"
    exit 1
fi

#echo  "I am continued"



dnf list installed mysql

if [ $? -eq 0 ]; then
    echo "MYSQL is already installed..SKIPPING"
else
    echo "Installing /mySQL"
    dnf install mysql -y

    if  [ $? -ne 0 ]; then
        echo "Intsalling mysql is .. failed"
        exit 1
    else
        echo "installed mysql .. sucessfully"
    fi
fi
