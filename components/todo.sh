#!/bin/bash

source components/common.sh

OS_PREREQ

Head "Install NPM"
cd
apt install npm -y &>>$LOG
Stat $?

DOWNLOAD_COMPONENT

Head "Download Dependencies"
npm install &>>$LOG
Stat $?

Head "Update EndPoints in Service File"
sed -i -e "s/REDIS_DNSNAME/172.31.93.77/" /root/todo/todo.service &>>$LOG

Head "Moving Servicefile"
cp /root/todo/todo.service /etc/systemd/system/todo.service &>>$LOG

Head "Starting Service"
systemctl daemon-reload && systemctl enable todo &>>$LOG && systemctl start todo
Stat $?