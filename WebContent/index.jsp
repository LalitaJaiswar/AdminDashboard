<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Administrator Home</title>
	<!-- other sources stylesheets and js -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"/>
	<link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@300;400&display=swap" rel="stylesheet">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/css/all.min.css" />
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	
	<!-- User defined stylesheets and js -->
	<link href="css/theme.css" type="text/css" rel="stylesheet">
	<link href="css/index.css" type="text/css" rel="stylesheet">
	<script src="js/index.js" type="text/javascript"></script>
</head>
<body>
	<!-- Check for session starts -->
	<% 
	if(session.getAttribute("userid")==null){
		request.setAttribute("msg", "Please Login first!");
		request.getRequestDispatcher("login.jsp").forward(request, response);}	
	%>
	<!--  Check for session ends -->
	<div class="">
		<!--left side navigation bar starts-->
		<section class="sidebar">
			<div class="profile">
			<img src="images/user.jpg"/> 
				&nbsp;<a href="logout_servlet" class="text-light font-weight-bold">
					Log Out
				</a>
			</div>
			<hr/>
			<div class="menu-bar">
				<a class="menu-p" href="#">Dashboard</a>
				<a class="menu-p"  href="received_ticket.jsp">Received Tickets</a>
				<a class="menu-p"  href="completed_ticket.jsp">Completed Tickets</a>
				<a class="menu-p"  href="closed_ticket.jsp">Closed Tickets</a>
				<a class="menu-p"  href="lapsed_ticket.jsp">Lapsed Tickets</a>
				<a class="menu-p"  href="breached_sla.jsp">Breached SLA</a>
				<a class="menu-p"  href="spent_hours.jsp">Hours Spent</a>
			</div>
		</section>
		<!--left side navigation bar ends-->
		<!--main right side content starts-->
		<div class="container-fluid main">
			<div class="row text-center">
				<div class="col-lg-12 pt-3">
					<a href="#" id="menu-btn" onclick="calltomenu()"><i class="fas fa-bars menu"></i></a>
					<h3 class="text-dark">
					<b>Administrator Dashboard</b>
					</h3>
					<div class="dotted-border"></div>
				</div>
			</div>
			
			<!-- Dashbaord Section starts -->
			<div class="dashboard">
				<div class="row text-center">
					<div class="col-lg-4 col-md-12 py-4">
						<div class="dashboard-div">
							<a href="received_ticket.jsp" class="dashboard-a-link">
								Received Ticket<br/>
								<span class="dashboard-icon">
								<i class="fas fa-box-open"></i>
								</span>
							</a>
						</div>
					</div>
					<div class="col-lg-4 col-md-12 py-4">
						<div class="dashboard-div">
							<a href="completed_ticket.jsp" class="dashboard-a-link">
								Completed Ticket<br/>
								<span class="dashboard-icon">
								<i class="fas fa-check-circle"></i>
								</span>
							</a>
						</div>
					</div>
					<div class="col-lg-4 col-md-12 py-4">
						<div class="dashboard-div">
							<a href="closed_ticket.jsp" class="dashboard-a-link">
								Closed Tickets<br/>
								<span class="dashboard-icon">
								<i class="fas fa-archive"></i>
								</span>
							</a>
						</div>
					</div>
				</div>
				
				<div class="row text-center">
					<div class="col-lg-4 col-md-12 py-4">
						<div class="dashboard-div">
							<a href="lapsed_ticket.jsp" class="dashboard-a-link">
								Lapsed Tickets<br/>
								<span class="dashboard-icon">
								<i class="fas fa-envelope"></i></span>
							</a>
						</div>
					</div>
					<div class="col-lg-4 col-md-12 py-4">
						<div class="dashboard-div">
							<a href="breached_sla.jsp" class="dashboard-a-link">
								Breached SLA<br/>
								<span class="dashboard-icon">
								<i class="fas fa-times-circle"></i>
								</span>
							</a>
						</div>
					</div>
					<div class="col-lg-4 col-md-12 py-4">
						<div class="dashboard-div">
							<a href="spent_hours.jsp" class="dashboard-a-link">
								Hours Spent<br/>
								<span class="dashboard-icon">
								<i class="fas fa-clock"></i>
								</span>
							</a>
						</div>
					</div>
				</div>
			</div>
			<!-- Dashbaord Section ends -->
			
		</div>
		<!--main right side content starts-->
	</div>
</body>
</html>