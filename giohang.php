<?php 
	session_start();
	if(isset($_SESSION["hang"]))
	{
		$tong=0;
	?>
	<form action='capnhathang.php' method='post'>
    		<table width='600' border='1' align='center'>
  			<tr>
    			<td width='300'>Ten San Pham</td>
    			<td width='75'>So Luong</td>
    			<td width='99'>Gia</td>
    			<td width='138'>Thanh Tien</td>
  			</tr>
	 <?php
	    require("dbconnect.inc");
	 	foreach($_SESSION["hang"] as $key => $value)
	 	{
    		$qty = $value;
			$sql ="select * from sanpham where mahang='$key'";
			$result = mysql_query($sql);
			$rows =@mysql_fetch_array($result);
			$total=$qty*$rows['giatien'];
	?>
			<tr>
    			<td><?php echo $rows['tenhang']; ?></td>
    			<td><input type=text value= <?php echo $qty;?> name=qty[<?php echo $rows['mahang'];?>] /></td>
    			<td><?php echo $rows['giatien'];?></td>
    			<td><?php echo $total;?></td>
  			</tr>
	<?php
			$tong+=$total;
		}?>
  			<tr>
            	<td colspan='2'>Tong Tien</td>
    			<td colspan='2'> <?php echo "$tong" ;?></td>
    		</tr>
  			<tr>
    			<td colspan='4'><input name="submit" type="submit" value="Cap Nhat Hang" /></td>
    			
    		</tr> 
            <?php 
	}
	else
	{
		echo 'Gio hang hien tai cua ban hien dang trong';	
	}
	?>
    </table>

    </form>
