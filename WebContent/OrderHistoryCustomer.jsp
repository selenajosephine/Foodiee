<%@page import="com.ilp.bean.OrderTable"%>
<%@page import="com.ilp.Dao.CustomerDbFunction"%>
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
<%
CustomerDbFunction obj = new CustomerDbFunction();
	long userId = 0;
	if(session.getAttribute("userId") == null){
		response.sendRedirect("login.jsp");
	}else userId = (Long) session.getAttribute("userId");
	ArrayList<OrderTable> orderList = (ArrayList<OrderTable>) obj.getAllOrders(userId);
%>
<body>
<%
		//allow access only if session exists
		
		
	%>
	<nav class="navbar navbar-inverse navbar-fixed-top">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" style="letter-spacing:5px;" href="FoodieeServlet?action=product">Foodiee</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a href="FoodieeServlet?action=product"><span class="glyphicon glyphicon-home"></span> Home</a></li>
      <li><a href="#"></a></li>
      <li><a href="#"></a></li>
    </ul>
      <ul class="nav navbar-nav navbar-right">
    	<li><a href="FoodieeServlet?action=viewCart"><span class="glyphicon glyphicon-shopping-cart"></span></a></li>
        <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#"><span class="glyphicon glyphicon-user"></span> My Account <span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="#">Profile Management</a></li>
          <li><a href="OrderHistoryCustomer.jsp">My Orders</a></li>
        </ul>
      </li>
      <li><a href="FoodieeServlet?action=logout"><span class="glyphicon glyphicon-log-out"></span> Logout</a></li>
    </ul>
    <form class="navbar-form navbar-right" action="">
      <div class="input-group">
        <input type="text" class="form-control" placeholder="Search" name="search">
        <div class="input-group-btn">
          <button class="btn btn-default" type="submit">
            <i class="glyphicon glyphicon-search"></i>
          </button>
        </div>
      </div>
    </form>
  </div>
</nav>
	<h1 style="margin-top: 100px;">Order History</h1>

	<div class="shopping-cart">
		<div class="column-labels">
			<label class="product-details">Order History</label> <label
				class="product-price">Date</label> 
				<label class="product-quantity">Status</label>
			<label class="">Payment Type</label> <label
				class="">Action</label> <label
				class="">Total Cost</label>
		</div>
		<%
			if (orderList != null) {
				for (OrderTable itr : orderList) {
		%>
		<div class="product">
			<div class="product-details">
				<div class="product-title"><%=itr.getOrderId()%></div>
			</div>
			<div class="product-price"><%=itr.getOrderDate()%></div>
			<div class="product-quantity"><%=itr.getOrderStatus()%></div>
			<div class="product-quantity"><%=itr.getPaymentType()%></div>
			<div class="product-removal">
				&nbsp;<a href="viewOrderCustomer.jsp?orderId=<%=itr.getOrderId()%>">View</a>
				<br><a href="ControllerServlet?action=delete&order=<%=itr.getOrderId() %>">Delete</a>
			</div>
			<div class="">
				&#8377;<%=itr.getTotalAmount()%></div>
		</div>
	</div>
	<%
		}
		}
	%>
	
	</div>
</body>
</html>