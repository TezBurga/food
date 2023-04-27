<?php include "header.php"; ?>


<?php

// Establish database connection
$conn = mysqli_connect("localhost", "root", "", "food");

// Check if the form is submitted
if(isset($_POST['submit'])) {
    // Get the values from the form
    $status = $_POST['status'];
    $id = $_POST['id'];
    
    // Update the status ID in the checkout table
    $sql = "UPDATE checkout SET status_id = '$status' WHERE id = '$id'";
    if(mysqli_query($conn, $sql)) {
        echo "Status updated successfully!";
    } else {
        echo "Error updating status: " . mysqli_error($conn);
    }
}

// Query to get all checkout data
$query = "SELECT * FROM checkout";
$result = mysqli_query($conn, $query);

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
mysqli_close($conn);
?>



<?php include "footer.php"; ?>
