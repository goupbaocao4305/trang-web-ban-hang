<title>Login</title>

<?php
      include('modules/config.php');    
	  session_start();	  
	  if(isset($_POST['login'])){
		  $username=$_POST['username'];
		  $password=$_POST['password'];
		  $sql="select * from account where username='$username'and password='$password' limit 1";
		  $query=mysql_query($sql);
		  $nums=mysql_num_rows($query);
		  if($nums>0){
			  $row=mysql_fetch_array($query);
			  
			  $_SESSION['dangnhap']=$username;
			 session_start();
			  header('location:index.php');
			  $_SESSION['level'] = $row[level];	
			  $_SESSION['hoten'] = $row[hoten];	
			  $_SESSION['id'] = $row[id_user];  
			  $_SESSION['status'] = $row[status];	  
			  }else{
		      echo"<script> alert('Tài khoản không đúng!')</script>";
		      }		  
	  }
?>
<body style="margin-top:100px;">
<link rel="stylesheet" type="text/css" href="style/ss.css" />
<form action="" method="post">
<table width="200" border="0" align="center" cellpadding="15" cellspacing="0">
  <tr>
    <th height="51" colspan="2"><div align="center">Login</div></th>
  </tr>
  <tr>
    <td>Username</td>
    <td><input name="username" type="text" size="20"></td>
  </tr>
  <tr>
    <td>Password</td>
    <td><input name="password" type="password" size="20"></td>
  </tr>
  <tr>
    <td colspan="2" class="end">  
      <div align="center">
        <input type="submit" name="login" id="button" value="Login">
      </div>
    </td>
  </tr>
</table>
</form>
</body>
