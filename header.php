<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
</head>

<body>
<?php
			require("dbconnect.inc");
			if(isset($_SESSION['username']))
			{
				$u=$_SESSION['username'];
				$sql="select * from thanhvien where username='$u' && quyen='1'";
				$result=mysql_query($sql);
			}

?>
<table width="980" border="0">
  <tr>
    <td width="122" height="21"><div align="center"><a href="index.php"><strong>Trang chủ</strong></a></div></td>
	<?php
	if(!$_SESSION['username'])
	{
	?>
    <td width="122"><div align="center"><a href="/Thihocky/index.php?action=1"><strong>Đăng nhập</strong></a></div></td>
	<td width="122"><div align="center"><a href="/Thihocky/index.php?action=2"> <strong>Đăng ký</strong> </a></div></td>
    <?php
	}
	else
	{
	?>
	<td width="122"><div align="center"><a href="linkthoat.php?action=8"><strong>Thoát</strong></a></div></td>
	<td width="122"><div align="center"><a href="/Thihocky/index.php?action=4"><strong>Giỏ hàng</strong> </a></div></td>
	<?php 
	}
	?>
    <td width="122"><div align="center"><a href="/Thihocky/index.php?action=5"> <strong>Tìm kiếm</strong></a></div></td>
    <td width="122"><div align="center"><a href="/Thihocky/index.php?action=6"> <strong>Tính toán</strong> </a></div></td>
	<?php
	if(@mysql_num_rows($result)==1)
	{
	?>
	<td width="122"><div align="center"><a href="/Thihocky/index.php?action=3"> <strong>Cập nhật</strong> </a></div></td>
	<td width="122"><div align="center"><a href="/Thihocky/index.php?action=10"> <strong>Sửa xóa</strong> </a></div></td>
  <?php
  } ?>
  </tr>
</table>
</body>
</html>
