
<?php
$sql=" select * from loaisp where id_loaisp='$_GET[id]'";
$run=mysql_query($sql);
$dong=mysql_fetch_array($run);
?>
<style>
th{
	background:#666	
	}
</style>
<form action="modules/quanlyloaisp/xuly.php?id=<?php echo $dong['id_loaisp']?>" method="post" enctype="multipart/form-data">
<table width="100%" border="1">
  <tr>
    <th colspan="2"><div align="center">Sửa loại sản phẩm</div></th>
  </tr>
  <tr>
    <td>Tên loại sản phẩm</td>
    <td><input type="text" name="tenloaisp" value="<?php echo $dong['tenloaisp']?>"></td>
  </tr>
  <tr>
    <td>Nhà cung cấp</td>
    <td><input type="text" name="ncc" value="<?php echo $dong['ncc']?>"></td>
  </tr>
  <tr>
    <td colspan="2">
      <div align="center">
        <input type="submit" name="sua" id="sua" value="Sửa">
      </div>
    </td>
  </tr>
</table>
</form>
