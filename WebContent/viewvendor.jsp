<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.ilp.bean.Admin" %>
    <%@page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>


<style>

th
{
color:yellow;
font-family:arial;
}
th,td
{
padding:8px;
width:5px;
}

.container {
padding: 80px 120px;
}
.button {
display: inline-block;
padding: 15px 25px;
font-size: 24px;
cursor: pointer;
text-align: center;
text-decoration: none;
outline: none;
color: #fff ;
background-color: #4CAF50 ;
border: none;
border-radius: 15px;
box-shadow: 0 9px #999 ;
}
.person {
border: 10px solid transparent;
margin-bottom: 25px;
width: 80%;
height: 80%;
opacity: 0.7;
}
.person:hover {
border-color: #f1f1f1 ;
}
.carousel-inner img {
-webkit-filter: grayscale(90%);
filter: grayscale(90%); /* make all photos black and white / 
width: 100%; / Set width to 100% /
margin: auto;
}
.carousel-caption h3 {
color: #fff !important;
}
@media (max-width: 600px) {
.carousel-caption {
display: none; / Hide the carousel text when the screen is less than 600 pixels wide */
}
}
.bg-1 {
background: #2d2d30 ;
color: #bdbdbd ;
}
.bg-1 h3 {color: #fff ;}
.bg-1 p {font-style: italic;}
.list-group-item:first-child {
border-top-right-radius: 0;
border-top-left-radius: 0;
}
.list-group-item:last-child {
border-bottom-right-radius: 0;
border-bottom-left-radius: 0;
}
.thumbnail {
padding: 0 0 15px 0;
border: none;
border-radius: 0;
}
.thumbnail p {
margin-top: 15px;
color: #555 ;
}
.btn {
padding: 10px 20px;
background-color: #333 ;
color: #f1f1f1 ;
border-radius: 0;
transition: .2s;
}
.btn:hover, .btn:focus {
border: 1px solid #333 ;
background-color: #fff ;
color: #000 ;
}
.modal-header, h4, .close {
background-color: #333 ;
color: #fff !important;
text-align: center;
font-size: 30px;
}
.modal-header, .modal-body {
padding: 40px 50px;
}

.button {
    background-color: green;
    border: none;
    color: white;
    padding: 15px 32px;
    text-align: center;
    text-decoration: none;
    font-size: 16px;
    cursor: pointer;
}

.nav-tabs li a {
color: #777 ;
}
#googleMap {
width: 100%;
height: 400px;
-webkit-filter: grayscale(100%);
filter: grayscale(100%);
}


.footer {
   position: fixed;
   left: 0;
   bottom: 0;
   width:100%;
   height:80px;
   background-color: black;
   color: white;
   background-size:200px;
   text-align: center;
   margin-bottom: 0px;
}
.modal-header, h2, .close {
      background-color: #333;
      color: #fff !important;
      text-align: center;
      font-size: 30px;
  }
</style>


<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/vue/2.1.10/vue.min.js"></script>
<script src="cart.js" ></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="viewvendor.css">
<link rel="stylesheet" href="viewvendor.js">
</head>
<%ArrayList<Admin> vendorList=(ArrayList<Admin>)request.getAttribute("vendorList") ;%>
<body>  


<%
		//allow access only if session exists
		
		long userId;
		if(session.getAttribute("userId") == null){
			response.sendRedirect("login.jsp");
		}else userId = (Long) session.getAttribute("userId");
	%>
<nav class="navbar navbar-default navbar-fixed-top">
<div class="container-fluid">
<div class="navbar-header">
<button type="button" class="navbar-toggle" data-toggle="collapse" data-target= #myNavbar ">
<span class="icon-bar"></span>
<span class="icon-bar"></span>
<span class="icon-bar"></span>

</button>
<a class="navbar-brand" href= # ">FOODIEE</a>
</div>
<div class="collapse navbar-collapse" id="myNavbar">
<ul class="nav navbar-nav navbar-right">
<li><a href="AdminHome.jsp">HOME</a></li>
<li><a href="FoodieeServlet?action=logout"><span class="glyphicon glyphicon-log-out"></span> Logout</a></li>


  </ul>
</div>
</div>
</nav>



<div class="wrapper">
  <div class="order-listing-wrapper">
    <h2 align="center">THE VENDORS LIST</h2>
     <br> <br> 
    <table class="table table-striped">
      <thead class="tableFloatingHeaderOriginal">
        <tr>
          <th>
            <a href=""> Vendor ID </a>
          </th>
          <th>
            <a href="">Vendor Name</a>
          </th>
          <th>
            <a href="">Phone Number</a>
          </th>
          <th>
            <a href="">Email ID</a>
          </th>
          <th>
            <a href=""> Center ID </a>
          </th>
          <th class="hidden-print" style="min-width: 0px"></th>
        </tr>
        
        
        <%for(Admin ad:vendorList){ %>
<tr>
<td>
<%=ad.getUserId()%>
</td>
<td>
<%=ad.getUsername() %>
</td>
<td>
<%=ad.getPhone() %>
</td>
<td>
<%=ad.getEmail() %>
</td>
<td>
<%=ad.getCenterId() %>
</td>
</tr>
<%} %>
 
      </thead>
  </table>
  </div>                  
   </div>  
   
   <div class="container">

<div class="footer">

<div class="row marketing">
        <div class="col-md-4">
          <p>
              <img src="dd.jpg" class="img-responsive img-rounded center-block"  style="height: 70px; margin-left: 25px; margin-top: 5px;">
          </p>
          </div>
          <div class="col-md-4">
          <div style="margin-top: 60px;">
			<p>ABOUT FOODIEE'S<p> </div>
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
     
</body>
</html>