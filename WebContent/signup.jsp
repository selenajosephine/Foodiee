<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sign Up</title>
<link rel="stylesheet/less" type="text/css" href="styles.less" />
<script src="//cdnjs.cloudflare.com/ajax/libs/less.js/3.0.2/less.min.js" ></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js" integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.bundle.min.js" integrity="sha384-lZmvU/TzxoIQIOD9yQDEpvxp6wEU32Fy0ckUgOH4EIlMOCdR823rg4+3gWRwnX1M" crossorigin="anonymous"></script>
<script src="che.js"></script>
<script src="location.js"></script>
<script src="signupValidation.js"></script>
</head>
<body style="background-color:#50a3a2;" onload="getcity(); myFunction()">
<div class="wrapper">
	<div class="container" style="padding-top:10px;">
		<h1>Welcome</h1>
		
		<form class="form" action="FoodieeServlet" method="post">
		<div class="row">
			<input type="text" placeholder="User Id" id="userId" name="userId">
			<input type="text" placeholder="Username" id="username" name="username">
		</div>
		<div class="row">
			<input type="password" placeholder="Password" id="password" name="password">
			<input type="email" placeholder="Email" id="email" name="email">
		</div>
		<div class="row">
			<select id="city" name="city" onchange="changecenter(this.value)" >
				<option value="">---Select City---</option>
				
			</select>
			<select id="center" name="center">
				<option value="">---Select Center---</option>
			</select>
		</div>
			<input type="tel" placeholder="Phone" id="phone" name="phone">
			<button type="submit" id="login-button" name="action" value="signup">SignUp</button>
			<p>Already a member! <a style="color:green" href="login.jsp">Login</a></p>
		</form>
	</div>
	
	<ul class="bg-bubbles">
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
	</ul>
</div>
</body>
</html>