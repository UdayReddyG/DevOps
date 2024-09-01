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
for package in $@
do 
dnf list installed $package
if [ $? -ne 0]
then 
    dnf install $package
    validate $? $package
else
    echo "$g already installed"
fi
done