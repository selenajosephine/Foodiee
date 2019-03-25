<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
<link rel="stylesheet/less" type="text/css" href="styles.less" />
<script src="//cdnjs.cloudflare.com/ajax/libs/less.js/3.0.2/less.min.js" ></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<script src="che.js"></script>
<script src="loginValidation.js"></script>
</head>
<body bgcolor="#50a3a2" onload="myFunction()">
<div class="wrapper">
	<div class="container">
		<h1>Welcome</h1>
		
		<form class="form" action="FoodieeServlet" method="post">
			<input type="text" placeholder="User Id" name="userId" id="userId">
			<input type="password" placeholder="Password" name="password" id="password">
			<button type="submit" id="login-button" name="action" value="login">Login</button>
			<p>Not a member! <a style="color:green;text-decoration:none;" href="signup.jsp">Signup</a></p>
		</form>
		<%
		if(request.getAttribute("message") != null) {
		%>
			<p style="color:red;"><%=request.getAttribute("message").toString() %></p>
		<%
			}
		%>
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

