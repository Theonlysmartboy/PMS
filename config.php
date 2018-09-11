<?php
define('CURRENCY', 'Ksh');
define('ROOT_PATH', '/var/www/html/pms/');
define('WEB_URL', 'http://192.168.1.210/pms/');

define('DB_HOSTNAME', 'localhost');
define('DB_USERNAME', 'vidic_pms');
define('DB_PASSWORD', 'sql@VIDIC%18');
define('DB_DATABASE', 'vidic_pms');
$link = mysqli_connect(DB_HOSTNAME,DB_USERNAME,DB_PASSWORD) or die(mysql_error());
mysqli_select_db($link,DB_DATABASE) or die(mysql_error());?>
