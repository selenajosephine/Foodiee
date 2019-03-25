<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.ilp.Dao.OrderDbManage"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="payment.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css" />
<link rel="stylesheet"
	href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css" />
<link rel="stylesheet"
	href="https://rawgit.com/themetaro/uimax/master/uimax.css" />
<link rel="stylesheet"
	href="https://rawgit.com/IonDen/ion.rangeSlider/master/css/ion.rangeSlider.css" />
<link rel="stylesheet"
	href="https://rawgit.com/IonDen/ion.rangeSlider/master/css/ion.rangeSlider.skinFlat.css" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="pro.css" />
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="https://rawgit.com/IonDen/ion.rangeSlider/master/js/ion.rangeSlider.min.js"></script>
<script src="pros.js"></script>
<script src="location.js"></script>
</head>
<body>
<nav class="navbar navbar-inverse navbar-fixed-top">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" style="letter-spacing:5px;" href="#">Foodiee</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a href="FoodieeServlet?action=product">Home</a></li>
      <li><a href="#"></a></li>
      <li><a href="#"></a></li>
    </ul>
      <ul class="nav navbar-nav navbar-right">
    	<li><a href="FoodieeServlet?action=viewCart"><span class="glyphicon glyphicon-shopping-cart"></span></a></li>
      <li><a href="#"><span class="glyphicon glyphicon-user"></span> My Account</a></li>
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
<br>
<br>
<br>
<h1>Order status</h1>
<br>
<br>
<br>
<% OrderDbManage order = new OrderDbManage(); %>

<%=request.getAttribute("message") %> and your order id is:<%=order.getOrderId()%><br>
<br>
<a href="product.jsp">back to home page</a>
</body>
</html>