#!/bin/bash

source components/common.sh

OS_PREREQ

Head "Installing Nginx"
apt install nginx -y &>>$LOG
Stat $?

Head "Installing Nodejs"
apt install nodejs -y &>>$LOG
Stat $1

Head "Installing npm"
apt install npm -y &>>$LOG
Stat $1

DOWNLOAD_COPONENT

Head "Clonning Git Repo & Installing npm depedencies"

git clone https://github.com/zelar-soft-todoapp/frontend.git && cd frontend && npm install && npm run build
Stat $1

Head "Restart Nginx service"
systemctl nginx restart
Stat $1

Head "Starting npm"
npm start
Stat $