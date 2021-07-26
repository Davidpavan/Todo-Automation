#!/bin/bash

source components/common.sh

OS_PREREQ

Head " Installing golang"
wget -c https://dl.google.com/go/go1.14.2.linux-amd64.tar.gz -O - | tar -xz -C /usr/local &>>$LOG
Stat $?

Head " Adjusting path variables"
export PATH=$PATH:/usr/local/go/bin &>>$LOG
source ~/.profile &>>$LOG
go version &>>$LOG
Stat $?

Head " Creating a new directory"
mkdir -p ~/go && cd ~/go && mkdir -p src && cd src &>>$LOG
Stat $?

DOWNLOAD_COMPONENT

Head " Build the Source-code"
export GOPATH=~/go &>>$LOG
go get &>>$LOG && go build &>>$LOG
Stat $?

Head "Update EndPoints in Service File"
sed -i -e "s/USERS_DNSNAME/192.168.0.65/" /root/go/src/login/login.service &>>$LOG
Stat $?

Head "Creating Service"
cp /root/go/src/login/login.service /etc/systemd/system/login.service &>>$LOG
Stat $?

Head "starting service"
systemctl daemon-reload && systemctl enable login &>>$LOG && systemctl start login
Stat $?