#!/bin/bash

source components/common.sh

OS_PREREQ

Head " Installing golang"
cd
apt install golang-go -y &>>$LOG
Stat $?

Head " Creating a new directory"
if [ -d "/root/go/src" ]; then
  cd ~/go && cd src &>>$LOG
else
  mkdir ~/go && cd ~/go && mkdir src && cd src &>>$LOG
fi
#mkdir ~/go && cd ~/go && mkdir src && cd src &>>$LOG
Stat $?

DOWNLOAD_COMPONENT

Head " Build the Source-code"
#export GOPATH=~/go &>>$LOG
apt install go-dep &>>$LOG
go get && go build &>>$LOG
Stat $?

Head "Update EndPoints in Service File"
sed -i -e "s/USERS_DNSNAME/192.168.0.79/" /root/go/src/login/login.service &>>$LOG
Stat $?

Head "Creating Service"
cp /root/go/src/login/login.service /etc/systemd/system/login.service &>>$LOG
Stat $?


Head "starting service"
systemctl daemon-reload && systemctl enable login &>>$LOG && systemctl start login && systemctl restart login
Stat $?