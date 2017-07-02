<?php
     $sql_all="select * from account";
	 $query_all=mysql_query($sql_all);
     ?>
<p style="text-align:center;color:#000;background:#999;padding:10px;"><strong>Tất cả người dùng</strong></p>
                  <div class="tacphamall">
              
              <ul>
              <?php
						 while($dong_all=mysql_fetch_array($query_all)){
						 ?>
                   <li><a href="index.php?xem=userinfo&id=<?php echo $dong_all['id_user'] ?>">
                           <img src="admincp/modules/quanlynguoidung/uploads/<?php echo $dong_all['avatar'] ?>" width="350" height="220" />
                           <p style="color:#000"><?php echo $dong_all['hoten'] ?></p>
                           <p style="color:#F00"><?php echo $dong_all['username'] ?></p>
                           
						  <?php
                            $sql_tt="select * from statuss";
                            $run_tt=mysql_query($sql_tt);                              
                           ?>
  <?php
    while($dong_tt=mysql_fetch_array($run_tt)){
		if($dong_all['level']==$dong_tt['level']){
		?>
                           <p style="color:#090;">Quyền: <?php echo $dong_tt['role']?></p>
                           <p style="color:#090;">Trạng thái: <?php echo $dong_tt['tt']?></p>
                       </a> </li>     
                       <?php
		}}
						 }
						 ?>
              </ul>    
          </div>