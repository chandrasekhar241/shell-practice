#!/bin/bash

START_TIME=$(date +%s)

echo "please enter your name : :"

read USER_NAME # here USER_NAME is variable, whatever you enter in terminal stores in this variable

echo "username is $USER_NAME"


echo "please enter your password : :"

read -s PASSWORD # here USER_NAME is variable, whatever you enter in terminal stores in this variable

echo "password is $PASSWORD"

END_TIME=$(date +%s)

TOTAL_TIME=$(($END_TIME-$START_TIME))

