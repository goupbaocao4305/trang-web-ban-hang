
               <p style="text-align:center;color:#000;background:#999;padding:10px;"><strong>Quản lý</strong></p>
               <div class="tacpham">
               <ul>
                   <li><a href="index.php">Trang chủ</a></li> 
                   
                   <li><a href="admincp/index.php?quanly=quanlychitietsp&ac=them">Quản lý sản phẩm</a></li>
                   <li><a href="admincp/index.php?quanly=quanlyloaisp&ac=them">Quản lý loại sản phẩm</a></li>
                   <li><a href="admincp/index.php?quanly=quanlybanhang&ac=them" >Quản lý lịch sản phẩm đã bán</a></li> 
                   <li><a href="admincp/index.php?quanly=quanlynguoidung&ac=them" >Quản lý người dùng</a></li> 
                    Chào mừng<b><font color="#FF0000"> <?php echo $_SESSION['hoten']?></font></b> đến với trang quản trị !
                 <li style="text-align:right; "><a  class="LO"href="logout.php"><small><b><p style="color:#F00; ">Logout</p></b></small></a></li>          
               </ul>
               </div>
    
<?php
      $sql_loaisp="select * from loaisp";
	  $query=mysql_query($sql_loaisp);
?>
               <p style="text-align:center;color:#000;background:#999;padding:10px;"><strong>Loại</strong></p>
               <div class="tacpham">
               <ul>
               <?php
			   while($dong_sp=mysql_fetch_array($query)){
			   ?>
                   <li><a href="index.php?xem=chitietloaisp&id=<?php echo $dong_sp['id_loaisp'] ?>"><?php echo $dong_sp['tenloaisp']?></a></li>
                   <?php
			   }
				   ?>
               </ul>
               </div>
                