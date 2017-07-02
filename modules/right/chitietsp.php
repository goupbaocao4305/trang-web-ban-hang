<?php
      $sql_chitietsp="select * from chitietsp,loaisp where loaisp.id_loaisp=chitietsp.id_loaisp && id_sp=$_GET[id]";
	  $query_chitietsp=mysql_query($sql_chitietsp);
	  $dong_chitietsp=mysql_fetch_array($query_chitietsp);
?>
<table width="75%" border="1" style="border-collapse:collapse">
  <tr>
    <th height="46" colspan="2" style="background-color:#999"><div align="center" >Chi tiết sản phảm</div></th>
  </tr>
  <tr >
    <td rowspan="5"><img src="admincp/modules/quanlychitietsp/uploads/<?php echo $dong_chitietsp['hinhanh'] ?>" width="650" height="400" /></td>
    <td >Tên sản phảm: <?php echo $dong_chitietsp['tensp'] ?></td>
  </tr>
  <tr>
    <td>Loại sản phẩm:<?php echo $dong_chitietsp['tenloaisp'] ?></td>
  </tr>
  <tr>
    <td>Số lượng:<?php echo $dong_chitietsp['soluong'] ?></td>
  </tr>
  <tr>
    <td>Nhà cung cấp:<?php echo $dong_chitietsp['ncc'] ?></td>
  </tr>
  <tr>
    <td style="color:#F30">Giá :<?php echo $dong_chitietsp['gia']?></td>
  </tr>
  <tr>
    <td colspan="2"><div align="center">Thông tin:</div></td>
  </tr>
  <tr>
    <td colspan="2"><?php echo $dong_chitietsp['thongtin']?></td>
  </tr>
</table>
