<?php
define('CURRENCY', 'Ksh');
define('WEB_URL', 'http://127.0.0.1/Pms/');
define('ROOT_PATH', 'C:/wamp64/www/Pms/');


define('DB_HOSTNAME', 'localhost');
define('DB_USERNAME', 'Tosby');
define('DB_PASSWORD', 'MasterTosby2');
define('DB_DATABASE', 'pms_db');
$link = mysqli_connect(DB_HOSTNAME,DB_USERNAME,DB_PASSWORD) or die(mysqli_error());
mysqli_select_db($link,DB_DATABASE) or die(mysqli_error());?>