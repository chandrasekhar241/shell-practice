#!/bin/bash

USERID=$(id -u)

#check root acess or not
if [ $USERID -ne 0 ]; then
    echo "please run this script using root access"
    exit 1
fi

#echo  "I am continued"

echo "Installing /mySQL"

dnf install mysqlfdd -y

echo "I am continuing.."