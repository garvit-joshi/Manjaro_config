#!/bin/bash

echo "XAMPP Application Server"
sudo /opt/lampp/lampp start
cd /opt/lampp
# Run XAMPP
echo "phpMyAdmin: https://localhost/phpmyadmin/"
sudo ./manager-linux-x64.run
sudo /opt/lampp/lampp stop


echo "XAMPP Application Server Stopped"
