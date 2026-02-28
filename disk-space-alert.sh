#!bin/bash

df-h
sudo du-sh /* 2>/dev/null | sort-hr | head-10
sudo find /var/log -type f -name "*.log"-mtime +7-delete
sudo docker system prune-a--volumes