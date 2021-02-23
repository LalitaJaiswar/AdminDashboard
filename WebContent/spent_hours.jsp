<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.time.format.DateTimeFormatter"%>

<%@page import="com.tcs.dbutil.DBManager"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Spent Hours</title>
	<link href="css/tbl_page_common.css" rel="stylesheet" type="text/css">
</head>
<body>
	<!-- Check for session starts -->
	<% 
	if(session.getAttribute("userid")==null){
		request.setAttribute("msg", "Please Login first!");
		request.getRequestDispatcher("login.jsp").forward(request, response);}	
	%>
	<!--  Check for session ends -->
	<%@ include file="sidebar.jsp" %> <!-- Used for common sidebar -->
	<div class="container-fluid main">
		<h4 class="text-center text-dark">
			<b>Total Spent Hours</b>
		</h4>
		<div class="dotted-border"></div>
		<!-- Dynamic content starts -->
		<div class="row">
		<div class="col-lg-12 col-sm-12 col-xs-12">
		<%
		Connection cn = null;
		Statement st = null;
		ResultSet rs = null;
		try{
			cn=DBManager.getDBConnection();
			if(cn==null) {%>
				<h2 class="text-danger">Failed to established a database connection :(</h2>
			<%}
			else{
				st=cn.createStatement();
				String query="select * from spent_hours";
				rs=st.executeQuery(query);
				if(rs.isBeforeFirst()){ %>
				<!-- Initializing a table -->
				<div class="tbl-outer">
				<table class="ticket-tbl">
					<tr>
					<th>Date</th>
					<th>Total Time(in hours)</th>
					<th>Total Time(in minutes)</th>
					<th>Total Time(in seconds)</th>
					</tr>
					<!-- Data fetching starts -->
					<% 
					while(rs.next())
					{
						LocalDate date1 = LocalDate.parse(rs.getString("date1"));
						DateTimeFormatter dtf = DateTimeFormatter.ofPattern("dd MMM uuuu");						
						float sec=rs.getInt("seconds1");
						float min=sec/60;
						float hour=min/60;
						%>
						<tr>
						<td> <%= dtf.format(date1) %></td>
						<td> <%= hour %> </td>
						<td> <%= min %> </td>
						<td> <%= sec %> </td>
						</tr>
						<%
					}
					/* Data fetching ends */
				}
				else{
					
					out.println("Oops. You are visiting this for thr first time.");
				}
				cn.close();	
			}
		}
		catch(Exception e){
			e.printStackTrace();
		}
		%>
		
				</table>
				</div>
			</div>
		</div>
		<!-- Dynamic content starts -->
	</div>
</body>
</html>