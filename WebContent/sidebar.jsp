<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Sidebar</title>
	<!-- External sources stylesheet and js -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"/>
	<link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@300;400&display=swap" rel="stylesheet">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/css/all.min.css" />
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	
	
	<!-- User defined stylesheets and js -->
	<link href="css/theme.css" type="text/css" rel="stylesheet">
	<link href="css/sidebar.css" type="text/css" rel="stylesheet">
	<script src="js/sidebar.js" type="text/javascript"></script>
	
</head>
<body>
<section class="sidebar">
			<div class="profile">
			<img src="images/user.jpg"/> 
				&nbsp;<a href="logout_servlet" class="text-light font-weight-bold">
					Log Out
				</a>
			</div>
			<hr/>
			<div class="menu-bar">
				<a class="menu-p"  href="index.jsp">Dashboard</a>
				<a class="menu-p"  href="received_ticket.jsp">Received Tickets</a>
				<a class="menu-p"  href="completed_ticket.jsp">Completed Tickets</a>
				<a class="menu-p"  href="closed_ticket.jsp">Closed Tickets</a>
				<a class="menu-p"  href="lapsed_ticket.jsp">Lapsed Tickets</a>
				<a class="menu-p"  href="breached_sla.jsp">Breached SLA</a>
				<a class="menu-p"  href="spent_hours.jsp">Hours Spent</a>
			</div>
		</section>
		<a href="#" id="menu-btn" onclick="calltomenu()"><i class="fas fa-bars menu"></i></a>
		
</body>
</html>