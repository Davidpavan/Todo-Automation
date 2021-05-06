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
mkdir -p ~/go && cd ~/go && mkdir src && cd src &>>$LOG
Stat $?

DOWNLOAD_COMPONENT

Head " Navigate Directory"
cd login &>>$LOG
Stat $?

Head " Build the Source-code"
cd ~/go/src && export GOPATH=~/go &>>$LOG
depmod && apt install go-dep &>>$LOG
cd login
dep ensure && go get &>>$LOG && go build &>>$LOG
Stat $?

Head "Creating Service"

mv /root/go/src/login/login.service /etc/systemd/system/login.service &>>$LOG
Stat $?

Head "starting service"
systemctl daemon-reload && systemctl enable login &>>$LOG && systemctl start login
Stat $?