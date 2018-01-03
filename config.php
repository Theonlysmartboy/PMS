<?php
define('CURRENCY', '$');
define('WEB_URL', 'http://127.0.0.1/Pms/');
define('ROOT_PATH', 'C:/wamp64/www/Pms/');


define('DB_HOSTNAME', '127.0.0.1');
define('DB_USERNAME', 'Tosby');
define('DB_PASSWORD', 'MasterTosby2');
define('DB_DATABASE', 'ams_mb');
$link = mysqli_connect(DB_HOSTNAME,DB_USERNAME,DB_PASSWORD);
if(!$link){
    die(mysqli_error($link));
}
 else {
    $db= mysqli_select_db($link,DB_DATABASE);
    if(!$db){
    die(mysqli_error($link));
    }
    
}