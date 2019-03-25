<%@page import="com.ilp.Dao.CustomerDbFunction"%>
<%@page import="com.ilp.bean.Product"%>
<%@page import="com.ilp.Dao.OrderDbManage"%>
<%@page import="com.ilp.bean.CartItem"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Order History</title>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/vue/2.1.10/vue.min.js"></script>
<script src="cart.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script angular.c
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="cart.css">
</head>
<body>
	<nav class="navbar navbar-inverse navbar-fixed-top">
	<div class="container-fluid">
		<div class="navbar-header">
			<a class="navbar-brand" style="letter-spacing: 5px;" href="#">Foodiee</a>
		</div>
		<ul class="nav navbar-nav">
			<li class="active"><a href="FoodieeServlet?action=product">Home</a></li>
			<li><a href="#"></a></li>
			<li><a href="#"></a></li>
		</ul>
		<ul class="nav navbar-nav navbar-right">
			<li><a href="#"><span
					class="glyphicon glyphicon-shopping-cart"></span></a></li>
			<li><a href="#"><span class="glyphicon glyphicon-user"></span>
					My Account</a></li>
			<li><a href="FoodieeServlet?action=logout"><span
					class="glyphicon glyphicon-log-out"></span> Logout</a></li>
		</ul>
		<form class="navbar-form navbar-right" action="">
			<div class="input-group">
				<input type="text" class="form-control" placeholder="Search"
					name="search">
				<div class="input-group-btn">
					<button class="btn btn-default" type="submit">
						<i class="glyphicon glyphicon-search"></i>
					</button>
				</div>
			</div>
		</form>
	</div>
	</nav>
	<h1 style="margin-top: 100px;">Order Details</h1>

	<div class="shopping-cart">
		<div class="column-labels">
			<label class="product-details">Product Name</label> 
			<label class="product-price">Price</label> 
			
			<label class="">Category</label> 
			<div class="product-price">&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;</div>
				<label class="">&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;</label> 
			<label class="">Quantity</label> 
		</div>
		<%
			String orderId = request.getParameter("orderId");
			CustomerDbFunction obj = new CustomerDbFunction();
			ArrayList<Product> viewOrderList = new ArrayList<Product>();
			
		 	viewOrderList = obj.viewOrder(orderId);
			for(Product itr:viewOrderList){   
		%>

		<div class="product">
			<div class="product-details">
				<div class="product-title"><%=itr.getProductName()%></div>
			</div>
			<div class="product-price"><%=itr.getPrice()%></div>
			<div class="product-price">&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;</div>
			<div class="product-quantity"><%=itr.getCategory()%></div>&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;
			<div class="product-price">&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;</div>
			<div class="product-quantity"><%=itr.getQuantity()%></div>
					
	</div>
	</div>
<%
		 	} 
%>

	</div>
</body>
</html>