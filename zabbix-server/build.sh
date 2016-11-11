#!/bin/bash

docker build -t zabbix-server .
docker run --name zabbix-server zabbix-server
