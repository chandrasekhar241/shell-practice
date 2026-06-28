#!bin/bash

USERID=$(id -u)

#check root acess or not

if [$USERID -ne 0 ] then;
    echo "please run this script using root access"
fi

echo  "I am continued"