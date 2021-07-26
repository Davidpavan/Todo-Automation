#! /bin/bash

sshpass -p 'DevOps321' ssh ubuntu@192.168.0.53 "git clone https://github.com/Davidpavan/Todo-Automation.git ; cd Todo-Automation ; sudo bash Todo.sh frontend"

sshpass -p 'DevOps321' ssh ubuntu@192.168.0.5 "git clone https://github.com/Davidpavan/Todo-Automation.git ; cd Todo-Automation ; sudo bash Todo.sh login"

sshpass -p 'DevOps321' ssh ubuntu@192.168.0.103 "git clone https://github.com/Davidpavan/Todo-Automation.git ; cd Todo-Automation ; sudo bash Todo.sh users"

sshpass -p 'DevOps321' ssh ubuntu@192.168.0.15 "git clone https://github.com/Davidpavan/Todo-Automation.git ; cd Todo-Automation ; sudo bash Todo.sh todo"

sshpass -p 'DevOps321' ssh ubuntu@192.168.0.77 "git clone https://github.com/Davidpavan/Todo-Automation.git ; cd Todo-Automation ; sudo bash Todo.sh redis"
