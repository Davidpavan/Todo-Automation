#!/bin/bash

source components/common.sh

OS_PREREQ

Head "Installing java-8"

cd
sudo apt remove openjdk-11-jdk-headless &>>$LOG
sudo apt install openjdk-8-jdk -y &>>$LOG
Stat $?

Head "Installing maven"
sudo apt install maven -y &>>$LOG
Stat $?

DOWNLOAD_COMPONENT

sudo mvn clean package &>>$LOG
Stat $?

Head "Updating service"

sudo mv /root/users/users.service /etc/systemd/system/users.service &>>$LOG

Head "Starting Service"

sudo systemctl daemon-reload && sudo systemctl enable users && sudo systemctl start users
Stat $?