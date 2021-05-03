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

DOWNLOAD_COMPONENT

Head "Change directory"

cd /frontend
Stat $?

Head "Build packages"

npm install &>>LOG && npm run build &>>$LOG
Stat $?

Head "Update Nginx Configuration"
cd ~ && sed -i -e 's+/var/www/html+/root/frontend/dist+g' /etc/nginx/sites-available/default
stat $?
Head "Restart Nginx service"
systemctl nginx start
Stat $?

Head "Starting npm"
npm start
Stat $?