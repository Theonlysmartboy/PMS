<?php
define('CURRENCY', 'Ksh');
define('WEB_URL', 'http://127.0.0.1/Pms/');
define('ROOT_PATH', 'C:/wamp64/www/Pms/');


define('DB_HOSTNAME', '127.0.0.1');
define('DB_USERNAME', 'Tosby');
define('DB_PASSWORD', 'MasterTosby2');
define('DB_DATABASE', 'pms_db');
$link = mysqli_connect(DB_HOSTNAME,DB_USERNAME,DB_PASSWORD);
if(!$link){
    die("<script>alert('Could not connect to mysql server please contact admin for assistance');</script>");
}
 else {
    $db= mysqli_select_db($link,DB_DATABASE);
    if(!$db){
    die("<script> alert('Could not load database please contact admin for assistance');</script>");
    }
    
}