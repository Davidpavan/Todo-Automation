#! /bin/bash

ssh ubuntu@172.31.10.169 "git clone https://github.com/Davidpavan/Todo-Automation.git ; cd Todo-automation ; sudo bash Todo.sh redi"

ssh ubuntu@172.31.13.243 "git clone https://github.com/Davidpavan/Todo-Automation.git ; cd Todo-automation ; sudo bash Todo.sh todo"

ssh ubuntu@172.31.9.83 "git clone https://github.com/Davidpavan/Todo-Automation.git ; cd Todo-automation ; sudo bash Todo.sh users"

ssh ubuntu@172.31.2.35 "git clone https://github.com/Davidpavan/Todo-Automation.git ; cd Todo-automation ; sudo bash Todo.sh login"

ssh ubuntu@172.31.4.190 "git clone https://github.com/Davidpavan/Todo-Automation.git ; cd Todo-automation ; sudo bash Todo.sh frontend"