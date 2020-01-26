<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%@include  file="navbar.jsp" %>
<title>MetaGame</title>
<link href = "bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css" >
</head>
<body>
	<h1>Games</h1>
	<div class="container padding-top-10">
		<div class="container padding-top-10">
		<div class="panel panel-default">
			
			
			<div class="panel-body">
			<table  class="table table-striped table-dark">
				<tr>
					<th>Image</th>
					<th>Name</th>
					<th>Genre</th>
				</tr>
				<%
				String table = (String) request.getParameter("table_data");
				out.println(table);
				%>
			</table>
			</div>
		
		</div>
	</div>
	</div>
	
</body>
<%@include  file="footer.html" %>
</html>