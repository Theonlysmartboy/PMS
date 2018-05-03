<?php
define('CURRENCY', 'Ksh');
define('WEB_URL', 'http://ariseandshinecarecenter.com/Pms/');
define('ROOT_PATH', '/home/ariseand/public_html/Pms/');


define('DB_HOSTNAME', 'localhost');
define('DB_USERNAME', 'ariseand_pmsadm1');
define('DB_PASSWORD', 'Osck4[i?UBED%TmUQS');
define('DB_DATABASE', 'ariseand_pms');
$link = mysqli_connect(DB_HOSTNAME,DB_USERNAME,DB_PASSWORD) or die(mysql_error());mysqli_select_db($link,DB_DATABASE) or die(mysql_error());?>