<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<%@include  file="navbar.jsp" %>
<meta charset="ISO-8859-1">
<title>MetaGamer</title>
<link href = "bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css">
<style>
    html,
    body {
        height: 50%;
    }

    .carousel,
    .item,
    .active {
        height: 70%;
    }
    
    .carousel-content {
  position: absolute;
  bottom: 10%;
  left: 5%;
  z-index: 20;
  color: white;
  text-shadow: 0 1px 2px rgba(0,0,0,.6);
}

    .carousel-inner {
        height: 70%;
    }

    /* Background images are set within the HTML using inline CSS, not here */

    .fill {
        width: 100%;
        height: 100%;
        background-position: center;
        -webkit-background-size: cover;
        -moz-background-size: cover;
        background-size: cover;
        -o-background-size: cover;
    }

    footer {
        margin: 50px 0;
    } 

    .tester {
        height: 100%;
    }
    </style>
</head>
<body >
	<h1>Home</h1>

<div id="carouselExampleControls" class="col-lg-12 col-md-12 col-sm-12 col-xs-12" data-ride="carousel">
  <div class="carousel-inner" role="listbox" style=" width:100%; height: 100% !important;">
    <div class="carousel-item active">
      <img class="d-block w-100" src="img/gow.jpg" alt="First slide">
      <div class="carousel-content">
        <h2>All your gaming info in one place</h2>
        <p>From review scores from all sites to infos and trailers.</p>
      </div>
    </div>
    <div class="carousel-item">
      <img class="d-block w-100" src="img/kb.jpg" alt="Second slide">
      <div class="carousel-content">
        <h2>Make your voice heard</h2>
        <p>Give your own reviews with score</p>
      </div>
      
    </div>
  </div>
  <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>

<h1 style="color:floralwhite">Trending </h1>


<div class="card" style="width: 18rem;">
  <img class="card-img-top" src="img/cod.jpg" alt="Card image cap">
  <div class="card-body">
    <p class="card-text">Call of Duty Modern Warfare.</p>
  </div>
</div>



</body>
<%@include  file="footer.html" %>
</html>