#!/bin/bash

echo "====================================="
echo " NGINX APPLICATION PORT CHECK SCRIPT "
echo "====================================="

# 1. Check if ports 80 or 443 are listening
echo -e "\n[1] Checking if ports 80 or 443 are listening..."
sudo ss -tulpn | grep -E ':80|:443'

if [ $? -ne 0 ]; then
    echo "⚠️  Ports 80/443 are NOT listening!"
else
    echo "✅ Ports 80/443 are active."
fi

# 2. Test local HTTP response
echo -e "\n[2] Testing local HTTP response..."
curl -I http://localhost 2>/dev/null

if [ $? -ne 0 ]; then
    echo "⚠️  Cannot reach localhost via HTTP."
else
    echo "✅ Localhost is responding."
fi

# 3. Check Nginx service status
echo -e "\n[3] Checking Nginx service status..."
sudo systemctl status nginx --no-pager

# 4. Test Nginx configuration
echo -e "\n[4] Testing Nginx configuration syntax..."
sudo nginx -t

if [ $? -ne 0 ]; then
    echo "❌ Nginx configuration has errors!"
else
    echo "✅ Nginx configuration is valid."
fi

# 5. Check firewall rules (Firewalld)
echo -e "\n[5] Checking firewall configuration..."
sudo firewall-cmd --list-all 2>/dev/null

if [ $? -ne 0 ]; then
    echo "⚠️  Firewalld may not be installed or running."
else
    echo "✅ Firewall rules displayed above."
fi

echo -e "\n====================================="
echo "        CHECK COMPLETED"
echo "====================================="