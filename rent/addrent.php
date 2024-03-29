<?php
include('../header.php');
include('../utility/common.php');
include(ROOT_PATH . 'language/' . $lang_code_global . '/lang_add_rented.php');
if (!isset($_SESSION['objLogin'])) {
    header("Location: " . WEB_URL . "logout.php");
    die();
}
$success = "none";
$r_name = '';
$r_email = '';
$r_contact = '';
$r_address = '';
$r_nid = '';
$r_floor_no = 0;
$r_unit_no = 0;
$r_advance = '';
$r_rent_pm = '';
$r_date = '';
$r_month = '';
$r_year = '';
$r_password = '';
$r_status = '0';
$branch_id = '';
$title = $_data['add_new_renter'];
$button_text = $_data['save_button_text'];
$successful_msg = $_data['added_renter_successfully'];
$form_url = WEB_URL . "rent/addrent.php";
$id = "";
$hdnid = "0";
$image_rnt = WEB_URL . 'img/no_image.jpg';
$img_track = '';
$password = 'owner@vidic%Pms';
$r_gone_date = '';
if (isset( $_POST['txtRName'])) {
    if (isset($_POST['hdn']) && $_POST['hdn'] == '0') {
        $r_password = mysqli_real_escape_string($link, $_POST['txtPassword']);
        $image_url = uploadImage();
        if (isset( $_POST['chkRStatus'])) {
            $r_status = 1;
        }
        $sql = "INSERT INTO tbl_add_rent(r_name,r_email,r_contact,r_address,r_nid,r_floor_no,r_unit_no,r_advance,r_rent_pm,r_date,r_month,r_year,r_gone_date,r_password,r_status,image,branch_id) values('$_POST[txtRName]','$_POST[txtREmail]','$_POST[txtRContact]','$_POST[txtRAddress]','$_POST[txtRentedNID]','$_POST[ddlFloorNo]','$_POST[ddlUnitNo]','$_POST[txtRAdvance]','$_POST[txtRentPerMonth]','$_POST[txtRDate]','$_POST[ddlMonth]','$_POST[ddlYear]','$_POST[txtRExpiry]','$r_password','$r_status','$image_url','" . $_SESSION['objLogin']['branch_id'] . "')";
        if (mysqli_query($link, $sql)) {
            //update unit status
            $sqlx = "UPDATE `tbl_add_unit` set status = 1 where floor_no = '" . (int) mysqli_real_escape_string($link, $_POST['ddlFloorNo']) . "' and uid = '" . (int) mysqli_real_escape_string($link, $_POST['ddlUnitNo']) . "'";
            if (mysqli_query($link, $sqlx)) {
                ////////////////////////
                mysqli_close($link);
                $url = WEB_URL . 'rent/rentlist.php?m=add';
                header("Location: $url");
            } else {
                $error = 'Addd rent Error No: ' . mysqli_errno($link) . ': ' . mysqli_error($link);
                error_log($error . "Date:" . date("l jS \of F, Y, h:i:s A") . "\n", 3, ROOT_PATH . 'Logs/sql-errors.log');
                exit();
            }
        } else {
            $error = 'Add rent Error No: ' . mysqli_errno($link) . ': ' . mysqli_error($link);
            error_log($error . "Date:" . date("l jS \of F, Y, h:i:s A") . "\n", 3, ROOT_PATH . 'Logs/sql-errors.log');
            exit();
        }
    } else {
        $image_url = uploadImage();
        if ($image_url == '') {
            $image_url = mysqli_real_escape_string($link, $_POST['img_exist']);
        }
        if (isset($_POST['chkRStatus'])) {
            $r_status = 1;
        }
        $sql = "UPDATE `tbl_add_rent` SET `r_name`='" . mysqli_real_escape_string($link, $_POST['txtRName']) . "',`r_email`='" . mysqli_real_escape_string($link, $_POST['txtREmail']) . "',`r_password`='" . mysqli_real_escape_string($link, $_POST['txtPassword']) . "',`r_contact`='" . mysqli_real_escape_string($link, $_POST['txtRContact']) . "',`r_address`='" . mysqli_real_escape_string($link, $_POST['txtRAddress']) . "',`r_nid`='" . mysqli_real_escape_string($link, $_POST['txtRentedNID']) . "',`r_floor_no`='" . mysqli_real_escape_string($link, $_POST['ddlFloorNo']) . "',`r_unit_no`='" . mysqli_real_escape_string($link, $_POST['ddlUnitNo']) . "',`r_advance`='" . mysqli_real_escape_string($link, $_POST['txtRAdvance']) . "',`r_rent_pm`='" . mysqli_real_escape_string($link, $_POST['txtRentPerMonth']) . "',`r_date`='" . mysqli_real_escape_string($link, $_POST['txtRDate']) . "',`r_month`='" . mysqli_real_escape_string($link, $_POST['ddlMonth']) . "',`r_year`='" . mysqli_real_escape_string($link, $_POST['ddlYear']) . "',`r_status`='" . $r_status . "',`image`='" . $image_url . "' WHERE rid='" . $_GET['id'] . "'";
        mysqli_query($link, $sql);
        //update unit status
        $sqlx = "UPDATE `tbl_add_unit` set status = 0 where floor_no = '" . (int) mysqli_real_escape_string($link, $_POST['hdnFloor']) . "' and uid = '" . (int) mysqli_real_escape_string($link, $_POST['hdnUnit']) . "'";
        mysqli_query($link, $sqlx);
        $sqlxx = "UPDATE `tbl_add_unit` set status = 1 where floor_no = '" . (int) mysqli_real_escape_string($link, $_POST['ddlFloorNo']) . "' and uid = '" . (int) mysqli_real_escape_string($link, $_POST['ddlUnitNo']) . "'";
        mysqli_query($link, $sqlxx);
        ///////////////////////////////////////////
        $url = WEB_URL . 'rent/rentlist.php?m=up';
        header("Location: $url");
    }

    $success = "block";
}

