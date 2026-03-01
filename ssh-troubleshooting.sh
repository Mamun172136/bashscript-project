#!/bin/bash
USER=$1

echo "Checking user..."
id $USER

echo "Checking .ssh directory..."
ls -ld /home/$USER/.ssh

echo "Checking authorized_keys..."
ls -l /home/$USER/.ssh/authorized_keys

echo "Checking SSH service..."
sudo systemctl status sshd | head -10