#!/bin/bash

source components/common.sh

apt update &>>$LOG

Head "Installing login dependencies"
cd
apt install golang -y &>>$LOG
Stat $?

Head "Cloning Repo"
mkdir /go && cd /go && mkdir src && cd src
git clone https://github.com/Davidpavan/login.git &>>$LOG
Stat $?

Head "Building Package"
cd /go && cd src && cd login && export GOPATH=/go && go get
go build &>>$LOG
Stat $?

Head "Update EndPoints in Service File"
sed -i -e "s/USERS_DNSNAME/users.pavanzs.online/" /go/src/login/login.service
Stat $?

Head "Creating Service"

mv /go/src/login/login.service /etc/systemd/system/login.service
Stat $?

Head "Restarting Services"
systemctl daemon-reload &>>$LOG && systemctl start login && systemctl enable login &>>$LOG
Stat $?