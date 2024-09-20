#!/bin/bash
apt update -y
apt install httpd -y
systemctl httpd start
systemctl httpd enable
