#!/bin/bash

echo "=== Server status check ==="

echo
echo "Checking Apache..."
if systemctl is-active --quiet apache2; then
    echo "Apache is running."
else
    echo "Apache is NOT running."
fi

echo
echo "Checking MariaDB..."
if systemctl is-active --quiet mariadb; then
    echo "MariaDB is running."
else
    echo "MariaDB is NOT running."
fi

echo
echo "Checking disk space..."
df -h /

echo
echo "Checking local web server..."
if curl -I --max-time 5 http://localhost; then
    echo "Web server responded."
else
    echo "Web server did not respond."
fi

echo
echo "=== Check completed ==="
