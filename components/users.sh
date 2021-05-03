#!/bin/bash

source components/common.sh

Head "Downgrading java version to java-8"

apt-get remove openjdk-11-jdk-headless -y &>>$LOG
apt-get install openjdk-8-jdk -y &>>$LOG
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