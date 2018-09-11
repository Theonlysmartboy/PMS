<?php
include('../header.php');
include(ROOT_PATH.'language/'.$lang_code_global.'/lang_add_asset.php');
if(!isset($_SESSION['objLogin']) && $_SESSION['login_type'] == "5"){
	header("Location: " . WEB_URL . "logout.php");
	die();
}
?>
<?php
$delinfo = 'none';
$addinfo = 'none';
$msg = "";
 if(isset($_GET['id']) && $_GET['id'] != '' && $_GET['id'] > 0){
		$sqlx= "DELETE FROM `tbladd_asset` WHERE id = ".$_GET['id'];
		mysqli_query($link,$sqlx); 
		$delinfo = 'block';
	}
if(isset($_GET['m']) && $_GET['m'] == 'add'){
	$addinfo = 'block';
	$msg = $_data['text_18'];
}
if(isset($_GET['m']) && $_GET['m'] == 'up'){
	$addinfo = 'block';
	$msg = $_data['text_19'];
}
?>
<!-- Content Header (Page header) -->

<section class="content-header">
  <h1> <?php echo $_data['text_14'];?> </h1>
  <ol class="breadcrumb">
    <li><a href="<?php echo WEB_URL?>/dashboard.php"><i class="fa fa-dashboard"></i> <?php echo $_data['text_12'];?></a></li>
    <li class="active"><?php echo $_data['text_14'];?></li>
  </ol>
</section>