if (isset($_GET['id']) && $_GET['id'] != '') {
    $result = mysqli_query($link, "SELECT * FROM tbl_add_rent where rid = '" . $_GET['id'] . "'");
    while ($row = mysqli_fetch_array($result)) {
        $r_name = $row['r_name'];
        $r_email = $row['r_email'];
        $r_contact = $row['r_contact'];
        $r_address = $row['r_address'];
        $r_nid = $row['r_nid'];
        $r_floor_no = $row['r_floor_no'];
        $r_unit_no = $row['r_unit_no'];
        $r_advance = $row['r_advance'];
        $r_rent_pm = $row['r_rent_pm'];
        $r_date = $row['r_date'];
        $r_month = $row['r_month'];
        $r_year = $row['r_year'];
        $r_status = $row['r_status'];
        $r_password = $row['r_password'];
        if ($row['image'] != '') {
            $image_rnt = WEB_URL . 'img/upload/' . $row['image'];
            $img_track = $row['image'];
        }
        $hdnid = $_GET['id'];
        $title = $_data['update_rent'];
        $button_text = $_data['update_button_text'];
        $successful_msg = $_data['update_renter_successfully'];
        $form_url = WEB_URL . "rent/addrent.php?id=" . $_GET['id'];
    }

    mysqli_close($link);
}

//for image upload
function uploadImage() {
    if ((!empty($_FILES["uploaded_file"])) && ($_FILES['uploaded_file']['error'] == 0)) {
        $filename = basename($_FILES['uploaded_file']['name']);
        $ext = substr($filename, strrpos($filename, '.') + 1);
        if (($ext == "jpg" && $_FILES["uploaded_file"]["type"] == 'image/jpeg') || ($ext == "png" && $_FILES["uploaded_file"]["type"] == 'image/png') || ($ext == "gif" && $_FILES["uploaded_file"]["type"] == 'image/gif')) {
            $temp = explode(".", $_FILES["uploaded_file"]["name"]);
            $newfilename = NewGuid() . '.' . end($temp);
            move_uploaded_file($_FILES["uploaded_file"]["tmp_name"], ROOT_PATH . '/img/upload/' . $newfilename);
            return $newfilename;
        } else {
            return '';
        }
    }
    return '';
}

function NewGuid() {
    $s = strtoupper(md5(uniqid(rand(), true)));
    $guidText = substr($s, 0, 8) . '-' .
            substr($s, 8, 4) . '-' .
            substr($s, 12, 4) . '-' .
            substr($s, 16, 4) . '-' .
            substr($s, 20);
    return $guidText;
}
?>
<!-- Content Header (Page header) -->
<section class="content-header">
    <h1><?php echo $_data['add_new_renter']; ?></h1>
    <ol class="breadcrumb">
        <li><a href="<?php echo WEB_URL ?>dashboard.php"><i class="fa fa-dashboard"></i><?php echo $_data['home_breadcam']; ?></a></li>
        <li class="active"><?php echo $_data['add_new_renter_information_breadcam']; ?></li>
        <li class="active"><?php echo $_data['add_new_renter_breadcam']; ?></li>
    </ol>
