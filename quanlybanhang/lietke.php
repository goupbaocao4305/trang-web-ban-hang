
<?php
$sql="select * from banhang";
$run=mysql_query($sql);
?>
<style>
th{
	background:#999	
	}
</style>
<table width="100%" border="1">
  <tr>
    <th colspan="10">Danh sách sản phẩm đã bán</th>
  </tr>
  <tr>
    <td><em><strong>Số thứ tự</strong></em></td>
    <td><em><strong>Tên sản phẩm</strong></em></td>
    <td><em><strong>Hình ảnh</strong></em></td>
    
    <td><em><strong>Giá</strong></em></td>
     <td><em><strong>Người bán</strong></em></td>
    <td><em><strong>Số lượng</strong></em></td>
 
  </tr>
  <?php
  $i=1;
  while ($dong=mysql_fetch_array($run)){
  ?>
  <tr>
    <td height="117"><?php echo $i ?></td>   
    
   <?php
  $sql_tt="select * from chitietsp";
  $run_tt=mysql_query($sql_tt);
    
  ?>
  <?php
    while($dong_tt=mysql_fetch_array($run_tt)){
		if($dong['tenhang']==$dong_tt['id_sp']){
		?>
    <td><div align="center"><?php echo $dong_tt['tensp']; ?></div></td>
    
    <?php
	}
	}
	?>
<?php
  $sql_tt="select * from chitietsp";
  $run_tt=mysql_query($sql_tt);
    
  ?>
  <?php
    while($dong_tt=mysql_fetch_array($run_tt)){
		if($dong['tenhang']==$dong_tt['id_sp']){
		?>
    <td><img src="modules/quanlychitietsp/uploads/<?php echo $dong_tt['hinhanh']; ?>" width="80" height="90"></div></td>
    
    
    <?php
	}
	}
	?> 
    
    <td><?php echo $dong['gia']; ?></td>
        <?php
  $sql_tt="select * from account";
  $run_tt=mysql_query($sql_tt);
    
  ?>
  <?php
    while($dong_tt=mysql_fetch_array($run_tt)){
		if($dong['nguoiban']==$dong_tt['id_user']){
		?>
    <td><div align="center"><?php echo $dong_tt['hoten']; ?></div></td>
    
    <?php
	}
	}
	?>
    <td><?php echo $dong['soluong']; ?></td>

  </tr>
  <?php
   $i++;
  }
  ?>
</table>
