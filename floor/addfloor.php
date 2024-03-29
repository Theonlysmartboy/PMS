<?php
include('../header.php');
include(ROOT_PATH . 'language/' . $lang_code_global . '/lang_add_floor.php');
if (!isset($_SESSION['objLogin'])) {
    header("Location: " . WEB_URL . "logout.php");
    die();
}
$success = "none";
$floor_no = '';
$branch_id = '';
$title = 'Add New Floor';
$button_text = $_data['save_button_text'];
$successful_msg = "Add Floor Successfully";
$form_url = WEB_URL . "floor/addfloor.php";
$id = "";
$hdnid = "0";

if (isset($_POST['txtFloor'])) {
    if (isset($_POST['hdn']) && $_POST['hdn'] == '0') {

        $sql = "INSERT INTO `tbl_add_floor`(floor_no,`branch_id`) values('$_POST[txtFloor]','" . $_SESSION['objLogin']['branch_id'] . "')";
        //echo $sql;
        //die();
        mysqli_query($link, $sql);
        mysqli_close($link);
        $url = WEB_URL . 'floor/floorlist.php?m=add';
        header("Location: $url");
    } else {

        $sql = "UPDATE `tbl_add_floor` SET `floor_no`='" . $_POST['txtFloor'] . "' WHERE fid='" . $_GET['id'] . "'";
        mysqli_query($link, $sql);
        $url = WEB_URL . 'floor/floorlist.php?m=up';
        header("Location: $url");
    }

    $success = "block";
}

if (isset($_GET['id']) && $_GET['id'] != '') {
    $result = mysqli_query($link, "SELECT * FROM tbl_add_floor where fid = '" . $_GET['id'] . "'");
    while ($row = mysqli_fetch_array($result)) {

        $floor_no = $row['floor_no'];
        $hdnid = $_GET['id'];
        $title = 'Update Floor';
        $button_text = $_data['update_button_text'];
        $successful_msg = "Update Floor Successfully";
        $form_url = WEB_URL . "floor/addfloor.php?id=" . $_GET['id'];
    }

    //mysql_close($link);
}
if (isset($_GET['mode']) && $_GET['mode'] == 'view') {
    $title = 'View Floor Details';
}
?>
<!-- Content Header (Page header) -->

<section class="content-header">
    <h1><?php echo $_data['add_new_floor_top_title']; ?></h1>
    <ol class="breadcrumb">
        <li><a href="<?php echo WEB_URL ?>dashboard.php"><i class="fa fa-dashboard"></i><?php echo $_data['home_breadcam']; ?></a></li>
        <li class="active"><?php echo $_data['add_new_floor_information_breadcam']; ?></li>
        <li class="active"><?php echo $_data['add_new_add_floor_breadcam']; ?></li>
    </ol>
</section>
<!-- Main content -->
<section class="content">
    <!-- Full Width boxes (Stat box) -->
    <div class="row">
        <div class="col-md-12">
            <div align="right" style="margin-bottom:1%;"> <a class="btn btn-primary" title="" data-toggle="tooltip" href="<?php echo WEB_URL; ?>floor/floorlist.php" data-original-title="<?php echo $_data['back_text']; ?>"><i class="fa fa-reply"></i></a> </div>
            <div class="box box-info">
                <div class="box-header">
                    <h3 class="box-title"><?php echo $_data['add_new_floor_entry_text']; ?></h3>
                    <form onSubmit="return validateMe();" action="<?php echo $form_url; ?>" method="post" enctype="multipart/form-data">
                        <div class="box-body">
                            <div class="form-group">
                                <label for="txtFloor"><?php echo $_data['add_new_form_field_text_1']; ?> :</label>
                                <input type="text" name="txtFloor" id="txtFloor" class="form-control" />
                            </div>
                            <div class="form-group pull-right">
                                <input type="submit" name="submit" class="btn btn-primary" value="<?php echo $button_text; ?>"/>
                            </div>
                        </div>
                        <input type="hidden" value="<?php echo $hdnid; ?>" name="hdn"/>
                    </form>
                </div>

                <!-- /.box-body -->
            </div>
            <!-- /.box -->
        </div>
    </div>
    <!-- /.row -->
</section>

<script type="text/javascript">
    function validateMe() {
        if ($("#txtFloor").val() == '') {
            alert("Floor No Required!!!");
            $("#txtFloor").focus();
            return false;
        } else {
            return true;
        }
    }
</script>
<?php include('../footer.php'); ?>
