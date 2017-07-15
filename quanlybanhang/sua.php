
<?php
     $sql="select * from chitietsp where id_sp='$_GET[id]'";
	 $run=mysql_query($sql);
	 $dong= mysql_fetch_array($run);
?>
<style>
th{
	background:#666	
	}
</style>
<form action="modules/quanlychitietsp/xuly.php?id=<?php echo $dong['id_sp']?>" method="post" enctype="multipart/form-data">
<table width="100%" border="1">
  <tr>
    <th colspan="2"><div align="center">Sửa chi tiết phòng</div></th>
  </tr>
  <tr>
    <td>Tên sản phẩm</td>
    <td><input type="text" name="tensp" value="<?php echo $dong['tensp']?>"></td>
  </tr>

  <tr>
    <td>Giá sp</td>
    <td><input type="text" name="gia" value="<?php echo $dong['gia']?>"></td>
  </tr>
  
  <tr>
    <td>Số lượng</td>
    <td><input type="text" name="soluong" value="<?php echo $dong['soluong']?>"></td>
  </tr>
  
  <tr>
    <td>Thông tin</td>
    <td><textarea name="thongtin" cols="40" rows="15"><?php echo $dong['thongtin']?></textarea></td>
  </tr>
  <?php
  $sql_loaisp="select * from loaisp";
  $run_loaisp=mysql_query($sql_loaisp);
    
  ?>
  <tr>
    <td>Loại sp</td>
    <td><select name="loaisp">
    <?php
    while($dong_loaisp=mysql_fetch_array($run_loaisp)){
		if($dong['id_loaisp']==$dong_loaisp['id_loaisp']){
		?>
    <option selected="selected" value="<?php echo $dong_loaisp['id_loaisp']?>"><?php
    echo $dong_loaisp['tenloaisp']?> </option>
    <?php
	}else{
	?>
    <option value="<?php echo $dong_loaisp['id_loaisp']?>"><?php
    echo $dong_loaisp['tenloaisp']?> </option>
    <?php
	}
	}
	?>
    </select></td>
  </tr>
  <tr>
    <td colspan="2"> <div align="center">
      <button name="sua" value="Sửa" style="background-color:#CCC; font-size:24px; font-family:'Times New Roman', Times, serif">Sửa</button>
      </div>
      </td>
  </tr>
</table>
</form>
