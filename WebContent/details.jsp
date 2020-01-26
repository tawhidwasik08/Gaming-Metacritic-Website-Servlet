<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.ArrayList" %>

<!DOCTYPE html>
<html>
<head>
<%@include  file="navbar.jsp" %>
<meta charset="ISO-8859-1">
<title>MetaGame</title>
<!--<link href = "bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css">-->
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link href="extra_css/tabs.css" rel="stylesheet" type="text/css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<body>
	
	<h1>
		Game Details
		<%
		String image = (String) request.getAttribute("image");
		%>
		
		<div style="display: flex; justify-content: center;" >
		  <img src="<%out.println(image);%>" style="width: 200px; height: 200px;" />
		</div>
		
		<div style="color:white;display: flex; justify-content: center;" >
		  <h2> <%out.println(request.getAttribute("name"));%></h2>
		</div>
		<div style="color:white;display: flex; justify-content: center;" >
		  <h2> Average Critic Review Score: <%out.println(request.getAttribute("avg"));%></h2>
		</div>
		
	</h1>
		<div style="color:white;display: flex; justify-content: center;" >
		 <p>  <%out.println(request.getAttribute("sum"));%></p>
		</div>
		
	
		
		<% if (session.getAttribute("user_reviewed")==null) { %>
			<div style="display: flex; justify-content: center;" >
				<form>
					<input id="submitbtn" type ="submit" class="btn btn-success" value="Login to post a review" name="submit" disabled/>
				</form>
			</div>
			<%} else if((int)session.getAttribute("user_reviewed")==0){%>
				<div class="container">
				<form action="addreview" method="post">
					<label for="review" class="control-label" style="color:white;" >Your Review:</label>
					<div class="row">
						<div class="col-md-12">
							<input type ="text" class="form-control" name="review" placeholder="Write a review here." />
						</div>		 		
					</div>

					<p style="color:white;">Score:</p>
					<label class="radio-inline" style="color:white;">
				      <input type="radio" name="score" value=0 checked>0
				    </label>
				    <label class="radio-inline" style="color:white;">
				      <input type="radio" name="score" value=1 >1
				    </label>
				    <label class="radio-inline" style="color:white;">
				      <input type="radio" name="score" value=2>2
				    </label>
				     <label class="radio-inline" style="color:white;">
				      <input type="radio" name="score" value=3 >3
				    </label>
				     <label class="radio-inline" style="color:white;">
				      <input type="radio" name="score" value=4 >4
				    </label>
				     <label class="radio-inline" style="color:white;">
				      <input type="radio" name="score" value=5>5
				    </label>
				     <label class="radio-inline" style="color:white;">
				      <input type="radio" name="score" value=6>6
				    </label>
				     <label class="radio-inline" style="color:white;">
				      <input type="radio" name="score" value=7>7
				    </label>
				     <label class="radio-inline" style="color:white;">
				      <input type="radio" name="score" value=8>8
				    </label>
				     <label class="radio-inline" style="color:white;">
				      <input type="radio" name="score" value=9>9
				    </label>
				    
				     <label class="radio-inline" style="color:white;">
				      <input type="radio" name="score" value=10>10
				    </label>
				    
				    
					
				    <input type="hidden" name="game_id" value=<%out.println(request.getAttribute("game_id"));%>></input>
						  
						  
						  <div class="row">
						<div class="col-md-2">
							<input id="submitbtn" type ="submit" class="btn btn-success" value="Submit Review" name="Submit Review"/>
						</div>		 		
					</div>
					

	
				</form>
				
				</div>
				<% } else if ((int)session.getAttribute("user_reviewed")==1){%>
				<form>
					<input type ="text" class="form-control" name="user_review" placeholder="You already have a review for this game"  disabled/>
				</form>
				
				<% } %>
	
	</h3>
	
	
	
	
	 <div class="container">
              <div class="row">
                <div class="col-xs-12 ">
                  <nav>
                    <div class="nav nav-tabs nav-fill" id="nav-tab" role="tablist">
                      <a class="nav-item nav-link active" id="nav-critic-tab" data-toggle="tab" href="#nav-critic" role="tab" aria-controls="nav-home" aria-selected="true">Critic Reviews</a>
                      <a class="nav-item nav-link" id="nav-user-tab" data-toggle="tab" href="#nav-user" role="tab" aria-controls="nav-profile" aria-selected="false">User Reviews</a>
                      <a class="nav-item nav-link" id="nav-info-tab" data-toggle="tab" href="#nav-info" role="tab" aria-controls="nav-contact" aria-selected="false">Infos</a>
                      <a class="nav-item nav-link" id="nav-trailer-tab" data-toggle="tab" href="#nav-trailer" role="tab" aria-controls="nav-about" aria-selected="false">Trailer</a>
                    </div>
                  </nav>
                  <div class="tab-content py-3 px-3 px-sm-0" id="nav-tabContent">
                    <div class="tab-pane fade show active" id="nav-critic" role="tabpanel" aria-labelledby="nav-home-tab">
                    <ul class="list-group list-group-flush">
						<%
						
						ArrayList<String> c_names =(ArrayList<String>)request.getAttribute("c_name_list");
						ArrayList<String> c_sums =(ArrayList<String>)request.getAttribute("c_review_sum_list");
						ArrayList<String> c_scores =(ArrayList<String>)request.getAttribute("c_score_list");
						ArrayList<String> c_links =(ArrayList<String>)request.getAttribute("c_link_list");
						for (int i=0;i<c_names.size();i++){%>
						<li class="card">
						<div class="card"">
							<h5 class="card-header"><%out.println(c_names.get(i));%></h5>
							  <div class="card-body">
							    <p class="card-title"><%out.println(c_sums.get(i));%></p>
							    <h5 class="card-text">Score:<%out.println(c_scores.get(i));%></h5>
							    <a href="<%out.println(c_links.get(i));%>" >Go to full review>></a>
							  </div>
						</div>
						</li>
						
						<%}%>
						</ul>
                    </div>
                    
                    
                    <div class="tab-pane fade" id="nav-user" role="tabpanel" aria-labelledby="nav-profile-tab">
                      <ul class="list-group list-group-flush">
						<%
						
						ArrayList<String> u_names =(ArrayList<String>)request.getAttribute("u_name_list");
						ArrayList<String> u_rev =(ArrayList<String>)request.getAttribute("u_review_list");
						ArrayList<String> u_scores =(ArrayList<String>)request.getAttribute("u_score_list");
						//ArrayList<String> u_likes =(ArrayList<String>)request.getAttribute("u_like_list");
						for (int i=0;i<u_names.size();i++){%>
						<li class="card">
						<div class="card"">
							<h5 class="card-header"><%out.println(u_names.get(i));%></h5>
							  <div class="card-body">
							    <p class="card-title"><%out.println(u_rev.get(i));%></p>
							    <h5 class="card-text">Score:<%out.println(u_scores.get(i));%></h5>
							    
							  </div>
						</div>
						</li>
						
						<%}%>
						</ul>
                    </div>
                    <div class="tab-pane fade" id="nav-info" role="tabpanel" aria-labelledby="nav-contact-tab">
                      	 <p ><%out.println(request.getAttribute("req"));%></p>
                    </div>
                    <div class="tab-pane fade" id="nav-trailer" role="tabpanel" aria-labelledby="nav-about-tab">
                      	 <iframe width="420" height="315"
							src="<%out.println(request.getAttribute("trlr"));%>"  frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen>>
						</iframe>
                    </div>
                  </div>
                
                </div>
              </div>
        </div>
	<%
	String id = (String) request.getParameter("user_id");
	out.println("Welcome User: "+id);
	%>

</body>
<%@include file="footer.html"%>
</html>