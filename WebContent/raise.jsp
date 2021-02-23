<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>

	<meta charset="ISO-8859-1">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Raise Ticket</title>
	<!-- other sources stylesheets and js -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"/>
	<link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@300;400&display=swap" rel="stylesheet">
	<script src="https://kit.fontawesome.com/a076d05399.js"></script>
	
	<!-- User defined stylesheets and js -->
	<link href="css/theme.css" type="text/css" rel="stylesheet">
	<link href="css/login.css" type="text/css" rel="stylesheet">
</head>
<body>
<div class="container-fluid">
		<div class="row">
			<div class="col-lg-6 col-md-7 col-sm-9 col-xs-11 container justify-content-center">
				<div id="outer">
						<form action="raise_servlet" method="post">
							<table id="tbl-div">
								<tr><td><h5 class="text-dark"><b>Raise Ticket</b></h5></td></tr>
								<tr>
									<td>Enter your Employee ID:</td>
									<td>
									<input type="number" name="eid" class="txt" required/>
									</td>
								</tr>
								<tr>
									<td>Enter your Name:</td>
									<td><input type="text" name="ename" class="txt" required/></td>
								</tr>
								<tr>
									<td>Select Ticket Category:</td>
									<td>
										<select class="txt" name="ticketCategory" required>
											<option value="">--Select--</option>
											<option value="Office">Office</option>
											<option value="Hardware">Hardware</option>
											<option value="Software">Software</option>
											<option value="HR">HR</option>
											<option value="Ultimatix">Ultimatix</option>
											<option value="Ievolve">Ievolve</option>
											<option value="Knome">Knome</option>
											<option value="FrescoPlay">FrescoPlay</option>
											<option value="HIS">HIS</option>
											<option value="Udemy">Udemy</option>
											<option value="LinkedIn">LinkedIn</option>
										</select>
									</td>
								</tr>
								<tr>
									<td>Description of the issue:</td>
									<td>
									<textarea rows="5" cols="10" class="txtDescription" name="description" required></textarea>
									</td>
								</tr>
								<tr>
									<td>
									<input type="reset" value="Reset Entries" class="btn"/>
									</td>
									<td>
									<input type="submit" value="Raise Ticket" class="btn"/>
									</td>
								</tr>
							</table>
						</form>
				</div>
	</div>
	</div>
	</div>
</body>
</html>