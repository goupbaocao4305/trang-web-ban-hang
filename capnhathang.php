<?php
if(isset($_POST['submit']))
{
	session_start();
	foreach($_POST['qty'] as $key=>$value)
	{
		if( ($value == 0) and (is_numeric($value)))
		{
			unset ($_SESSION['hang'][$key]);
		}
		elseif(($value > 0) and (is_numeric($value)))
		{
			$_SESSION['hang'][$key]=$value;
		}
	}
	?>
    <script language="javascript">
		window.location="index.php";
    </script>
    <?php
}
?>