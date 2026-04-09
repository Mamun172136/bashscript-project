#!/bin/bash

# -------------------------------
# Log File Analysis Script
# -------------------------------

# User-defined variables
SERVICE=${1:-nginx}           # Default service to check is nginx
DAYS=${2:-1}                  # Default to last 1 day
OUTPUT_FILE="log_report.txt"

echo "Log Analysis Report" > $OUTPUT_FILE
echo "===================" >> $OUTPUT_FILE
echo "Service: $SERVICE" >> $OUTPUT_FILE
echo "Date: $(date)" >> $OUTPUT_FILE
echo "" >> $OUTPUT_FILE

# 1️⃣ Check system logs for errors
echo "Last 20 system errors:" >> $OUTPUT_FILE
sudo grep -i "error" /var/log/syslog | tail -20 >> $OUTPUT_FILE
echo "" >> $OUTPUT_FILE

# 2️⃣ Check service-specific logs using journalctl
echo "Errors from $SERVICE service in last $DAYS day(s):" >> $OUTPUT_FILE
sudo journalctl -u $SERVICE --since "$DAYS day ago" --no-pager | grep -i "error" >> $OUTPUT_FILE
echo "" >> $OUTPUT_FILE

# 3️⃣ Optional: Filter logs for a specific date range
# Example: Uncomment and set your dates
# sudo journalctl --since "2026-01-01" --until "2026-01-02" --no-pager | grep -i "error" >> $OUTPUT_FILE

echo "Report generated: $OUTPUT_FILE"