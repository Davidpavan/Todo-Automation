#! /bin/bash

sshpass -p 'DevOps321' ssh ubuntu@192.168.0.38 "git clone https://github.com/Davidpavan/Todo-Automation.git ; cd Todo-Automation ; sudo bash Todo.sh frontend"

sshpass -p 'DevOps321' ssh ubuntu@192.168.0.120 "git clone https://github.com/Davidpavan/Todo-Automation.git ; cd Todo-Automation ; sudo bash Todo.sh login"

sshpass -p 'DevOps321' ssh ubuntu@192.168.0.67 "git clone https://github.com/Davidpavan/Todo-Automation.git ; cd Todo-Automation ; sudo bash Todo.sh users"

sshpass -p 'DevOps321' ssh ubuntu@192.168.0.51 "git clone https://github.com/Davidpavan/Todo-Automation.git ; cd Todo-Automation ; sudo bash Todo.sh todo"

sshpass -p 'DevOps321' ssh ubuntu@192.168.0.4 "git clone https://github.com/Davidpavan/Todo-Automation.git ; cd Todo-Automation ; sudo bash Todo.sh redis"
