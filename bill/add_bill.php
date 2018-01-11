<?php
include('../header.php');
include('../utility/common.php');
include(ROOT_PATH . 'language/' . $lang_code_global . '/lang_add_bill.php');
if (!isset($_SESSION['objLogin'])) {
    header("Location: " . WEB_URL . "logout.php");
    die();
}
$success = "none";
$bill_type = '';
$bill_date = '';
$bill_month = '';
$bill_year = '';
$total_amount = '';
$deposit_bank_name = '';
$bill_details = '';
$branch_id = '';
$title = $_data['text_1'];
$button_text = $_data['save_button_text'];
$successful_msg = $_data['text_15'];
$form_url = WEB_URL . "bill/add_bill.php";
$id = "";
$hdnid = "0";

if (isset($_POST['ddlBillType'])) {
    if (isset($_POST['hdn']) && $_POST['hdn'] == '0') {
        $sql = "INSERT INTO tbl_add_bill(bill_type,bill_date,bill_month,bill_year,total_amount,deposit_bank_name,bill_details,branch_id) values('$_POST[ddlBillType]','$_POST[txtBillDate]','$_POST[ddlBillMonth]','$_POST[ddlBillYear]','$_POST[txtTotalAmount]','$_POST[txtDepositBankName]','$_POST[txtBillDetails]','" . $_SESSION['objLogin']['branch_id'] . "')";
        mysqli_query($link, $sql);
        //mysql_close($link);
        $url = WEB_URL . 'bill/bill_list.php?m=add';
        header("Location: $url");
    } else {
        $sql = "UPDATE `tbl_add_bill` SET `bill_type`='" . $_POST['ddlBillType'] . "',`bill_date`='" . $_POST['txtBillDate'] . "',`bill_month`='" . $_POST['ddlBillMonth'] . "',`bill_year`='" . $_POST['ddlBillYear'] . "',`total_amount`='" . $_POST['txtTotalAmount'] . "',`deposit_bank_name`='" . $_POST['txtDepositBankName'] . "',`bill_details`='" . $_POST['txtBillDetails'] . "' WHERE bill_id='" . $_GET['id'] . "'";
        mysqli_query($link, $sql);
        //mysql_close($link);
        $url = WEB_URL . 'bill/bill_list.php?m=up';
        header("Location: $url");
    }
    $success = "block";
}
if (isset($_GET['id']) && $_GET['id'] != '') {
    $result = mysqli_query($link, "SELECT * FROM tbl_add_bill where bill_id = '" . $_GET['id'] . "'");
    while ($row = mysqli_fetch_array($result)) {
        $bill_type = $row['bill_type'];
        $bill_date = $row['bill_date'];
        $bill_month = $row['bill_month'];
        $bill_year = $row['bill_year'];
        $total_amount = $row['total_amount'];
        $deposit_bank_name = $row['deposit_bank_name'];
        $bill_details = $row['bill_details'];
        $hdnid = $_GET['id'];
        $title = $_data['text_1_1'];
        $button_text = $_data['update_button_text'];
        $successful_msg = $_data['text_16'];
        $form_url = WEB_URL . "bill/add_bill.php?id=" . $_GET['id'];
    }
}
?>
<!-- Content Header (Page header) -->

<section class="content-header">
    <h1><?php echo $title; ?></h1>
    <ol class="breadcrumb">
        <li><a href="<?php echo WEB_URL ?>dashboard.php"><i class="fa fa-dashboard"></i><?php echo $_data['home_breadcam']; ?></a></li>
        <li class="active"><?php echo $_data['text_2']; ?></li>
        <li class="active"><?php echo $_data['text_3']; ?></li>
    </ol>
