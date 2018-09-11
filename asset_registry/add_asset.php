<?php
include('../header.php');
include(ROOT_PATH.'language/'.$lang_code_global.'/lang_add_asset.php');
if(!isset($_SESSION['objLogin']) && $_SESSION['login_type'] == "5"){
	header("Location: " . WEB_URL . "logout.php");
	die();
}
?>

