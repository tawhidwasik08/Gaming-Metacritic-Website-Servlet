<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>MetaGame</title>
<link href = "bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css" >
</head>
<body>
	<div class="container padding-top-10">
		<div class="panel panel-default">
			<div class="panel-body">
				<form action="login" method="post">
					<label for="name" class="control-label">Name:</label>
					<div class="row">
						<div class="col-md-12">
							<input type ="text" class="form-control" name="name" placeholder="Name" />
						</div>		 		
					</div>

					<label for="password" class="control-label">Password:</label>
					<div class="row">
						<div class="col-md-12">
							<input type ="text" class="form-control" name="pass" placeholder="*****" />
						</div>		 		
					</div>

					<div class="row">
						<div class="col-md-2">
							<input id="signinbtn"type ="submit" class="btn btn-success" value="Login" name="submit"/>
						</div>		 		
					</div>


				</form>
			</div>
		
		</div>
	</div>
	
</body>
</html>