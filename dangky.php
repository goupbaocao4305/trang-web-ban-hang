<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
<style type="text/css">
<!--
.style1 {color: #FF0000}
-->
</style>
</head>

<body>
<?php
if(isset($_POST['Submit']))
{
	if(strlen($_POST['txtname'])>0)
	{
		$hoten=true;
	}
	else
	{
		$hoten=false;
		?>
			<script language="javascript">
			window.alert("Ban chua nhap ho ten");
			</script>
		<?php
	}
	
	if(strlen($_POST['txtuser'])>0)
	{
		$username=true;
	}
	else
	{
		$username=false;
		?>
			<script language="javascript">
			window.alert("Ban chua nhap user");
			</script>
		<?php
	}
	if(strlen($_POST['txtphone'])>0)
	{
		$dienthoai=true;
	}
	else
	{
		$dienthoai=false;
		?>
			<script language="javascript">
			window.alert("Ban chua nhap so dien thoai");
			</script>
		<?php
	}
	if(strlen($_POST['txtpass'])>0)
	{
		$password=true;
	}
	else
	{
		$password=false;
		?>
			<script language="javascript">
			window.alert("Ban chua nhap password");
			</script>
		<?php
	}
	if($hoten&&$username&&$password&&$dienthoai)
	{
		require("dbconnect.inc");
		$u=$_POST['txtuser'];
		$p=$_POST['txtpass'];
		$sql= "select username from thanhvien where (username='$u' && password='$p')";
		$result=mysql_query($sql,$link);
		if(mysql_num_rows($result)==0)
		{
			$n=$_POST['txtname'];
			$nam=$_POST['selectnam'];
			$thang=$_POST['selectthang'];
			$ngay=$_POST['selectngay'];
			$q=$_POST['selectque'];
			$dt=$_POST['txtphone'];
			$sql1="insert into thanhvien(hoten,ngaysinh,quequan,dienthoai,username,password) 
						values('$n',concat('$nam','-','$thang','-','$ngay'),'$q','$dt','$u','$p')";									   
			$result1=mysql_query($sql1,$link);
			if(mysql_affected_rows()==1)
			{
				?>
			<script language="javascript">
			window.alert("Ban dang ky thanh cong");
			window.location=("index.php?action=1");
			</script>
				<?php	
				exit();
			}
			else
			{
				?>
			<script language="javascript">
			window.alert("Ban oi co loi j do kia");
			</script>
				<?php
			}
		}
		else
		{
			?>
			<script language="javascript">
			window.alert("Username da co nguoi su dung");
			</script>
		<?php
		}
		
	}
}
?>
<div align="center">Đăng kí </div>
<form id="form1" name="form1" method="post" action="">
  <div align="center">
    <table width="352" border="1">
      <tr>
        <td width="112">Họ tên </td>
        <td width="224"><label>
          <div align="left">
            <input type="text" name="txtname" />
            <span class="style1">*</span></div>
        </label></td>
      </tr>
      <tr>
        <td>Ngày sinh </td>
        <td><label>
          <div align="left">
            <select name="selectnam">
              <option>Năm</option>
              <?php 
		  $i=1980;
		  while($i<2009)
		  {
		  ?>
              <option><?php echo "$i";?></option>
              <?php 
			$i++;
		  }
		  ?>
            </select>
            <select name="selectthang">
              <option>Tháng</option>
              <?php 
		  $i=1;
		  while($i<13)
		  {
		  ?>
                <option><?php echo "$i";?></option>
              <?php 
			$i++;
		  }
		  ?>
            </select>
            <select name="selectngay">
              <option>Ngày</option>
              <?php 
		  $i=1;
		  while($i<32)
		  {
		  ?>
                <option><?php echo "$i";?></option>
              <?php 
			$i++;
		  }
		  ?>
            </select>
            <span class="style1">*</span></div>
        </label></td>
      </tr>
      <tr>
        <td>Quê quán </td>
        <td><label>
          <div align="left">
            <select name="selectque">
              <option>Ha noi</option>
              <option>Phu tho</option>
              <option>Hung yen</option>
              <option>Bac giang</option>
              <option>Tuyen quang</option>
              <option>Thanh hoa</option>
              <option>Hai phong</option>
            </select>
            <span class="style1">*</span></div>
        </label></td>
      </tr>
      <tr>
        <td>Điện thoại </td>
        <td><div align="left">
          <input type="text" name="txtphone" />
          <span class="style1">*</span></div></td>
      </tr>
      <tr>
        <td>Username</td>
        <td><div align="left">
          <input type="text" name="txtuser" />
          <span class="style1">*</span></div></td>
      </tr>
      <tr>
        <td>Password</td>
        <td><div align="left">
          <input type="password" name="txtpass" />
          <span class="style1">*</span></div></td>
      </tr>
      <tr>
        <td colspan="2"><label>
          <input type="submit" name="Submit" value="Đăng kí" />
        </label></td>
      </tr>
      </table>
  </div>
</form>
</body>


</html>

