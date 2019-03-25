<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	  <%@ page import="java.util.*" %>
  <%@ page import="com.ilp.Dao.VendorInterface" %>
   <%@ page import="com.ilp.bean.Relation" %>
   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
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
<link rel="stylesheet" href="ViewOrders.js">
<link rel="stylesheet" href="ViewOrders.css">
</head>

<body> 

<%
	HashMap<String , Integer> orderList = new HashMap<String, Integer>();
orderList  = (HashMap<String , Integer> )request.getAttribute("orderList");
%>
<%

%> 
	<div class="wrapper">
	
		<div class="order-listing-wrapper">
			<h3 align="justify" style="font-family:courier;"> TODAY'S ORDERS</h3>
			<table class="table table-striped">
				<thead class="tableFloatingHeaderOriginal">
					<tr>
						<th><a href="">Product ID &nbsp;</a></th>
						<th><a href="">Ordered Quantity&nbsp;</a></th>
						<th class="hidden-print" style="min-width: 0px"></th>
					</tr>
				</thead>
				
		<%
			for (Map.Entry<String,Integer> entry : orderList.entrySet()) {
		%>
		<tr>
			<td><%=entry.getKey()%></td>
			<td><%=entry.getValue()%></td>
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