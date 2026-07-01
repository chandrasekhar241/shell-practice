#!/bin/bash

USERID=$(id -u)
LOGS_DIR=/var/log/shell-script
LOGS_FILE="$LOGS_DIR/$0.log"
R="\e[31m"
Y="\e[33m"
G="\e[32m"
N="\e[0m"

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
        echo -e "$TIMESTAMP [ERROR] Intsalling $1 is .. $R failed $N" | tee -a $LOGS_FILE
        exit 1
    else
        echo -e "$TIMESTAMP [INFO] installed $1 .. $G sucessfully $N" | tee -a $LOGS_FILE
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
        echo -e "$TIMESTAMP  $package already installed... $Y skiping $N"
    fi
done

