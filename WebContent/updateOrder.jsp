<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.ilp.bean.DeliveryBean" %>
    <%@page import="java.util.ArrayList" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Insert title here</title>
<style type="text/css">
table
{
margin-top: 180px;
}
</style>
</head>
<body>
<%ArrayList<DeliveryBean> orderList = new ArrayList<DeliveryBean>(); 
orderList =(ArrayList<DeliveryBean>)request.getAttribute("deliverylist");
%>
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">Foodiee</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a href="VendorHome.jsp"><span class="glyphicon glyphicon-home"></span> Home</a></li>
     </ul>
     <ul class="nav navbar-nav navbar-right"> <li><a href="FoodieeServlet?action=logout"><span class="glyphicon glyphicon-log-out"></span> Logout</a></li>
    </ul>
  </div>
</nav>
<center>
 <table class="table table-striped">
    <thead>
      <tr>
        <th>OrderId</th>
        <th>productName</th>
        <th>customerId</th>
        <th>price</th>
         <th>quantity</th> 
      </tr>
    </thead>
    		<%
			for (DeliveryBean p : orderList) {
		%>
    <tbody>
      <tr>
        <td><%=p.getOrderId() %></td>
        <td><%=p.getProductName() %></td>
        <td><%=p.getCustomerId() %></td>
        <td><%=p.getPrice() %></td>
        <td><%=p.getQuantity() %></td>
     	<td><a href="VendorServlet?action=deliver&orderId=<%=p.getOrderId()%>&customerId=<%=p.getCustomerId() %>">Done</a></td>
      </tr>
     </tbody>
     <%} %>
  </table>

</table>
</center>
</body>
</html>