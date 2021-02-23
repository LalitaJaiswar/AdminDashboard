<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.tcs.dbutil.DBManager"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Completed Ticket</title>
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
	<%@ include file="sidebar.jsp" %>
	<div class="container-fluid main">
		<h4 class="text-center text-dark">
			<b>Total Completed Tickets</b>
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
				String query="select * from raised_ticket where status=1  order by STR_TO_DATE(raising_date, '%Y/%m/%d') desc,ename asc";
				rs=st.executeQuery(query);
				if(rs.isBeforeFirst()){ 
				
				%>
				<!-- Initializing a table -->
				<div class="tbl-outer">
				<table class="ticket-tbl">
					<tr>
					<th>Ticket ID</th>
					<th>Employee ID</th>
					<th>Employee Name</th>
					<th>Ticket Category</th>
					<th>Description</th>
					<th>Priority</th>
					<th>Status</th>
					<th>Raising Date</th>
					<th>Resolution Date</th>
					<th>Action</th>
					</tr>
					<!-- Data fetching starts -->
					<% 
					while(rs.next())
					{
						%>
						<tr>
						<td> <%=rs.getString("ticket_id") %></td>
						<td> <%=rs.getInt("eid") %> </td>
						<td> <%=rs.getString("ename") %> </td>
						<td> <%=rs.getString("ticketcategory") %> </td>
						<td> <%=rs.getString("description") %> </td>
						<td> <%=rs.getInt("ticket_priority") %> </td>
						<td> Solved </td>
						<td> <%=rs.getString("raising_date") %> </td>
						<td> <%=rs.getString("resolution_date") %> </td>
						<td>
						<form action="completed_servlet" method="post">
						<input type="hidden" name="tid_hidden" value="<%=rs.getString("ticket_id") %>"/>
						<input type="submit" class="btn" value="Close"/>
						</form></td>
						</tr>
						<%
					}
					/* Data fetching ends */
				}
				else{
					out.println("Oops!. You have not resolved any ticket till now.");
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
	</div>
</body>
</html>