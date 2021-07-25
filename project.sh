#! /bin/bash

# ssh ubuntu@redis.pavanzs.online "git clone https://github.com/Davidpavan/Todo-Automation.git ; cd Todo-Automation ; sudo bash Todo.sh redis"

#ssh ubuntu@todo.pavanzs.online "git clone https://github.com/Davidpavan/Todo-Automation.git ; cd Todo-Automation ; sudo bash Todo.sh todo"

#ssh ubuntu@users.pavanzs.online "git clone https://github.com/Davidpavan/Todo-Automation.git ; cd Todo-Automation ; sudo bash Todo.sh users"

#ssh ubuntu@login.pavanzs.online "git clone https://github.com/Davidpavan/Todo-Automation.git ; cd Todo-Automation ; sudo bash Todo.sh login"

ssh ubuntu@192.168.0.111 sshpass -p "DevOps321" "git clone https://github.com/Davidpavan/Todo-Automation.git ; cd Todo-Automation ; sudo bash Todo.sh frontend"