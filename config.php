<?php
define('CURRENCY', 'Ksh');
define('ROOT_PATH', '/xampp/htdocs/pms/');
define('WEB_URL', 'http://localhost/pms/');

define('DB_HOSTNAME', 'localhost');
define('DB_USERNAME', 'root');
define('DB_PASSWORD', '');
define('DB_DATABASE', 'pms_db');
$link = mysqli_connect(DB_HOSTNAME,DB_USERNAME,DB_PASSWORD) or die(mysqli_error($link));
mysqli_select_db($link,DB_DATABASE) or die(mysqli_error($link));?>
