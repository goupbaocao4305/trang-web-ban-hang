<form action="modules/quanlynguoidung/xuly.php" method="post" enctype="multipart/form-data">
<table width="100%" border="1">
  <tr>
    <th colspan="2"><div align="center">Thêm người sử dụng</div></th>
  </tr>
  <tr>
    <td height="57">Số thứ tự</td>
    <td><input type="number" name="newid" required="required"></td>
  </tr>

  <tr>
    <td height="57">Họ tên</td>
    <td><input type="text" name="hoten" required="required"></td>
  </tr>
  <tr>
    <td height="57">Email</td>
    <td><input type="email" name="email" required="required"></td>
  </tr>
<tr>
    <td>Số điện thoại</td>
    <td><input type="number" name="sdt" required="required"></td>
  </tr>
  <tr> 
    <td height="74">Tên truy cập</td>
    <td><input type="text" name="username" required="required"></td>
  </tr>
  <tr>
    <td height="62">Mật khẩu</td>
    <td><input type="password" name="password" required="required"></td>
  </tr>
  <tr>
    <td height="65">Ảnh đại diện</td>
    <td><input type="file" name="avatar"></td>
  </tr>
    <tr>
    <td>Quyền truy cập</td>
    <td>
    <select required  name="level" >
    
    <option value="">-- --</option>
    <option value="0">Member</option>
    <option value="1">Admin</option>
    
    </select>
    </td>
  </tr>
 <tr>
    <td>Trạng thái</td>
    <td>
    <select required  name="tt" >
    
    <option value="">-- --</option>
    <option value="0">Deactive</option>
    <option value="1">Active</option>
    
    </select>
    </td>
  </tr>
  <tr>
    <td height="73" colspan="2"><div align="center">
    <br />
      <button name="them" style="background-color:#CCC; font-size:24px; font-family:'Times New Roman', Times, serif">Thêm</button>
      </div></td>
  </tr> 
</table>
</form>


