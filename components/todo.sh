#!/bin/bash

source components/common.sh

OS_PREREQ

Head "Install NPM"
cd
sudo apt install npm -y &>>$LOG
Stat $?

DOWNLOAD_COMPONENT

Head "Download Dependencies"
sudo npm install &>>$LOG
Stat $?

Head "Update EndPoints in Service File"
sudo sed -i -e "s/REDIS_DNSNAME/192.168.0.87/" /root/todo/todo.service &>>$LOG

Head "Moving Servicefile"
cp /root/todo/todo.service /etc/systemd/system/todo.service &>>$LOG

Head "Starting Service"
sudo systemctl daemon-reload && sudo systemctl enable todo &>>$LOG && sudo systemctl start todo
Stat $?