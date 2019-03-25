<!DOCTYPE html>
<html lang="en">
<head>
  <!-- Theme Made By www.w3schools.com - No Copyright -->
  <title>Vendor Home</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <style>
  .container {
      padding: 80px 120px;
  }
  .person {
      border: 10px solid transparent;
      margin-bottom: 25px;
      width: 80%;
      height: 80%;
      opacity: 0.7;
  }
  .person:hover {
      border-color: #f1f1f1;
  }
  .carousel-inner img {
      -webkit-filter: grayscale(90%);
      filter: grayscale(90%); /* make all photos black and white */ 
      width: 100%; /* Set width to 100% */
      margin: auto;
  }
  .carousel-caption h3 {
      color: #fff !important;
  }
  @media (max-width: 600px) {
    .carousel-caption {
      display: none; /* Hide the carousel text when the screen is less than 600 pixels wide */
    }
  }
  .bg-1 {
      background: #2d2d30;
      color: #bdbdbd;
  }
  .bg-1 h3 {color: #fff;}
  .bg-1 p {font-style: italic;}
  </style>
  <style type="text/css">
body{
background: url(vendor.jpg) no-repeat center center fixed;
  -webkit-background-size: cover;
  -moz-background-size: cover;
  -o-background-size: cover;
  background-size: cover;
}
</style>
</head>
<body>
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


<div class="container text-center">
<div class="jumbotron" style="">
<h1 >VENDOR HOME</h1>
<br>
<br>
<br>
<br>
  <br>
  <div class="row">
    <div class="col-sm-4">
      <a href="VendorServlet?action=view" class="btn btn-primary">Today's Order</a>

   
      
      
      <div id="demo" class="collapse">
       
      </div>
    </div>
    <div class="col-sm-4">
      <a href="#demo2" data-toggle="collapse">
      </a>
      <div id="demo2" class="collapse">
        
      </div>
    </div>
    <div class="col-sm-4">
      <a href=".jsp">
       <a href="updateDeliveryStatus.jsp" class="btn btn-primary">Delivery</a>
        <!-- <img src="Update.jpg" class="img-circle person" alt="Random Name" width="255" height="255"> -->
      </a>
      <div id="demo3" class="collapse">
      
      </div>
    </div>
  </div>
</div>
</div>


</body>
</html>
