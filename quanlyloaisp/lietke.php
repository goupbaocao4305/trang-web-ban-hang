
<style>
th{
	background:#999	
	}
</style>
<?php
$sql= " SELECT * FROM loaisp order by id_loaisp desc";
$run=mysql_query($sql);
?>
<table width="100%" border="1">
  <tr>
    <th>ID</th>
    <th>Tên loại sản phẩm</th>
    <th>Nhà cung cấp</th>
    <th colspan="2">Quản lý</th>
  </tr>
<?php
$i=1;
while($dong=mysql_fetch_array($run)){
?>
  <tr>
    <td><?php echo $i;?></td>
    <td><?php echo $dong['tenloaisp'];?></td>
    <td><?php echo $dong['ncc'];?></td>
    <td><a href="index.php?quanly=quanlyloaisp&ac=sua&id=<?php echo $dong['id_loaisp']?>">Sửa</td>
    <td><a href="modules/quanlyloaisp/xuly.php?id=<?php echo $dong['id_loaisp'] ?>">Xóa</a></td>
  </tr>
<?php
$i++;
}
?>
</table>
