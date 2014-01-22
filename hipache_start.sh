#!/bin/bash

#dockerd is listening on localhost / docker0

# Reverse Proxy Routing / Main Server

#run the main hipache container
HIPACHE_CONTAINER=$(docker run -d -p 80:80 -p 6379 samalba/hipache /usr/bin/supervisord)

#what port is hipache running on? in case we ever decide to change from -p 80:80
HIPACHE_PORT=$(docker port $HIPACHE_CONTAINER 80)
HIPACHE_BRIDGE=$(docker inspect $HIPACHE_CONTAINER | grep Bridge | cut -d":" -f2 | cut -d'"' -f2)

#this is temporary and fails if you're running containers are on disparate docker hosts
BRIDGE_IP=$(/sbin/ifconfig $HIPACHE_BRIDGE | sed -n '2 p' | awk '{print $2}' | cut -d":" -f2)
 
#get the port that REDIS is running on
REDIS_PORT=$(docker port $HIPACHE_CONTAINER 6379)
REDIS_HOST=$BRIDGE_IP

#export the variables to our envrionment
#export HIPACHE_CONTAINER
#export HIPACHE_PORT 
#export HIPACHE_BRIDGE
#export BRIDGE_IP 
#export REDIS_PORT
#export REDIS_HOST 
