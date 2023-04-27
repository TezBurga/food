<?php include "header.php"; ?>
<?php include  "connect.php"; ?>
<style type="text/css">
	tr{
		font-size: 1.2em;


	}
	tr:hover{
		background-color: black;
		color: white;
	

	}
	th{
		color: tomato;
		font-size: 1.3em;
	}
	.del{
		color: red;
		text-decoration: none;
	}
	.del:hover{
		color: blue;
		text-decoration: none;
		text-shadow: 2px 3px 2px #FFFFFF;
	}
</style>

<div class="content">
	<br><br>
	<table border=1 width="100%" cellspacing="3" cellpadding="5" style="box-shadow: 5px 4px 10px 2px;">
		<tr>
			 <th colspan="8">CURRENT ORDERS</th>
		</tr>
		<tr>
		    <th>Order ID</th>
			<th>Product ID</th>
			<th>Username</th>
			<th>Mobile</th>
			<th>Email</th>
			<th>Address</th>
			<th>Status</th>
			<th>View Product</th>
			<th>Delete</th>
		</tr>
		<?php
		$s = mysqli_query($con,"select * from checkout");
		while($r = mysqli_fetch_array($s))
		{
		?>
		<tr>
		    <td><?php echo $r['id']; ?></td>
			<td><?php echo $r['p_id']; ?></td>
			<td><?php echo $r['u_id']; ?></td>
			<td><?php echo $r['mobile']; ?></td>
			<td><?php echo $r['email']; ?></td>
			<td><?php echo $r['address']; ?></td>
			<td><?php echo $r['status_id']; ?></td>
			<td><a href="viewcart.php?pid=<?php echo $r['p_id']; ?>&uid=<?php echo $r['u_id']; ?>">View Product</a></td>
			<td><a href="delorder.php?a">Delete</a></td>
		<?php
		}
		?>
	</table>
	 

</div>

<?php

if(isset($_POST['submit'])) {
    // Get the values from the form
    $status = $_POST['status'];
    $id = $_POST['id'];
    
    // Update the status ID in the checkout table
    $sql = "UPDATE checkout SET status_id = '$status' WHERE id = '$id'";
    if(mysqli_query($con, $sql)) {
        echo "Status updated successfully!";
    } else {
        echo "Error updating status: " . mysqli_error($con);
    }
}

// Query to get all checkout data
$query = "SELECT * FROM checkout";
$result = mysqli_query($con, $query);

// Display the checkout data in a table
echo "<table>
        <tr>
            <th>ID</th>
            <th>Status</th>
        </tr>";
while($row = mysqli_fetch_assoc($result)) {
    echo "<tr>
            <td>".$row['id']."</td>
            <td>
                <form method='post' action=''>
                    <select name='status'>
                        <option value='Pending' ".($row['status_id']=='Pending'?'selected':'').">Pending</option>
                        <option value='Delivered' ".($row['status_id']=='Delivered'?'selected':'').">Delivered</option>
                        <option value='Cancelled' ".($row['status_id']=='Cancelled'?'selected':'').">Cancelled</option>
                    </select>
                    <input type='hidden' name='id' value='".$row['id']."'>
                    <input type='submit' name='submit' value='Update'>
                </form>
            </td>
        </tr>";
}
echo "</table>";

// Close the database connection
mysqli_close($con);
?>



<?php include "footer.php"; ?>
