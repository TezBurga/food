<?php session_start(); ?>
<?php include "header.php"; ?>
<div style="height: 140px;"></div>
<div style="width: 90%; margin: 0 auto; background-color: silver; padding: 50px;">

<?php
if(isset($_SESSION['uid']))
{
	include "connect.php";
	$uid = $_SESSION['uid'];
	$mo = $_POST['mo'];
	$em = $_POST['em'];
	$ad = $_POST['ad'];
	$s= mysqli_query($con,"select * from addcart where u_id='$uid'");
	while($r = mysqli_fetch_array($s))
	{
		$p_id = $r['p_id'];
		mysqli_query($con,"insert into checkout(p_id, u_id,mobile,email,address) values('$p_id','$uid','$mo','$em','$ad')") or die("Error");
	?>
		
	<?php
	}


?>

	<div style="background-color: #84b36e; font-size:2.3em; color: #ffffff;">Order Place SuccessFully </div>
	<div style="color: #4d2e1f; font-size:1.8em;"> 
			Feel free to call us for more information<br>
			+44 712 123 123<br>

			<?php
			
			$sql = "SELECT LAST_INSERT_ID()";
			$result = $con->query($sql);
			
		
			if ($result->num_rows > 0) {
				
				$row = $result->fetch_assoc();
				echo "Your Order ID is: " . $row["LAST_INSERT_ID()"];
			} else {
				echo "No checkout records found.";
			}

			?><br>

			<?php
			$sql = "SELECT * FROM addcart";
			$result = mysqli_query($con, $sql);
			
			
			$total = 0;
			while ($row = mysqli_fetch_assoc($result)) {
				$price = $row['price'];
				$qty = $row['qty'];
				$total  = $price*$qty;
			}
		
			echo 'Total: £' . number_format($total, 2);
			?>
	</div>

<?php
}
else
{
?>
		<div style="background-color: pink; color: black; padding: 20px; font-size: 2.1em;">No Record Found please Add to Cart Your Product Then Continue to Check Out</div>

<?php
}	
?>

</div>
<br><br><br>



<?php include "footer.php"; ?>    

  
