#!/bin/bash
service zabbix-server start
service mysql start
php5-fpm
nginx -g 'daemon off;'
