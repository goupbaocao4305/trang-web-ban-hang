<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
</head>

<body>
<?php 
$link= mysql_connect("localhost","root","") or die ("khong the ket noi duoc co so du lieu".mysql_error());
mysql_select_db("ngocngoc",$link) or die ("khong the ket noi duoc co so du lieu".mysql_error());
$sql="select *from mathang";
$result=mysql_query($sql,$link);
$fetch=mysql_num_rows($result); 
echo"$sql";
if($fetch!=0)
{ 
echo "<table width=100% >"; 
    $i=1; 
    echo "<tr >";     
    while(($row=mysql_fetch_row($result))&&($i<=$fetch)){ 
            $i++;     
            echo "<td width='50%'  align='center'>".$row['tenhang']."</td>"; 
     
        if($i%2) echo "</tr>"; 
        } 
echo "</table>"; 
}else{ 
     echo "Hi hi"; 
} 
?>
</body>
</html>