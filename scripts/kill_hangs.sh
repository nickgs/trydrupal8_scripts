ps aux | grep 'docker kill' | awk {'print $2'} | while read line
do
  kill $line
done
