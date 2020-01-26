<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>MetaGamer</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href = "bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css">
</head>
<body background="img/bg1.jpg">
 <nav class="navbar navbar-expand-sm bg-dark navbar-dark fixed-top">
  <!-- Brand -->
  <a class="navbar-brand" href="welcome.jsp">MetaGamer</a>

  <!-- Links -->
  <ul class="navbar-nav">
  
  <% if(session.getAttribute("user_id")==null){  %>
    <li class="nav-item">
      <a class="nav-link" href="signup.jsp">Sign Up</a>
    </li>
    
    <li class="nav-item">
				<!--<a class="nav-link" href="http://localhost:8001/GMW/login.jsp">Log In</a>--> 
				<button type="button" class="btn btn-info" data-toggle="modal" data-target="#myModal">Log In</button>
				<!-- Modal -->
				<div id="myModal" class="modal fade" role="dialog" data-backdrop="false">
					<div class="modal-dialog">
						<!-- Modal content-->
						<div class="modal-content">
							<div class="modal-header">
							<h4 class="modal-title">Log In</h4>
								<button type="button" class="close" data-dismiss="modal">&times;</button>
								
						</div>
							<div class="modal-body">
							<%@include  file="login.jsp" %>
								
						</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default"
								data-dismiss="modal">Close</button>
						</div>
					</div>

				</div>
			</div>


		</li>
	<%  } else{ %>
	<li class="nav-item">
    	<button type="button" class="btn btn-info" data-toggle="modal" data-target="#myModal2"><%= session.getAttribute("user_name") %></button>
      <!--<a class="nav-link" href="#"><%= session.getAttribute("user_id") %></a>-->
      <div id="myModal2" class="modal fade" role="dialog" data-backdrop="false">
					<div class="modal-dialog">
						<!-- Modal content-->
						<div class="modal-content">
							<div class="modal-header">
							<h4 class="modal-title">Log out from session ?</h4>
								<button type="button" class="close" data-dismiss="modal">&times;</button>
								
						</div>
							<div class="modal-body">
							<form action="logout" method="get">
								<input id="logutbtn"type ="submit" class="btn btn-success" value="Logout" name="submit"/>
							</form>
								
						</div>

					</div>

				</div>
			</div>
    </li>
    <%  } %>
    
	
    <!-- Dropdown -->
    <li class="nav-item dropdown">
      <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
        Show Games
      </a>
      <div class="dropdown-menu">
        <a class="dropdown-item" href="${pageContext.request.contextPath}/showgames">Show all</a>
      </div>
    </li>
    
    
	</ul>
  
</nav>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js" integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1" crossorigin="anonymous"></script>
</body>
</html>