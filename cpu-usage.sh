#!/bin/bash

echo "===== SYSTEM MONITOR ====="
echo ""

echo "Top processes by CPU usage:"
ps -eo pid,comm,%cpu,%mem --sort=-%cpu | head -n 10

echo ""
read -p "Enter PID to kill (or press Enter to skip): " pid

if [ -n "$pid" ]; then
    echo "Killing process $pid..."
    sudo kill -9 $pid
    echo "Process killed."
else
    echo "No process selected."
fi