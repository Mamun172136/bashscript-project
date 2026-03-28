#!/bin/bash

echo "=============================="
echo " Disk Usage Overview"
echo "=============================="
df -h

echo ""
echo "=============================="
echo " Top 10 Largest Directories"
echo "=============================="
sudo du -sh /* 2>/dev/null | sort -hr | head -10

echo ""
echo "=============================="
echo " Cleaning Old Log Files (>7 days)"
echo "=============================="
sudo find /var/log -type f -name "*.log" -mtime +7 -delete

echo "Old logs deleted."

echo ""
echo "=============================="
echo " Cleaning Docker System"
echo "=============================="
sudo docker system prune -a --volumes -f

echo "Docker cleanup completed."

echo ""
echo "✅ System cleanup finished!"