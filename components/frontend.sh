#!/bin/bash

source components/common.sh

OS_PREREQ

Head "Installing Nginx"
apt install nginx -y &>>$LOG
Stat $?

Head "Installing Nodejs"
apt install nodejs -y &>>$LOG
Stat $?

Head "Installing npm"
apt install npm -y &>>$LOG
Stat $?

DOWNLOAD_COPONENT

Head "Clonning Git Repo & Installing npm depedencies"

git clone https://github.com/zelar-soft-todoapp/frontend.git &>>$LOG && cd frontend && npm install &>>LOG && npm run build &>>$LOG
Stat $?

Head "Update Nginx Configuration"
cd ~ && sed -i -e 's+/var/www/html+/root/frontend/dist+g' /etc/nginx/sites-available/default
stat $?
Head "Restart Nginx service"
systemctl nginx restart
Stat $?

Head "Starting npm"
npm start
Stat $?