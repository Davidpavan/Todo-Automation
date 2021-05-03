#!/bin/bash

Head "Installing golang"

wget -c https://dl.google.com/go/go1.14.2.linux-amd64.tar.gz -O - | sudo tar -xz -C /usr/local &>>$LOG

Head "Adjusting the Path Variable"

export PATH=$PATH:/usr/local/go/bin && source ~/.profile && go version &>>$LOG
Stat $?

Head "Getting Started with Go"

mkdir /go && cd /go && mkdir src && cd src
git clone https://github.com/Davidpavan/login.git  &>>$LOG
cd login && export GOPATH=/go && go get && go build
mv /root/login/login.service /etc/systemd/system/login.service
Stat $?

Head "Starting Login Service"

systemctl daemon-reload && systemctl enable login &>>$LOG && systemctl start login
Stat $?