</section>
<!-- Main content -->
<section class="content">
    <!-- Full Width boxes (Stat box) -->
    <div class="row">
        <div class="col-md-12">
            <div align="right" style="margin-bottom:1%;"> <a class="btn btn-primary" title="" data-toggle="tooltip" href="<?php echo WEB_URL; ?>rent/rentlist.php" data-original-title="<?php echo $_data['back_text']; ?>"><i class="fa fa-reply"></i></a> </div>
            <div class="box box-info">
                <div class="box-header">
                    <h3 class="box-title"><?php echo $_data['add_new_renter_entry_form']; ?></h3>
                    <form onSubmit="return validateMe();" action="<?php echo $form_url; ?>" method="post" enctype="multipart/form-data">
                        <div class="box-body">
                            <div class="form-group">
                                <label for="txtRName"><?php echo $_data['add_new_form_field_text_1']; ?> :</label>
                                <input type="text" name="txtRName" id="txtRName" class="form-control" />
                            </div> 
                            <div class="form-group">
                                <label for="txtREmail"><?php echo $_data['add_new_form_field_text_2']; ?> :</label>
                                <input type="email" name="txtREmail" id="txtREmail" class="form-control" />
                            </div>
                            <div class="form-group">
                                <label for="txtRContact"><?php echo $_data['add_new_form_field_text_4']; ?> :</label>
                                <input type="text" name="txtRContact" id="txtRContact" class="form-control" />
                            </div>
                            <div class="form-group">
                                <label for="txtRAddress"><?php echo $_data['add_new_form_field_text_5']; ?> :</label>
                                <input type="text" name="txtRAddress" id="txtRAddress" class="form-control" />
                            </div> 
                            <div class="form-group">
                                <label for="txtRentedNID"><?php echo $_data['add_new_form_field_text_6']; ?> :</label>
                                <input type="text" name="txtRentedNID" id="txtRentedNID" class="form-control" />
                            </div>
                            <div class="form-group">
                                <label for="ddlFloorNo"><?php echo $_data['add_new_form_field_text_7']; ?> :</label>
                                <select onchange="getUnitReport(this.value)" name="ddlFloorNo" id="ddlFloorNo" class="form-control">
                                    <option value="">--<?php echo $_data['add_new_form_field_text_7']; ?>--</option>
                                    <?php
                                    $result_floor = mysqli_query($link, "SELECT * FROM tbl_add_floor order by fid ASC");
                                    while ($row_floor = mysqli_fetch_array($result_floor)) {
                                        ?>
                                        <option <?php
                                        if ($r_floor_no == $row_floor['fid']) {
                                            echo 'selected';
                                        }
                                        ?> value="<?php echo $row_floor['fid']; ?>">
                                            <?php echo $row_floor['floor_no']; ?></option>
                                    <?php } ?>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="ddlUnitNo"><?php echo $_data['add_new_form_field_text_8']; ?> :</label>
                                <select name="ddlUnitNo" id="ddlUnitNo" class="form-control">
                                    <option value="">--<?php echo $_data['add_new_form_field_text_8']; ?>--</option>
                                    <?php
                                    $result_unit = mysqli_query($link, "SELECT * FROM tbl_add_unit where floor_no ='" . (int) $row_floor['fid'] . "' order by uid ASC");
                                    while ($row_unit = mysqli_fetch_array($result_unit)) {
                                        ?>
                                        <option <?php
                                        if ($unit_id == $row_unit['uid']) {
                                            echo 'selected';
                                        }
                                        ?> value="<?php echo $row_unit['uid']; ?>"><?php echo $row_unit['unit_no']; ?></option>
                                        <?php } ?>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="txtRAddvance"><?php echo $_data['add_new_form_field_text_9']; ?> :</label>
                                <input type="text" name="txtRAdvance" id="txtRAdvance" class="form-control" required="required" />
                            </div>
                            <div class="form-group">
                                <label for="txtRentPerMonth"><?php echo $_data['add_new_form_field_text_10']; ?> :</label>
                                <input type="text" name="txtRentPerMonth" id="txtRentPerMonth" class="form-control" required="required" placeholder="00.00"/>
                            </div>
                            <div class="form-group">
                                <label for="txtRDate"><?php echo $_data['add_new_form_field_text_11']; ?> :</label>
                                <div class='input-group date' id='datetimepicker10'>
                                    <input type='text' class="form-control" name="txtRDate" id="txtRDate" />
                                    <span class="input-group-addon">
                                        <span class="glyphicon glyphicon-calendar">
                                        </span>
                                    </span>
                                </div>
                            </div>
                            <script type="text/javascript">
                                $(document).ready(function () {
                                    $('#datetimepicker10').datepicker({
                                        viewMode: 'years',
                                        format: 'dd/mm/yyyy'
                                    });
                                });
                            </script>
                            <div class="form-group">
                                <label for="ddlMonth"><?php echo $_data['add_new_form_field_text_12']; ?> :</label>
                                <select name="ddlMonth" id="ddlMonth" class="form-control">
                                    <option value="">--<?php echo $_data['add_new_form_field_text_12']; ?>--</option>
                                    <?php
                                    $result_month = mysqli_query($link, "SELECT * FROM tbl_add_month_setup order by m_id ASC");
                                    while ($row_month = mysqli_fetch_array($result_month)) {
                                        ?>
                                        <option <?php
                                        if ($r_month == $row_month['m_id']) {
                                            echo 'selected';
                                        }
                                        ?> value="<?php echo $row_month['m_id']; ?>"><?php echo $row_month['month_name']; ?></option><?php } ?>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="ddlYear"><?php echo $_data['add_new_form_field_text_13']; ?> :</label>
                                <select name="ddlYear" id="ddlYear" class="form-control">
                                    <option value="">--<?php echo $_data['add_new_form_field_text_13']; ?>--</option>
                                    <?php
                                    $result_month = mysqli_query($link, "SELECT * FROM tbl_add_year_setup order by y_id ASC");
                                    while ($row_month = mysqli_fetch_array($result_month)) {
                                        ?>
                                        <option <?php
                                        if ($r_year == $row_month['xyear']) {
                                            echo 'selected';
                                        }
                                        ?> value="<?php echo $row_month['y_id']; ?>"><?php echo $row_month['xyear']; ?></option><?php } ?>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="txtPassword"><?php echo $_data['add_new_form_field_text_3']; ?> :</label>
                                <input type="password" name="txtPassword" id="txtPassword" class="form-control" value="<?php echo $password; ?>" required="required" readonly="readonly" />
                            </div>
                            <div class="form-group">
                                <label for="chkRStatus"><?php echo $_data['add_new_form_field_text_14']; ?> :</label>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" name="chkRStatus" value="0"><?php echo $_data['add_new_form_field_text_16']; ?>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" name="chkRStatus" value="1"><?php echo $_data['add_new_form_field_text_17']; ?>
                            </div>
                            <div class="form-group">
                                <label for="txtRExpiry"><?php echo $_data['add_new_form_field_text_18']; ?> :</label>
                                <div class='input-group date' id='datetimepicker11'>
                                    <input type='text' class="form-control" name="txtRExpiry" id="txtRExpiry" />
                                    <span class="input-group-addon">
                                        <span class="glyphicon glyphicon-calendar">
                                        </span>
                                    </span>
                                </div>
                            </div>
                            <script type="text/javascript">
                                $(document).ready(function () {
                                    $('#datetimepicker11').datepicker({
                                        viewMode: 'years',
                                        format: 'dd/mm/yyyy'
                                    });
                                });
                            </script>
                            <div class="form-group pull-right">
                                <input type="submit" name="submit" class="btn btn-primary" value="<?php echo $button_text; ?>"/>
                            </div>
                        </div>
                        <input type="hidden" value="<?php echo $hdnid; ?>" name="hdn"/>
                    </form>
                </div>
            </div>

            <!-- /.box-body -->
        </div>
        <!-- /.box -->
    </div>
