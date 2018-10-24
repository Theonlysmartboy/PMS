<?php
include(__DIR__ . "/config.php");
ob_start();
session_start();
date_default_timezone_set('Africa/Nairobi');
$log_message = 'User: ' . $_SESSION['objLogin']['name'] . ' Logged Out';
error_log($log_message . " On: " . date("l jS \of F, Y, h:i:s A P") . "\n", 3, ROOT_PATH . 'Logs/logins.log');
header("Location: dashboard.php");
session_unset();
session_destroy();
header('Location: index.php');
?>
