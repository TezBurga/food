<?php include "header.php"; ?> 
<body>
	
	<!-- Start All Pages -->
	<div class="all-page-title page-breadcrumb">
		<div class="container text-center">
			<div class="row">
				<div class="col-lg-12">
					<h1> REGISTER WITH US </h1>
				</div>
			</div>
		</div>
	</div>
	<!-- End All Pages -->
    <html>
<head>
  <title>Register</title>
  <link rel="stylesheet" href="style.css">
</head>
<body>
  <form method="post" action="register.php" id="register_form">
  	<h1>Register</h1>
  	<div <?php if (isset($name_error)): ?> class="form_error" <?php endif ?> >
	  <input type="text" name="username" placeholder="Username" value="<?php echo $username; ?>">
	  <?php if (isset($name_error)): ?>
	  	<span><?php echo $name_error; ?></span>
	  <?php endif ?>
  	</div>
  	<div <?php if (isset($email_error)): ?> class="form_error" <?php endif ?> >
      <input type="email" name="email" placeholder="Email" value="<?php echo $email; ?>">
      <?php if (isset($email_error)): ?>
      	<span><?php echo $email_error; ?></span>
      <?php endif ?>
  	</div>
  	<div>
  		<input type="password"  placeholder="Password" name="password">
  	</div>
  	<div>
  		<button type="submit" name="register" id="reg_btn">Register</button>
  	</div>
  </form>
  /body>
</html>




<?php 
   $db = mysqli_connect('localhost', 'root', '', 'food');
  $uid = "";
  $email = "";
  if (isset($_POST['sb'])) 
  
  {
  	
    $uid = $_POST['uid'];
  	$pass = $_POST['pass'];
    $email = $_POST['email'];
    
  	$sql_u = "SELECT * FROM registration WHERE userid='$uid'";
  	$sql_e = "SELECT * FROM registration WHERE email='$email'";
  	$res_u = mysqli_query($db, $sql_u);
  	$res_e = mysqli_query($db, $sql_e);

  	if (mysqli_num_rows($res_u) > 0) {
  	  $name_error = "Sorry... username already taken"; 	
  	}else if(mysqli_num_rows($res_e) > 0){
  	  $email_error = "Sorry... email already taken"; 	
  	}else{
           mysqli_query($db,"insert into registration(userid, password,email) values('$uid','$pass','$email')");
           echo "<script>alert('Registration SuccessFully');</script>";
           echo "<center>Registration SuccessFully ... Click to <a href='login.php'>login</a></center>";
           exit();
  	}
  }
?>
		</div>
			</div>
		
		</div>
	</div>
