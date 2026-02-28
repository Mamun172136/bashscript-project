#!/bin/bash

top

ps -eo pid,comm,%cpu,%mem --sort=-%cpu | head
sudo kill -9 <pid>