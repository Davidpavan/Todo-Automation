#!/bin/bash

source components/common.sh

apt update &>>$LOG

Head "Installing login dependencies"

apt install golang -y &>>$LOG
Stat $?

Head "Cloning Repo"
cd
mkdir /go && cd /go && mkdir src && cd src
git clone https://github.com/Davidpavan/login.git &>>$LOG
Stat $?

Head "Navigate Directory"

mv Todo-login login &>>$LOG && cd login && rm -rf login &>>$LOG

Head "Update EndPoints in Service File"
sed -i -e "s/USERS_DNSNAME/users.pavanzs.online/" /go/src/login/login.service
Stat $?

Head "Creating Service"

mv /go/src/login/login.service /etc/systemd/system/login.service
Stat $?

Head "Get dependencies"
if [ $? -ne 0 ]; then
 go get github.com/dgrijalva/jwt-go &>>$LOG && go get github.com/labstack/echo &>>$LOG && go get github.com/labstack/echo/middleware &>>$LOG && go get github.com/labstack/gommon/log &>>$LOG && go get github.com/openzipkin/zipkin-go &>>$LOG && go get github.com/openzipkin/zipkin-go/middleware/http &>>$LOG && go get github.com/openzipkin/zipkin-go/reporter/http &>>$LOG
fi
Stat $?

Head "Building Package"
cd /go  && cd src && cd login && export GOPATH=/go && go get
go build &>>$LOG
Stat $?

Head "Restarting Services"
systemctl daemon-reload &>>$LOG && systemctl start login && systemctl enable login &>>$LOG
Stat $?