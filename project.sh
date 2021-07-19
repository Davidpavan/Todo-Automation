#! /bin/bash

ssh ubuntu@redis.pavanzs.online "git clone https://github.com/Davidpavan/Todo-Automation.git ; cd Todo-automation ; sudo bash Todo.sh redis"

ssh ubuntu@todo.pavanzs.online "git clone https://github.com/Davidpavan/Todo-Automation.git ; cd Todo-automation ; sudo bash Todo.sh todo"

ssh ubuntu@users.pavanzs.online "git clone https://github.com/Davidpavan/Todo-Automation.git ; cd Todo-automation ; sudo bash Todo.sh users"

ssh ubuntu@login.pavanzs.online "git clone https://github.com/Davidpavan/Todo-Automation.git ; cd Todo-automation ; sudo bash Todo.sh login"

ssh ubuntu@frontend.pavanzs.online "git clone https://github.com/Davidpavan/Todo-Automation.git ; cd Todo-automation ; sudo bash Todo.sh frontend"