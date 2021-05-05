#!/bin/bash

source components/common.sh

OS_PREREQ

Head "Installing golang"
cd /root
wget -c https://dl.google.com/go/go1.14.2.linux-amd64.tar.gz -O - | sudo tar -xz -C /usr/local &>>$LOG
export PATH=$PATH:/usr/local/go/bin
source ~/.profile
Stat $?
Head "version of golang"
go version
Stat $?
Head "To create a directory"
    mkdir /go && cd /go
Head "To clone the git Repo in to login"
git clone https://github.com/Davidpavan/login.git &>>$LOG
cd login && export GOPATH=/go
apt install go-dep &>>$LOG
Stat $?
Head "to build the golang"
go get
go build
Stat $?
Head "To create a systemd file"
 mv login.service /etc/systemd/system/login.service
Head "To start a service"
systemctl daemon-reload &&
service login start &&
service login restart &&
service login status
Stat $?