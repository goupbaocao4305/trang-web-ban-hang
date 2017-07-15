
<style>
th{
	background:#666	
	}
</style>
<form action="modules/quanlybanhang/xuly.php" method="post" enctype="multipart/form-data">
<table width="100%" border="1">
  <tr>
    <th colspan="2"><div align="center">Bán</div></th>
  </tr>
<?php
  $sql_tt="select * from chitietsp";
  $run_tt=mysql_query($sql_tt);
    
  ?>
  <tr>
    <td>Tên sản phẩm : 
   <select style="font-size:20px" name="tenhang">
    <?php
    while($dong_tt=mysql_fetch_array($run_tt)){	
		?>  
    <option value="<?php echo $dong_tt['id_sp']?>"> <?php echo $dong_tt['tensp']?>
    
     </option>
    <?php
	}	
	?>
    </select></td>
  </tr>
  
  <tr>
    <td>Giá: <input type="text" name="gia" ></td>
   
  </tr>
  <tr>
    <td>Số lượng: <input type="text" name="soluong"></td>
    
  </tr>
 <tr>
    <td >Ngày : <input style="font-size:20px" readonly="readonly" type="date" name="date" value="<?php echo date("m/d/Y h:i:s"); ?>" /></td>
  </tr>
  <tr>
    <td colspan="2"><div align="center">
    <br />
      <button name="them" value="Thêm" style="background-color:#CCC; font-size:24px; font-family:'Times New Roman', Times, serif">Thêm</button>
      </div></td>
  </tr>
 
</table>
</form>
