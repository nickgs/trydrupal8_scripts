<?php 

$host = shell_exec("sh spin_drupal.sh 172.17.42.1 49153 80 172.17.42.1");

$host = substr($host, 0, 12);
$host = $host . ".trydrupal8.dev";

echo "<a href='http://$host:8081'>$host</a>";