</section>
<!-- Main content -->
<section class="content">
    <!-- Full Width boxes (Stat box) -->
    <div class="row">
        <div class="col-md-12">
            <div align="right" style="margin-bottom:1%;"> <a class="btn btn-primary" title="" data-toggle="tooltip" href="<?php echo WEB_URL; ?>bill/bill_list.php" data-original-title="<?php echo $_data['back_text']; ?>"><i class="fa fa-reply"></i></a> </div>
            <div class="box box-info">
                <div class="box-header">
                    <h3 class="box-title"><?php echo $_data['text_4']; ?></h3>
                </div>
                <form onSubmit="return validateMe();" action="<?php echo $form_url; ?>" method="post" enctype="multipart/form-data">
                    <div class="box-body">
                        <div class="form-group">
                            <label for="txtBillType"><?php echo $_data['text_5']; ?> :</label>
                            <input type="text" name="txtBillType" value="<?php echo $bill_type; ?>" id="txtBillType" class="form-control" />
                        </div>
                        <div class="form-group">
                            <label for="txtBillType"><?php echo $_data['text_7']; ?> :</label>
                            <input type="text" name="txtBillType" value="<?php echo $bill_type; ?>" id="txtBillType" class="form-control" />
                        </div>
                        <div class="form-group">
                            <label for="txtBillType"><?php echo $_data['text_8']; ?> :</label>
                            <input type="text" name="txtBillType" value="<?php echo $bill_type; ?>" id="txtBillType" class="form-control" />
                        </div>
                        <div class="form-group">
                            <label for="txtBillType"><?php echo $_data['text_10']; ?> :</label>
                            <input type="text" name="txtBillType" value="<?php echo $bill_type; ?>" id="txtBillType" class="form-control" />
                        </div>
                        <div class="form-group pull-right">
                            <input type="submit" name="submit" class="btn btn-primary" value="<?php echo $button_text; ?>"/>
                            &nbsp;
                            <input type="reset" onClick="javascript:window.location.href = '<?php echo WEB_URL; ?>bill/add_bill.php';" name="btnReset" id="btnReset" value="<?php echo $_data['reset']; ?>" class="btn btn-primary"/>
                        </div>
                    </div>
                    <input type="hidden" name="hdnSpid" value="<?php echo $hval; ?>"/>
                </form>
                <h4 style="text-align:center; color:red;"><?php echo $_data['text_5']; ?></h4>

                <!-- /.box-body -->
            </div>
            <!-- /.box -->
        </div>
    </div>
    <div class="box-body">
        <table class="table sakotable table-bordered table-striped dt-responsive">
            <thead>
                <tr>
                    <th><?php echo $_data['text_5']; ?></th>
                    <th><?php echo $_data['text_7']; ?></th>
                    <th><?php echo $_data['text_8']; ?></th>
                    <th><?php echo $_data['text_10']; ?></th>
                    <th><?php echo $_data['text_12']; ?></th>
                    <th><?php echo $_data['text_13']; ?></th>
                    <th><?php echo $_data['text_14']; ?></th>
                    <th><?php echo $_data['action_text']; ?></th>
                </tr>
            </thead>
            <tbody>
