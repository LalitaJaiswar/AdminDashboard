<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"/>
	<link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@300;400&display=swap" rel="stylesheet">
	<link href="css/theme.css" type="text/css" rel="stylesheet">
	<link href="css/login.css" type="text/css" rel="stylesheet">
	<title>Administrator Login</title>
</head>
<body>
<div class="container-fluid">
		<div class="row">
			<div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 container justify-content-center">
			<div id="login-div">
				<% 
				if(request.getAttribute("msg")!=null){
					out.println("<h6 class='text-danger font-weight-bold'>"+request.getAttribute("msg")+"</h6>");
				}
				%>
			<form action="login_servlet" method="post">
				<table id="tbl-div">
				<tr><td><h5 class="text-dark"><b>Administrator Login</b></h5></td></tr>
				<tr><td>
				<input type="text" name="userid" class="txt" placeholder="Enter user name..." required/>
				</td></tr>
				<tr><td>
				<input type="password" name="pass" class="txt" placeholder="Enter user password..." required/>
				</td></tr>
				<tr><td>
				<input type="submit" value="Login" class="btn" id="btn-login"/>
				</td></tr>
				</table>
			</form>
			</div>
		</div>
	</div>
	
</div>
</body>
</html>