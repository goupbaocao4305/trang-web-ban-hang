<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
</head>

<body>
<?php
if(isset($_POST['Submit']))
{
	
	if(strlen($_POST['txtten'])>0)
	{
		$tenhang=true;
	}
	else
	{
		$tenhang=false;
		?>
			<script language="javascript">
			window.alert("Bạn chưa nhập tên hàng");
			</script>
		<?php
	}
	if(strlen($_POST['txtgia'])>0)
	{
		$giatien=true;
	}
	else
	{
		$giatien=false;
		?>
			<script language="javascript">
			window.alert("Bạn chưa nhập giá tiền");
			</script>
		<?php
	}
	if(strlen($_POST['txtkieu'])>0)
	{
		$kieu=true;
	}
	else
	{
		$kieu=false;
		?>
			<script language="javascript">
			window.alert("Bạn chưa nhập kiểu");
			</script>
		<?php
	}
	
	
	if($tenhang&&$giatien&&$kieu)
	{
		require("dbconnect.inc");
		$k=$_POST['txtkieu'];
		$t=$_POST['txtten'];
		$g=$_POST['txtgia'];
		$gr=$_POST['txtgr'];
		$sl=$_POST['txtsolg'];
		$h=$_FILES['filehinhanh']['name'];
		$l=$_POST['cbbloai'];
		$sql="insert into sanpham(tenhang,giatien,kieu,maloai,sogr1sp,sosp1thung,hinhanh) 
						values('$t','$g','$k','$l','$gr','$sl','$h')";									   
		$result=mysql_query($sql);
			if($result==1)
			{
				$duongdan=$_FILES['filehinhanh']['name'];
				if(move_uploaded_file($_FILES['filehinhanh']['tmp_name'],"C:/wamp/www/Thihocky/anhphp/$duongdan"))
				{
				?>
					<script language="javascript">
					window.alert("Bạn cập nhật thành công");
					window.location="index.php";
			</script>
				<?php	
				}
				?>
				<script language="javascript">
				window.alert("Bạn cập nhật thành công");
				window.location="index.php";
				</script>
				<?php
			}
			else
			{
				?>
			<script language="javascript">
			window.alert("Ban xem lại đi cập nhật bị lỗi");
			</script>
				<?php
			}
	}
}
	
?>
<form id="form3" name="form3" method="post" action="" enctype="multipart/form-data">
  <div align="center"> <?php echo 'Sản phẩm mới';?>
      <table width="320" border="1">
        <tr>
          <td><div align="left">Tên hàng </div></td>
          <td><div align="left">
            <input type="text" name="txtten" />
          </div></td>
        </tr>
        <tr>
          <td><div align="left">Gía tiền </div></td>
          <td><div align="left">
            <input type="text" name="txtgia" />
          </div></td>
        </tr>
        <tr>
          <td><div align="left">Kiểu</div></td>
          <td><div align="left">
            <input type="text" name="txtkieu" />
          </div></td>
        </tr>
        <tr>
          <td><div align="left">Loại</div></td>
          <td><div align="left">
            <select name="cbbloai">
              <option value="l1">HonDa</option>
              <option value="l2">Mazda</option>
              <option value="l3">Toyota</option>
              <option value="l4">Dewoo</option>
              <option value="l5">Ferrari</option>
              <option value="l6">BMW</option>
            </select>
          </div></td>
        </tr>
        <tr>
          <td><div align="left">Hình ảnh </div></td>
          <td><div align="left">
            <input type="file" name="filehinhanh" />
          </div></td>
        </tr>
        <tr>
          <td colspan="2"><div align="left">
            <input type="submit" name="Submit" value="Cập nhật" />
          </div></td>
        </tr>
      </table>
  </div>
</form>
</body>
</html>
