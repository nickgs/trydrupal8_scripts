#!/bin/bash

#HIPACHE location gets passed in
REDIS_HOST=$1
REDIS_PORT=$2
HIPACHE_PORT=$3
BRIDGE_IP=$4

#start the container and pass in the necessary environment variables for the app to run
DRUPAL8_CONTAINER=$(docker run -d -p 80 -e HIPACHE_PORT=$HIPACHE_PORT -e REDIS_HOST=$REDIS_HOST -e REDIS_PORT=$REDIS_PORT -e DOCKER_HOST=$BRIDGE_IP nickgs/testd8 ./start.sh) 
DRUPAL8_HOST=$BRIDGE_IP
#get the port that the flask app is running on so as to route effectively.
DRUPAL8_PORT=$(docker port $DRUPAL8_CONTAINER 80)

# redis takes a bit of time to load up...
sleep 5

DRUPAL8_CONTAINER=${DRUPAL8_CONTAINER:0:12}
#print out the container ID
echo $DRUPAL8_CONTAINER

#make sure the main hipache knows about our new http://tryrethink.info domain.`
redis-cli -h $REDIS_HOST -p $REDIS_PORT rpush frontend:$DRUPAL8_CONTAINER.trydrupal8.com $DRUPAL8_CONTAINER.trydrupal8
redis-cli -h $REDIS_HOST -p $REDIS_PORT rpush frontend:$DRUPAL8_CONTAINER.trydrupal8.com http://$DRUPAL8_HOST:$DRUPAL8_PORT
