<?php
include("../config.php");
$log_message = 'It works';
            error_log($log_message . "On:" . date("l jS \of F, Y, h:i:s A P") . "\n", 3, ROOT_PATH .'Logs/activity.log');
            
?>
