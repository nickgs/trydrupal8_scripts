#!/bin/bash

#script to kill running docker images of a specific type after a specific time period.

docker ps | grep 'hours ago' | grep 'testd8' | awk '{if($4 > 24) print $1 }' | while read line 
do
 #stop the instance.
 logger "[td8] Killing $line.trydrupal8.com"  
 docker kill $line & 
done
