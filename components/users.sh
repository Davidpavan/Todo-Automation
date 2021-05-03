#!/bin/bash

source components/common.sh

Head "Installing java-8"

apt update
apt install openjdk-8-jdk -y &>>$LOG
Stat $?

Head "Installing maven"
apt install maven -y &>>$LOG
Stat $?

Head "Downloading Dependecies"

git clone https://github.com/Davidpavan/users.git &>>$LOG
cd users && mvn clean package &>>$LOG
Stat $?

Head "Updating service"

mv /root/users/users.service /etc/systemd/system/users.service
Stat $?

Head "Starting Service"

systemctl daemon-reload
systemctl enable users
systemctl start users
Stat $?