#! /bin/bash

ssh ubuntu@172.31.10.145 "git clone https://github.com/Davidpavan/Todo-Automation.git ; cd Todo-automation ; sudo bash Todo.sh redis"

ssh ubuntu@172.31.10.150 "git clone https://github.com/Davidpavan/Todo-Automation.git ; cd Todo-automation ; sudo bash Todo.sh todo"

ssh ubuntu@172.31.15.111 "git clone https://github.com/Davidpavan/Todo-Automation.git ; cd Todo-automation ; sudo bash Todo.sh users"

ssh ubuntu@172.31.2.227 "git clone https://github.com/Davidpavan/Todo-Automation.git ; cd Todo-automation ; sudo bash Todo.sh login"

ssh ubuntu@172.31.3.178 "git clone https://github.com/Davidpavan/Todo-Automation.git ; cd Todo-automation ; sudo bash Todo.sh frontend"