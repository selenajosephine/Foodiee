<%@page import="com.ilp.bean.CartItem"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View Cart</title>
<link rel="icon" href="favicon.ico" type="image/x-icon">
<script src="https://cdnjs.cloudflare.com/ajax/libs/vue/2.1.10/vue.min.js"></script>
<script src="cart.js" ></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="cart.css">
</head>
<body>
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
<h1 style="margin-top:100px;">Shopping Cart</h1>

<div class="shopping-cart">

  <div class="column-labels">
    <label class="product-image">Image</label>
    <label class="product-details">Product</label>
    <label class="product-price">Price</label>
    <label class="product-quantity">Quantity</label>
    <label class="product-removal">Remove</label>
    <label class="product-line-price">Total</label>
  </div>
<%
	ArrayList<CartItem> itemList = (ArrayList<CartItem>)request.getAttribute("cartItems");
	if(itemList != null) {
		for(CartItem itr:itemList) {
%>
  <div class="product">
    <div class="product-image">
      <img src="img/<%=itr.getProductName() %>.jpg">
    </div>
    <div class="product-details">
      <div class="product-title"><%=itr.getProductName()%></div>
    </div>
    <div class="product-price" id="price<%=itr.getProductId() %>" name="price">&#8377;<%=itr.getPrice()%></div>
    <div class="product-quantity">
      <input type="number" value="<%=itr.getQuantity()%>" min="1" max="10" id="quantity<%=itr.getProductId() %>" name="quantity" onchange="myfunction(<%=itr.getProductId() %>)">
    </div>
    <div class="product-removal">
     <a href="FoodieeServlet?action=delete&productId=<%=itr.getProductId() %>"> <button class="remove-product">
        Remove
      </button> </a>
    </div>
    <div class="product-line-price" id="finalPrice<%=itr.getProductId() %>" name="finalPrice">&#8377;<%=itr.getPrice()*itr.getQuantity()%></div>
  </div><p></p>
<%
		}
%>
	 <script type="text/javascript">
	 function myfunction(productId) {
     // $("#quantity").bind('input', function () {
    	    //alert("changed");  
    	    // document.getElementById("p").innerHTML=this.value;
    	    p = document.getElementById("price"+productId).innerHTML;
    	    var price = parseInt(document.getElementById("price"+productId).innerHTML.slice(1));
    	    var quantity = parseInt(document.getElementById("quantity"+productId).value);
    	    document.getElementById("finalPrice"+productId).innerHTML = "&#8377;"+price * quantity;
    	//});
	 }
      </script>
 <!--  <div class="totals">
    <div class="totals-item totals-item-total">
      <label>Grand Total</label>
      <div class="totals-value" id="cart-total">&#8377;0.00</div>
    </div>
  </div> -->
      
  <a href="payment.jsp" ><button class="checkout">Checkout</button></a>
<%
	}
%>
</div>
</body>
</html>