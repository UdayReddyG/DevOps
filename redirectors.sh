#!/bin/bash
log_folder="/var/log/shellscript"
script=$(echo $0 | cut -d "." -f1)
time=$(date +%Y-%m-%d-%H-%M-%S)
logfile="$log_folder/$script-$time.log"
mkdir -p $log_folder
r="\e[31m"
g="\e[32m"
y="\e[33m"


userid=$(id -u)
validate(){
    if [ $1 -ne 0 ]
    then
        echo -e "$r $2 not installed" | tee -a &>>$logfile
        exit 1
    else
        echo -e "$g $2 is installed" | tee -a &>>$logfile
    fi
}

if [ $userid -ne 0 ]
then
    echo "please run with the root privilages" | tee -a &>>$logfile
    exit 1
fi
for package in $@
do 
dnf list installed $package &>>$logfile
if [ $? -ne 0 ]
then 
    dnf install $package
    validate $? $package
else
    echo -e "$g already installed" | tee -a &>>$logfile
fi
done