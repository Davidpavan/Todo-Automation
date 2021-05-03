#!/bin/bash

source components/common.sh


Head "Installing login dependencies"

cd
apt install golang -y &>>$LOG
Stat $?

Head "Cloning Repo"

mkdir /go && cd /go
git clone https://github.com/Davidpavan/login.git &>>$LOG
Stat $?

Head "Navigate Directory"

mv Todo-login login &>>$LOG && cd login && rm -rf login &>>$LOG

Head "Creating Service"

mv login.service /etc/systemd/system/login.service

Head "Get dependencies"

go get github.com/dgrijalva/jwt-go &>>$LOG && go get github.com/labstack/echo &>>$LOG && go get github.com/labstack/echo/middleware &>>$LOG && go get github.com/labstack/gommon/log &>>$LOG && go get github.com/openzipkin/zipkin-go &>>$LOG && go get github.com/openzipkin/zipkin-go/middleware/http &>>$LOG && go get github.com/openzipkin/zipkin-go/reporter/http &>>$LOG
Stat $?

Head "Building Package"

go build &>>$LOG
Stat $?

Head "Restarting Services"

systemctl daemon-reload &>>$LOG && systemctl start login && systemctl enable login &>>$LOG
Stat $?