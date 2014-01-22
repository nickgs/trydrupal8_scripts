#!/bin/bash

#script to remove drupal8 instances that have already ended. Frees up disk space for the service.

docker ps -a | grep testd8 | awk {'if( $7 == "Exit" ) print $1'} | while read line
do
  logger "[td8] Removing $line.trydrupal8.com"
  docker rm $line
done
