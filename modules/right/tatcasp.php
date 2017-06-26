<?php
     $sql_all="select * from chitietsp";
	 $query_all=mysql_query($sql_all);
     ?>
<p style="text-align:center;color:#000;background:#999;padding:10px;"><strong>Tất cả sản phẩm</strong></p>
                  <div class="tacphamall">
              
              <ul>
              <?php
						 while($dong_all=mysql_fetch_array($query_all)){
						 ?>
                   <li><a href="index.php?xem=chitietsp&id=<?php echo $dong_all['id_sp'] ?>">
                           <img src="admincp/modules/quanlychitietsp/uploads/<?php echo $dong_all['hinhanh'] ?>" width="350" height="220" />
                           <p style="color:#F00"><?php echo $dong_all['tensp'] ?></p>
                          
                           <p style="color:#090;">Giá :<?php echo $dong_all['gia']?></p>
                           
                       </a> </li>     
                      
                       <?php
						 }
						 ?>
              </ul>    
          </div>