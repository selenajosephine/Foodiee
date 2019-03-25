<!DOCTYPE html>
<html lang="en">
<head>
  <title>FOODIEE</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
 
 
  <style>
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
      background: #50a3a2;
      color: #bdbdbd;
  }
  .bg-1 h3 {color: #fff;}
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
      color: #555;
  }
  .btn {
      padding: 10px 20px;
      background-color: #333;
      color: #f1f1f1;
      border-radius: 0;
      transition: .2s;
  }
  .btn:hover, .btn:focus {
      border: 1px solid #333;
      background-color: #fff;
      color: #000;
  }
  .modal-header, h5, .close {
      background-color: #333;
      color: #fff !important;
      text-align: center;
      font-size: 30px;
  }
  .modal-header, .modal-body {
      padding: 40px 50px;
  }  
  </style>
 
 
</head>
<body id="myPage" data-spy="scroll" data-target=".navbar" data-offset="50">
<%
		//allow access only if session exists
		
		long userId;
		if(session.getAttribute("userId") == null){
			response.sendRedirect("login.jsp");
		}else userId = (Long) session.getAttribute("userId");
	%>

<h1 align="center"> ADMINISTRATION OF FOODIEE'S </h1>
<h2 align="right" style="margin-top: 10px;"><a href="FoodieeServlet?action=logout"><span class="glyphicon glyphicon-log-out"></span> Logout</a>
</h2>

<br> <br>
<h5 align="justify"> Hello! Here you can add the details of your vendors, view them and delete them </h5>
<br><br><br><br>
<div id="band" class="container text-center">
  
  <div class="row">
    <div class="col-sm-4">
          <p class="text-center"><strong>ADD VENDORS</strong></p><br>
    
      <a href="addvendor.jsp">
        <img src="adds.png" class="img-circle person" alt="Random Name" width="255" height="255">
      </a>
      <div id="demo" class="collapse">
       
      </div>
    </div>
    <div class="col-sm-4">
          <p class="text-center"><strong>VIEW VENDORS</strong></p><br>
    
      <a href="AddServlet?action=view">
        <img src="viewvendor.jpg" class="img-circle person" alt="Random Name" width="255" height="255">
      </a>
      <div id="demo2" class="collapse">
       
      </div>
    </div>
    <div class="col-sm-4">
      <p class="text-center"><strong>DELETE VENDORS</strong></p><br>
      <a href="delete.jsp">
        <img src="delete.jpg" class="img-circle person" alt="Random Name" width="20" height="255">
      </a>
      <div id="demo3" class="collapse">
        
      </div>
    </div>
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