<?php
$result = mysqli_query($link, "Select *,bt.bill_type as bt_type,m.month_name,y.xyear,bt.bt_id from tbl_add_bill b inner join tbl_add_bill_type bt on bt.bt_id = b.bill_type inner join tbl_add_month_setup m on m.m_id = b.bill_month inner join tbl_add_year_setup y on y.y_id = b.bill_year where b.branch_id = " . (int) $_SESSION['objLogin']['branch_id'] . " order by b.bill_id asc");
while ($row = mysqli_fetch_array($result)) {
    ?>
                    <tr>
                        <td><?php echo $row['bt_type']; ?></td>
                        <td><?php echo $row['bill_date']; ?></td>
                        <td><?php echo $row['month_name']; ?></td>
                        <td><?php echo $row['xyear']; ?></td>
    <?php if ($currency_position == 'left') { ?>
                            <td><?php echo $global_currency . $row['total_amount']; ?></td>
                        <?php } else { ?>
                            <td><?php echo $row['total_amount'] . $global_currency; ?></h3>
                        <?php } ?>
                        <td><?php echo $row['deposit_bank_name']; ?></td>
                        <td><?php echo $row['bill_details']; ?></td>
                        <td><a class="btn btn-success" data-toggle="tooltip" href="javascript:;" onClick="$('#nurse_view_<?php echo $row['bill_id']; ?>').modal('show');" data-original-title="<?php echo $_data['view_text']; ?>"><i class="fa fa-eye"></i></a> <a class="btn btn-primary" data-toggle="tooltip" href="<?php echo WEB_URL; ?>bill/add_bill.php?id=<?php echo $row['bill_id']; ?>" data-original-title="<?php echo $_data['edit_text']; ?>"><i class="fa fa-pencil"></i></a> <a class="btn btn-danger" data-toggle="tooltip" onClick="deleteBill(<?php echo $row['bill_id']; ?>);" href="javascript:;" data-original-title="<?php echo $_data['delete_text']; ?>"><i class="fa fa-trash-o"></i></a>
                            <div id="nurse_view_<?php echo $row['bill_id']; ?>" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header orange_header">
                                            <button aria-label="Close" data-dismiss="modal" class="close" type="button"><span aria-hidden="true"><i class="fa fa-close"></i></span></button>
                                            <h3 class="modal-title"><?php echo $_data['text_1_1']; ?></h3>
                                        </div>
                                        <div class="modal-body model_view" align="center">&nbsp;
                                          <div><!--<img style="width:200px;height:200px;border-radius:200px;" src="<?php //echo $image;   ?>" />--></div>
                                            <div class="model_title"><?php echo $row['bill_type']; ?></div>
                                        </div>
                                        <div class="modal-body">
                                            <h3 style="text-decoration:underline;"><?php echo $_data['details_information']; ?></h3>
                                            <div class="row">
                                                <div class="col-xs-12"> <b><?php echo $_data['text_5']; ?> :</b> <?php echo $row['bt_type']; ?><br/>
                                                    <b><?php echo $_data['text_7']; ?> :</b> <?php echo $row['bill_date']; ?><br/>
                                                    <b><?php echo $_data['text_8']; ?> :</b> <?php echo $row['month_name']; ?><br/>
                                                    <b><?php echo $_data['text_10']; ?> :</b> <?php echo $row['xyear']; ?><br/>
                                                    <b><?php echo $_data['text_12']; ?> :</b> <?php if ($currency_position == 'left') {
                            echo $global_currency . $row['total_amount'];
                        } else {
                            echo $row['total_amount'] . $global_currency;
                        } ?><br/>
                                                    <b><?php echo $_data['text_13']; ?> :</b> <?php echo $row['deposit_bank_name']; ?><br/>
                                                    <b><?php echo $_data['text_14']; ?> :</b> <?php echo $row['bill_details']; ?><br/>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- /.modal-content -->
                                </div>
                            </div></td>
                    </tr>
<?php } mysqli_close($link); ?>
            </tbody>
        </table>
    </div>
    <!-- /.box-body -->
    <!-- /.row -->
    <script type="text/javascript">
        function validateMe() {
            if ($("#ddlBillType").val() == '') {
                alert("Bill Type Required !!!");
                $("#ddlBillType").focus();
                return false;
            } else if ($("#txtBillDate").val() == '') {
                alert("Date is Required !!!");
                $("#txtBillDate").focus();
                return false;
            } else if ($("#ddlBillMonth").val() == '') {
                alert("Bill Month is Required !!!");
                $("#ddlBillMonth").focus();
                return false;
            } else if ($("#ddlBillYear").val() == '') {
                alert("Bill Year is Required !!!");
                $("#ddlBillYear").focus();
                return false;
            } else if ($("#txtTotalAmount").val() == '') {
                alert("Total is Required !!!");
                $("#txtTotalAmount").focus();
                return false;
            } else if ($("#txtDepositBankName").val() == '') {
                alert("Bank Name is Required !!!");
                $("#txtDepositBankName").focus();
                return false;
            } else if ($("#txtBillDetails").val() == '') {
                alert("Bill Details Required !!!");
                $("#txtBillDetails").focus();
                return false;
            } else {
                return true;
            }
        }
    </script>
    <?php include('../footer.php'); ?>
