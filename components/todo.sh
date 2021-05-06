#!/bin/bash

source components/common.sh

OS_PREREQ

Head "Install NPM"

apt install npm -y &>>$LOG
Stat $?

Head "Downloadind dependencies"

git clone https://github.com/Davidpavan/todo.git &>>$LOG
cd todo
npm install &>>$LOG
Stat $?

Head "Update EndPoints in Service File"
sed -i -e "s/REDIS_DNSNAME/redis.pavanzs.online/" /root/Todo-Automation/todo/todo.service
Stat $?

Head "Moving Servicefile"
mv /root/Todo-Automation/todo/todo.service /etc/systemd/system/todo.service &>>$LOG

Head "Starting Service"
systemctl daemon-reload && systemctl enable todo &>>$LOG && systemctl start todo
Stat $?

Head "Start npm service"

npm start
Stat $LOG