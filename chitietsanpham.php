<?php			
			require("dbconnect.inc"); 
			$maloai= isset($_GET["ml"])?$_GET["ml"]:"";
			if($_GET['chitiet'])
			{
				$chitiet=$_GET['chitiet'];
				$sql= "select * from sanpham where mahang='$chitiet' ";
				$result= @mysql_query($sql,$link);
				$rows=mysql_fetch_array($result);
?>
<table width="332" border="1" align="center">
  <tr>
    <td width="120" rowspan="4"><img src="/Thihocky/anhphp/<?php echo $rows['hinhanh'];?>" width="120" height="120" align="middle"></td>
    <td width="196" height="43">Ten Hang:<?php echo $rows['tenhang'];?></td>
  </tr>
  <tr>
    <td height="45">Gia Tien:<?php echo $rows['giatien']; ?></td>
  </tr>
  <tr>
    <td>Kieu:<?php echo $rows['kieu'];?></td>
  </tr>
</table>
<form id="form1" name="form1" method="post" action="">
  
</form>
<?php
}
?>
