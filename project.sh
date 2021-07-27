#! /bin/bash

sshpass -p 'DevOps321' ssh ubuntu@192.168.0.81 "git clone https://github.com/Davidpavan/Todo-Automation.git ; cd Todo-Automation ; sudo bash Todo.sh frontend"

sshpass -p 'DevOps321' ssh ubuntu@192.168.0.59 "git clone https://github.com/Davidpavan/Todo-Automation.git ; cd Todo-Automation ; sudo bash Todo.sh login"

sshpass -p 'DevOps321' ssh ubuntu@192.168.0.101 "git clone https://github.com/Davidpavan/Todo-Automation.git ; cd Todo-Automation ; sudo bash Todo.sh users"

sshpass -p 'DevOps321' ssh ubuntu@192.168.0.47 "git clone https://github.com/Davidpavan/Todo-Automation.git ; cd Todo-Automation ; sudo bash Todo.sh todo"

sshpass -p 'DevOps321' ssh ubuntu@192.168.0.48 "git clone https://github.com/Davidpavan/Todo-Automation.git ; cd Todo-Automation ; sudo bash Todo.sh redis"
