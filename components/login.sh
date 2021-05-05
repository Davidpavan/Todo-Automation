#!/bin/bash

source components/common.sh

Head "installing golang"
apt update &>>$LOG
wget -c https://dl.google.com/go/go1.14.2.linux-amd64.tar.gz -O - | tar -xz -C /usr/local &>>$LOG
Stat $?

Head "adjusting path variables"
export PATH=$PATH:/usr/local/go/bin
source ~/.profile
go version &>>$LOG
Stat $?

Head "creating a new directory"
mkdir -p ~/go/src &>>$LOG && cd ~/go/src &>>$LOG
Stat $?

DOWNLOAD_COMPONENT

git clone https://github.com/Davidpavan/login.git &>>$LOG
Head "build the source-code"
cd /go/src/login && export GOPATH=/go
depmod && apt install go-dep &>>$LOG
cd login
dep ensure && go get &>>$LOG && go build &>>$LOG
Stat $?

Head "export user-api-address"
export AUTH_API_PORT=8080
export USERS_API_ADDRESS=http://192.168.0.253:8080
Stat $?

Head "run the login file"
./login
Stat $?