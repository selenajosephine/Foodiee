<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">
body
{
background: url(cust.jpg) no-repeat center center fixed;
  -webkit-background-size: cover;
  -moz-background-size: cover;
  -o-background-size: cover;
  background-size: cover;
}

</style>
</head>
<body>
<center>
<form action="VendorServlet" method="get" style="padding: 5px; margin-top: 180px; font-size: 25px;" >
CustomerId :  <input type="text" name="customerId" required>
<br>
<br>
<button type="submit" name="action" value="update">ViewDeliveryData</button>
</form>
</center>
</body>
</html>