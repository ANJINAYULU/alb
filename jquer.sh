#!/bin/bash
yum update -y
yum install httpd -y
systemctl start httpd
systemctl enable httpd
wget https://www.free-css.com/assets/files/free-css-templates/download/page273/spourmo.zip
unzip spourmo.zip
cd spourmo/
cp -r * /var/www/html/