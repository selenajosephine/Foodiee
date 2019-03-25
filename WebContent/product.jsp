<%@page import="com.ilp.bean.Product"%>
<%@page import="java.util.ArrayList"%>
<%@page import="javax.servlet.http.HttpSession" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- <p>I will display &#8377;</p>
<p>I will display &#x20B9;</p> -->
<html>
<head>
<meta charset="ISO-8859-1">
<title>Menu</title>
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
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<%
	ArrayList<Product> productList = (ArrayList<Product>)request.getAttribute("productList");
%>
<body style="background-image:url(img/main_background.png); background-repeat: no-repeat;
    background-attachment: fixed;  background-size: cover;">
	<%
		//allow access only if session exists
		
		long userId;
		if(session.getAttribute("userId") == null){
			response.sendRedirect("login.jsp");
		}else userId = (Long) session.getAttribute("userId");
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
          <li><a href="ProfileControl?action=list">Profile Management</a></li>
          <li><a href="OrderHistoryCustomer.jsp">My Orders</a></li>
        </ul>
      </li>
      <li><a href="FoodieeServlet?action=logout"><span class="glyphicon glyphicon-log-out"></span> Logout</a></li>
    </ul>
    <form class="navbar-form navbar-right" action="FoodieeServlet">
      <div class="input-group">
        <input type="text" class="form-control" placeholder="Search" name="search" required>
        <div class="input-group-btn">
          <button class="btn btn-default" type="submit" name="action" value="search">
            <i class="glyphicon glyphicon-search"></i>
          </button>
        </div>
      </div>
    </form>
  </div>
</nav>
	
	
	<div class="uimax-block-section-26 pdt-80 pdb-80">
		<div class="container">
			<div class="row">
				<div class="col-md-8">
					<div class="product-list">
					<%	if(productList != null) {
						for(Product itr:productList) {%>
						<div class="item">
							<div class="product-item">
								<div class="pic-wrapper">
									<a href="javascript:void(0)" class="inner"> <img
										src="img/<%=itr.getProductName() %>.jpg" alt="" class="pic" />
									</a>
								</div>
								<div class="product-desc">
									<h2 class="name">
										<a href="javascript:void(0)"><%=itr.getProductName() %></a>
									</h2>
									<div class="price">&#8377;<%=itr.getPrice() %></div>
									<div class="old-price">&#8377;<%=itr.getPrice()+10 %></div>
								</div>
								<%if(itr.getQuantity()<11){%><span class="sale">Only few left </span><%} %> <button
									class="btn btn-add-cart" onclick="addItem(<%=itr.getProductId()%>,'<%=itr.getProductName()%>')">addcart</button> <a
									href="javascript:void(0)" class="btn btn-wishlist">Wishlist</a>
							</div>
						</div>
				<%} }%>
					</div>
				</div>
				<div class="col-md-4">
					<div class="uimax-sidebar">
						<div class="product-filter">
							<div class="categories-list block">
								<div class="title">Categories</div>
								<div class="form-search">
									<input type="text" class="form-control" placeholder="search" />
									<button class="btn btn-search">
										<i class="ion-ios-search-strong"></i>
									</button>
								</div>
								<ul class="list">
									<li><a href="javascript:void(0)">Veg</a></li>
									<li><a href="javascript:void(0)">Non Veg</a></li>
									<li><a href="javascript:void(0)">Breakfast</a></li>
									<li><a href="javascript:void(0)">Lunch</a></li>
									<li><a href="javascript:void(0)">Snacks</a></li>
									<li><a href="javascript:void(0)">Dinner</a></li>
								</ul>
							</div>
					<!-- 		<div class="block size-filter">
								<div class="title">size</div>
								<div class="select-group">
									<select name="size" id="" class="form-control">
										<option value="S">XS</option>
										<option value="S">S</option>
										<option value="S">M</option>
										<option value="S">L</option>
										<option value="S">XL</option>
										<option value="S">XXL</option>
									</select>
								</div>
							</div>
							<div class="block brands">
								<div class="title">Brands</div>
								<div class="list-brands">
									<div class="checkbox checkbox-primary">
										<input id="checkbox1" type="checkbox" class="styled">
										<label for="checkbox1">ASOS</label>
									</div>
									<div class="checkbox checkbox-primary">
										<input id="checkbox2" type="checkbox" class="styled">
										<label for="checkbox2">Versace</label>
									</div>
									<div class="checkbox checkbox-primary">
										<input id="checkbox3" type="checkbox" class="styled">
										<label for="checkbox3">Zara</label>
									</div>
									<div class="checkbox checkbox-primary">
										<input id="checkbox4" type="checkbox" class="styled">
										<label for="checkbox4">Topshop</label>
									</div>
									<div class="checkbox checkbox-primary">
										<input id="checkbox5" type="checkbox" class="styled">
										<label for="checkbox5">George at Asda</label>
									</div>
								</div>
							</div>
							<div class="block color-filter">
								<div class="title">Color</div>
								<div class="color-list">
									<a href="javascript:void(0)" class="color active"
										style="background-color: #C51162"></a> <a
										href="javascript:void(0)" class="color"
										style="background-color: #1565C0"></a> <a
										href="javascript:void(0)" class="color"
										style="background-color: #FFCA28"></a> <a
										href="javascript:void(0)" class="color"
										style="background-color: #000000"></a> <a
										href="javascript:void(0)" class="color"
										style="background-color: #4DB6AC"></a> <a
										href="javascript:void(0)" class="color"
										style="background-color: #E57373"></a> <a
										href="javascript:void(0)" class="color"
										style="background-color: #BCAAA4"></a> <a
										href="javascript:void(0)" class="color"
										style="background-color: #78909C"></a> <a
										href="javascript:void(0)" class="color"
										style="background-color: #9CCC65"></a> <a
										href="javascript:void(0)" class="color"
										style="background-color: #1A237E"></a> <a
										href="javascript:void(0)" class="color"
										style="background-color: #FFEB3B"></a> <a
										href="javascript:void(0)" class="color"
										style="background-color: #FF7043"></a>
								</div>
							</div> -->
							<div class="block price-range">
								<div class="title">Price</div>
								<input type="text" id="price-range" name="price" value="" />
							</div>
						</div>
					</div>
				</div>
				<div class="clearfix"></div>
			</div>
		</div>
	</div>
</body>
</html>