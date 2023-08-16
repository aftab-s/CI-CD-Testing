#!/bin/bash
cd /var/www/html
git pull origin main
sudo systemctl restart apache2
