<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="com.ilp.bean.User" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet/less" type="text/css" href="style.less" />
<meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="//cdnjs.cloudflare.com/ajax/libs/less.js/3.0.2/less.min.js" ></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="che.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">


table
{
margin-top: 180px;
}
td,th
{
padding: 10px;
font-size: 25px;
}

td
{
font-family: "Times New Roman", Times, serif;
}


</style>
<style>
body{
    display: inline;
   }
.footer {
   position: fixed;
   left: 0;
   bottom: 0;
   width:100%;
   height:80px;
   background-color: lightseagreen;
   color: white;
   background-size:200px;
   text-align: center;
   margin-bottom: 0px;
}
</style>
</head>
<body bgcolor="#50a3a2" onload="myFunction()">
<div class="wrapper">
	<div class="container">
		<h1>My Profile</h1>
		
<form action="ProfileControl" method="get">
<% User user=new User(); %>
<% user=(User)request.getAttribute("List"); %>	
<center>
		Id:<input type="text"  name="userId" id="userId" value="<%= user.getUserId() %>" readonly="readonly">
		UserName:<input type="text"  name="name" id="name" value="<%= user.getUsername() %>">
				Email:<input type="text"  name="Email" id="Email" value="<%= user.getEmail() %>">
				Phone No:<input type="Phone No"  name="Phone No" id="Phone No" value="<%= user.getPhone() %>">
		<!-- 		<input type="submit" name="actions" value="Edit"> -->
			<a style="color:green" href="FoodieeServlet?action=product">Home</a>
			
		</center>
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

<div class="container">

<div class="footer">
<!-- <div class="row">
<div class="col-md-6">
<div align="left">
<img src="./img/dd.jpg" > </div>
</div> -->
<div class="row marketing">
        <div class="col-md-4">
          <p>
              <img src="./img/dd.jpg" class="img-responsive img-rounded center-block"  style="height: 70px; margin-left: 25px; margin-top: 5px;">
          </p>
          </div>
          <div class="col-md-4">
          <div style="margin-top: 60px;">
<p>About Foodiee<p> </div>
        </div>
        
<div class="col-md-4">
<div align="right" style="margin-right: 25px; margin-top: 5px;">
<p>Contact :123,ABC street,<br>Chennai-18.<br>
<span class="glyphicon glyphicon-earphone"> : 9876543210</span><br>
<span class="glyphicon glyphicon-print"> : 1-212-9876543</span></p></div>
</div>


</div>


</div>

</div>
<br><hr> 
</body>
</html>