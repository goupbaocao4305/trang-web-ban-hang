
<style>
th{
	background:#999
	}
</style>
<form action="modules/quanlyloaisp/xuly.php" method="post" enctype="multipart/form-data">
<table width="100%" border="1">
  <tr>
    <th colspan="2"><div align="center">Thêm loại sản phẩm</div></th>
  </tr>
  <tr>
    <td>Tên loại sản phẩm</td>
    <td><input type="text" name="tenloaisp" required="required"></td>
  </tr>
  <tr>
    <td>Nhà cung cấp</td>
    <td><input type="text" name="ncc" required="required"></td>
  </tr>
  <tr>
    <td colspan="2">
      <div align="center">
        <input type="submit" name="them" id="them" value="Thêm">
      </div>
    </td>
  </tr>
</table>
</form>
