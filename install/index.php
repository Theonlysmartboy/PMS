<?php
//system installation file
define('DIR_APPLICATION', str_replace('\'', '/', realpath(dirname(__FILE__))) . '/');
define('DIR_PMS', str_replace('\'', '/', realpath(DIR_APPLICATION . '../')) . '/');
$success_token = '';
$base_url = home_base_url();
if($_SERVER['REQUEST_METHOD'] == 'POST'){
	$options = array(
		'server'		=> $base_url,
		'root'			=> DIR_PMS,
		'db_host'		=> trim($_POST['txtHostName']),
		'db_user'		=> trim($_POST['txtDBUserName']),
		'db_password'	=> trim($_POST['txtPassword']),
		'db_name'		=> trim($_POST['txtDBName'])
	);
	if(importDatabase(trim($_POST['txtHostName']),trim($_POST['txtDBName']),trim($_POST['txtDBUserName']),trim($_POST['txtPassword']))){
		write_config_files($options);
		$success_token = 'PROPERTY MANAGEMENT SYSTEM SETUP SUCCESSFULL <br/><a href="'.$base_url.'">Go to Website</a>';
	}
	else{
		$success_token = 'Error Occured Please Enter Valid Database Access Information !!!!!';
	}
}

function importDatabase($mysql_host,$mysql_database,$mysql_user,$mysql_password){
	$db = new PDO("mysql:host=$mysql_host;dbname=$mysql_database", $mysql_user, $mysql_password);
	$query = file_get_contents("pms_db.sql");
	$stmt = $db->prepare($query);
	if ($stmt->execute())
		 return true;
	else 
		 return false;
}

function write_config_files($options) {
	$output  = '<?php' . "\n";
	$output .= 'define(\'CURRENCY\', \'Ksh\');' . "\n";
	$output .= 'define(\'WEB_URL\', \'' . $options['server'] . '\');' . "\n";
	$output .= 'define(\'ROOT_PATH\', \'' . $options['root'] . '\');' . "\n\n\n";
	
	$output .= 'define(\'DB_HOSTNAME\', \'' . addslashes($options['db_host']) . '\');' . "\n";
	$output .= 'define(\'DB_USERNAME\', \'' . addslashes($options['db_user']) . '\');' . "\n";
	$output .= 'define(\'DB_PASSWORD\', \'' . addslashes($options['db_password']) . '\');' . "\n";
	$output .= 'define(\'DB_DATABASE\', \'' . addslashes($options['db_name']) . '\');' . "\n";
	$output .= '$link = mysql_connect(DB_HOSTNAME,DB_USERNAME,DB_PASSWORD) or die(mysql_error());';
	$output .= 'mysql_select_db(DB_DATABASE, $link) or die(mysql_error());';
	$output .= '?>';

	$file = fopen($options['root'] . 'config.php', 'w');

	fwrite($file, $output);

	fclose($file);
}

function home_base_url(){   
	$base_url = (isset($_SERVER['HTTPS']) &&
	$_SERVER['HTTPS']!='off') ? 'https://' : 'http://';
	$tmpURL = dirname(__FILE__);
	$tmpURL = str_replace(chr(92),'/',$tmpURL);
	$tmpURL = str_replace($_SERVER['DOCUMENT_ROOT'],'',$tmpURL);
	$tmpURL = ltrim($tmpURL,'/');
	$tmpURL = rtrim($tmpURL, '/');
	$tmpURL = str_replace('install','',$tmpURL);
	$base_url .= $_SERVER['HTTP_HOST'].'/'.$tmpURL;
	return $base_url; 
}

?>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head><meta http-equiv="Content-Type" content="text/html; charset=windows-1252">

<title>PMS INSTALL</title>
</head>
<body>
<br/>
<div align="center"><a href="https://www.facebook.com/otelmaltd/" target="_blank"><img src="PmsLogo.png" width="114" height="114" border="0" style="width:30%;" alt="PROPERTY MANAGEMENT SYSTEM" /></a></div>
<div style="font-weight:bold;font-size:20px;text-align:center;text-decoration:underline;color:#0e2058;"> Property Management System Setup Wizard </div>
<br/>
<div align="center" style="width:450px;margin:0 auto;padding:0;">
  <?php if($success_token == ''){ ?>
  <fieldset>
  <legend style="font-size:bold;color:red;font-size:16px;">Path Details</legend>
  <table align="center">
    <tr>
      <td>URL : </td>
      <td><input type="text" size="50" name="txtUrl" id="txtUrl" value="<?php echo $base_url; ?>" /></td>
    </tr>
    <tr>
      <td>Root Path : </td>
      <td><input type="text" size="50" name="txtDocRoot" id="txtDocRoot" value="<?php echo DIR_PMS; ?>" /></td>
    </tr>
  </table>
  </fieldset>
  <br/>
  <fieldset>
  <legend style="font-size:bold;color:red;font-size:16px;">Enter Database Details</legend>
  <form method="post">
    <table align="center">
      <tr>
        <td>Host Name : </td>
        <td><input type="text" name="txtHostName" value="<?php echo $_SERVER['SERVER_NAME']; ?>" id="txtHostName" />
          &nbsp;<span style="color:red;font-weight:bold;">*</span></td>
      </tr>
      <tr>
        <td>Database UserName : </td>
        <td><input type="text" name="txtDBUserName" id="txtDBUserName" />
          &nbsp;<span style="color:red;font-weight:bold;">*</span></td>
      </tr>
      <tr>
        <td>Database Password : </td>
        <td><input type="password" name="txtPassword" id="txtPassword" />
          &nbsp;<span style="color:red;font-weight:bold;">*</span></td>
      </tr>
      <tr>
        <td>Database Name : </td>
        <td><input type="text" name="txtDBName" id="txtDBName" />
          &nbsp;<span style="color:red;font-weight:bold;">*</span></td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td><input type="submit" value="Setup Now" /></td>
      </tr>
    </table>
  </form>
  </fieldset>
  <?php } else { ?>
  <div style="color:#000;background:#FFFFFF;text-align:center;"><?php echo $success_token; ?></div>
  <?php } ?>
</div>
<br/>
<br/>
<div align="center"><a target="_blank" href="http://otemainc.com" style="text-decoration:none;color:#000;font-size:13px;">Copyright &copy; <script>var d = new Date();
                var n = d.getFullYear();
                document.write(n);</script> Otema<sup>TM</sup></a> All rights reserved.</div>
</body>
</html>
