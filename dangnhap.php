<?php
session_start();
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Đăng nhập</title>
</head>
<body>
<?php 
if(isset($_POST['Submit']))
{
	if(strlen($_POST['txtuser'])>0)
	{
		$u=$_POST['txtuser'];
	}
	else
	{
		?>
			<script language="javascript">
			window.alert("Ban chua nhap user name");
			</script>
		<?php
	}
	if(strlen($_POST['txtpass'])>0)
	{
		$p=$_POST['txtpass'];
	}
	else
	{
		?>
			<script language="javascript">
			window.alert("Ban chua nhap password");
			</script>
		<?php
	}
	if($u&&$p)
	{
		require("dbconnect.inc");
		$sql= "select username from thanhvien where (username='$u' && password='$p')";
		$result=mysql_query($sql,$link);
		if(mysql_num_rows($result)==0)
		{
		?>
			<script language="javascript">
			window.alert("Ban go sai username hoac password");
			</script>
		<?php
		}
		else
		{
			?>
			<script language="javascript">
			window.alert("Ban dang nhap thanh cong");
			window.location="index.php"
			</script>
		<?php
			$_SESSION['username']= $u;
			$_SESSION['password']= $p;
			exit();
			
		}
	}
		
}
?>
<form id="form1" name="form1" method="post" action="">
  <div align="center">
    <table width="302" border="1">
      <tr>
        <td width="124">Username</td>
        <td width="162"><label>
          <input type="text" name="txtuser" />
        </label></td>
      </tr>
      <tr>
        <td>Password</td>
        <td><input type="password" name="txtpass" /></td>
      </tr>
      <tr>
        <td colspan="2"><label>
          <input type="submit" name="Submit" value="Đăng nhập" />
        </label></td>
      </tr>
      </table>
  </div>
</form>

</body>
</html>
