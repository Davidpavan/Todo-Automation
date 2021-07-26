#!/bin/bash

source components/common.sh

OS_PREREQ

Head " Installing golang"
cd
apt install golang-go -y &>>$LOG
Stat $?

Head " Creating a new directory"
if [ -d "~/go" ]
then
  cd ~/go/src/ && git clone https://github.com/Davidpavan/login.git && cd login
fi
Stat $?

Head " Build the Source-code"
export GOPATH=~/go &>>$LOG
apt install go-dep &>>$LOG
go get && go build &>>$LOG
Stat $?

Head "Update EndPoints in Service File"
sed -i -e "s/USERS_DNSNAME/192.168.0.65/" /root/go/src/login/login.service &>>$LOG
Stat $?

Head "Creating Service"
cp /root/go/src/login/login.service /etc/systemd/system/login.service &>>$LOG
Stat $?


Head "starting service"
systemctl daemon-reload && systemctl enable login &>>$LOG && systemctl start login && systemctl restart login
Stat $?