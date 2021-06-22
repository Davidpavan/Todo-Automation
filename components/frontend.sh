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
sed -i -e "s/IP_ADDR/users.pavanzs.online/" /root/go/src/login/login.service
Stat $?


Head "Restart Nginx service"

nginx -t &>>$LOG
systemctl restart nginx
Stat $?

