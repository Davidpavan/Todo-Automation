#! /bin/bash

sshpass -p 'DevOps321' ssh ubuntu@172.31.94.106 "git clone https://github.com/Davidpavan/Todo-Automation.git ; cd Todo-Automation ; sudo bash Todo.sh frontend"

sshpass -p 'DevOps321' ssh ubuntu@172.31.91.124 "git clone https://github.com/Davidpavan/Todo-Automation.git ; cd Todo-Automation ; sudo bash Todo.sh login"

sshpass -p 'DevOps321' ssh ubuntu@172.31.86.128 "git clone https://github.com/Davidpavan/Todo-Automation.git ; cd Todo-Automation ; sudo bash Todo.sh users"

sshpass -p 'DevOps321' ssh ubuntu@172.31.90.38 "git clone https://github.com/Davidpavan/Todo-Automation.git ; cd Todo-Automation ; sudo bash Todo.sh todo"

sshpass -p 'DevOps321' ssh ubuntu@172.31.93.77 "git clone https://github.com/Davidpavan/Todo-Automation.git ; cd Todo-Automation ; sudo bash Todo.sh redis"
