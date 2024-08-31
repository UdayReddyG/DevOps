#!/bin/bash

userid=$(id -u)
validate(){
    if [ $1 ne 0 ]
    then
        echo "$2 not installed"
        exit 1
    else
        echo "$2 is"
    fi
}

if [ $userid ne 0 ]
then
    echo "please run with the root privilages"
    exit 1
fi
dnf list installed git

if [ $? ne 0 ]
then 
    echo "git not installed"
    dnf install git
    validate $? "git"
else 
    echo "already installed"
fi