<?php
define('CURRENCY', 'Ksh');
define('ROOT_PATH', '/wamp/www/pms/');
define('WEB_URL', 'http://localhost:8082/pms/');

define('DB_HOSTNAME', 'localhost');
define('DB_USERNAME', 'Tosby');
define('DB_PASSWORD', 'MasterTosby2');
define('DB_DATABASE', 'pms_db');
$link = mysqli_connect(DB_HOSTNAME,DB_USERNAME,DB_PASSWORD) or die(mysql_error());
mysqli_select_db($link,DB_DATABASE) or die(mysql_error());?>
