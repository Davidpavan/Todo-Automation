#! /bin/bash

sshpass -p 'DevOps321' ssh ubuntu@172.31.49.161 "git clone https://github.com/Davidpavan/Todo-Automation.git ; cd Todo-Automation ; sudo bash Todo.sh frontend"

sshpass -p 'DevOps321' ssh ubuntu@172.31.12.15 "git clone https://github.com/Davidpavan/Todo-Automation.git ; cd Todo-Automation ; sudo bash Todo.sh login"

sshpass -p 'DevOps321' ssh ubuntu@172.31.63.127 "git clone https://github.com/Davidpavan/Todo-Automation.git ; cd Todo-Automation ; sudo bash Todo.sh users"

sshpass -p 'DevOps321' ssh ubuntu@172.31.63.41 "git clone https://github.com/Davidpavan/Todo-Automation.git ; cd Todo-Automation ; sudo bash Todo.sh todo"

sshpass -p 'DevOps321' ssh ubuntu@172.31.58.201 "git clone https://github.com/Davidpavan/Todo-Automation.git ; cd Todo-Automation ; sudo bash Todo.sh redis"
