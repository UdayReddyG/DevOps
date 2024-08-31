#!/bin/bash
r="\e[31m"
g="\e[32m"
y="\e[33m"


userid=$(id -u)
validate(){
    if [ $1 -ne 0 ]
    then
        echo -e "$r $2 not installed"
        exit 1
    else
        echo -e "$g $2 is installed"
    fi
}

if [ $userid -ne 0 ]
then
    echo "please run with the root privilages"
    exit 1
fi
dnf list installed git

if [ $? -ne 0 ]
then 
    echo -e "$r git not installed"
    dnf install git
    validate $? "git"
else 
    echo -e "$g already installed"
fi