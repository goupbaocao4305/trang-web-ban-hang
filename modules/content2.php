<div class="content">
      <div class="left">
           <?PHP
		         include('modules/left/danhsach2.php');
		   ?>            
      </div>      
      <div class="right">
           <?PHP
		         if(isset($_GET['xem'])){
					 $tam=$_GET['xem'];
				 }else{
				     $tam='';
				 }if($tam=='chitietsp'){
						 include('modules/right/chitietsp.php');			 	
				 }elseif($tam=='userinfo2'){
						 include('modules/right/userinfo2.php');
				 	 		 
				 }else
					     include('modules/right/tatcasp.php');				
		   ?>
      </div>       
     </div>    
     <div class="clear"></div>