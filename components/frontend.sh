#!/bin/bash

source components/common.sh

OS_PREREQ

Head "Installing Nginx"
cd
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
cd frontend &>>$LOG
If [ -d ~/frontend]; then
  cd frontend
  Stat $?
fi

Head "Build packages"

npm install &>>LOG && npm run build &>>$LOG
Stat $?

Head "Update Nginx Configuration"

sed -i -e 's+/var/www/html+/root/frontend/dist+g' /etc/nginx/sites-available/default
Stat $?

Head " Export DOMAINS"

export AUTH_API_ADDRESS=http://login.pavanzs.online:8080 && export TODOS_API_ADDRESS=http://todo.pavanzs.online:8080
Stat $?

Head "Restart Nginx service"

nginx -t &>>$LOG
systemctl restart nginx
Stat $?

Head "Starting npm"

npm start
Stat $?