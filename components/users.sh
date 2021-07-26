#!/bin/bash

source components/common.sh

OS_PREREQ

Head "Installing java-8"

cd
apt remove openjdk-11-jdk-headless &>>$LOG
apt install openjdk-8-jdk -y &>>$LOG
Stat $?

Head "Installing maven"
apt install maven -y &>>$LOG
Stat $?

DOWNLOAD_COMPONENT

mvn clean package &>>$LOG
Stat $?

Head "Updating service"

cp /root/users/users.service /etc/systemd/system/users.service &>>$LOG

Head "Starting Service"

systemctl daemon-reload && systemctl enable users && systemctl start users
Stat $?