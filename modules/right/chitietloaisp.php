<?php
       $sql_chitiet="select * from chitietsp where id_loaisp='$_GET[id]'";
	   $query=mysql_query($sql_chitiet);
?>
       <?php
       $sql_loaisp="select * from loaisp where id_loaisp='$_GET[id]'";
	   $query_loaisp=mysql_query($sql_loaisp);
	   $dong_loaisp=mysql_fetch_array($query_loaisp);
	   ?>
<p style="text-align:center;color:#000;background:#999;padding:10px;"><?php echo $dong_loaisp['tenloaisp']?></p>

                  <div class="tacphamall">
                         <ul>
                         <?php
						 while($dong_chitiet=mysql_fetch_array($query)){
						 ?>
                   <li><a href="index.php?xem=chitietsp&id=<?php echo $dong_chitiet['id_sp'] ?>">
                           <img src="admincp/modules/quanlychitietsp/uploads/<?php echo $dong_chitiet['hinhanh'] ?>" height="140" />
                           <p><?php echo $dong_chitiet['tensp'] ?></p>
                           <p style="color:#090;">Giá bìa:<?php echo $dong_chitiet['gia']?> VNĐ </p>
                         
                       </a> </li>     
                       <?php
						 }
						 ?>
              </ul>    
          </div>