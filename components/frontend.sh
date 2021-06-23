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

Head "Remove Default Configuration"
rm -rf /var/www/html/* /etc/nginx/sites-enabled/default /etc/nginx/sites-available/default
cd /var/www/html
Stat $?

DOWNLOAD_COMPONENT

Head "Build packages"

npm install &>>LOG && npm run build &>>$LOG
Stat $?

Head "Update Nginx Configuration"

mv todo.conf /etc/nginx/sites-enabled/todo.conf
Stat $?

Head "Update EndPoints in Conf File"
sed -i -e "s/TODO_IP_ADDR/192.168.0.135/" /etc/nginx/sites-enabled/todo.conf && sed -i -e "s/LOGIN_IP_ADDR/192.168.0.227/" /etc/nginx/sites-enabled/todo.conf
Stat $?


Head "Restart Nginx service"

nginx -t &>>$LOG
systemctl restart nginx
Stat $?