</div>
<!-- /.row -->
<script type="text/javascript">
    function validateMe() {
        if ($("#txtRName").val() == '') {
            alert("Rented Name Required !!!");
            $("#txtRName").focus();
            return false;
        } else if ($("#txtREmail").val() == '') {
            alert("Email Required !!!");
            $("#txtREmail").focus();
            return false;
        } else if ($("#txtPassword").val() == '') {
            alert("Password Required !!!");
            $("#txtPassword").focus();
            return false;
        } else if ($("#txtRContact").val() == '') {
            alert("Contact Number Required !!!");
            $("#txtRContact").focus();
            return false;
        } else if ($("#txtRAddress").val() == '') {
            alert("Address Required !!!");
            $("#txtRAddress").focus();
            return false;
        } else if ($("#txtRentedNID").val() == '') {
            alert("NID Required !!!");
            $("#txtRentedNID").focus();
            return false;
        } else if ($("#ddlFloorNo").val() == '') {
            alert("Floor Required !!!");
            $("#ddlFloorNo").focus();
            return false;
        } else if ($("#ddlUnitNo").val() == '') {
            alert("Unit Required !!!");
            $("#ddlUnitNo").focus();
            return false;
        } else if ($("#txtRAdvance").val() == '') {
            alert("Advance Rent Required !!!");
            $("#txtRAdvance").focus();
            return false;
        } else if ($("#txtRentPerMonth").val() == '') {
            alert("Rent Per Month Required !!!");
            $("#txtRentPerMonth").focus();
            return false;
        } else if ($("#txtRDate").val() == '') {
            alert("Rent Date Required !!!");
            $("#txtRDate").focus();
            return false;
        } else if ($("#ddlMonth").val() == '') {
            alert("Rented Month Required !!!");
            $("#ddlMonth").focus();
            return false;
        } else if ($("#ddlYear").val() == '') {
            alert("Rented Year Required !!!");
            $("#ddlYear").focus();
            return false;
        } else {
            return true;
        }
    }
</script>
<?php include('../footer.php'); ?>
