<div class="footer">
     <h3 style="color:#666; background:#CCC; text-align:center;line-height:80px">Copyright 2016. <?php
   // thiết lập timezone mặc định Cái này có sẵn trong PHP 5.1
   date_default_timezone_set('Asia/Ho_Chi_Minh');
   // in ngày tháng dưới định dạng: Mon, 15 Aug 2005 15:12:46 UTC
   echo date(DATE_RFC822);  
?></h3>
     </div>