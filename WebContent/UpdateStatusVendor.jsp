<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*"%>
<%@ page import="com.ilp.Dao.VendorInterface"%>
<%@ page import="com.ilp.bean.Product"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Update Status</title>
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
<link rel="stylesheet" href="UpdateStatusVendor.js">
<link rel="stylesheet" href="UpdateStatusVendor.css">
</head>
<body>

<%
	long userId = Long.parseLong((String)session.getAttribute("userId"));
	Date date = new Date(System.currentTimeMillis()-24*60*60*1000);
	ArrayList<Product> customerOrderList = new ArrayList<Product>();
	
	

%>

<%

%>
	<div class="wrapper">
		<div class="order-listing-wrapper">
			<h3 align="justify" style="font-family: courier;">ORDERS</h3>
			<table class="table table-striped">
				<thead class="tableFloatingHeaderOriginal">
					<tr>
						<th><a href="">Product ID &nbsp;</a></th>
						<th><a href="">Product Name&nbsp;</a></th>
						<th><a href="">Quantity &nbsp;</a></th>
						<th><a href="">Price&nbsp;</a></th>
						<th class="hidden-print" style="min-width: 0px"></th>
					</tr>
				</thead>
				<%
			for (Product p : customerOrderList) {
		%>
				<tr>
					<td><%=p.getProductId()%></td>
					<td><%=p.getProductName()%></td>
					<td><%=p.getQuantity()%></td>
					<td><%=p.getPrice()%></td>
				</tr>
				<%
			}
		%>
			</table>
		</div>
	</div>
	<a href="VendorHome.jsp"><button>Home</button></a>
</body>
</html>
