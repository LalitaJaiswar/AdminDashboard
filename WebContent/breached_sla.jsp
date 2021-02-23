<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.time.Period"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>

<%@page import="com.tcs.dbutil.DBManager"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>SLA</title>
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
		<h4 class="text-center mt-3 text-dark">
			<b>Details on Breached SLA(Service Level Agreement)</b>
		</h4>
		<div class="dotted-border" style="width:40%"></div>
		<p class="text-success font-weight-bold ml-4">Attention Please!</p>
		<p class="ml-4">The Service Level Agreement(SLA) is defined as:<br/>
			&nbsp; 1. If a ticket is raised then it should be resolved within the duration of three days.<br/>
			&nbsp; 2. If a ticket is not resolved within 3 days then it will be considered as breaching of SLA.<br/>
			The following tickets are either lapsed or solved after three days.
		</p>
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
				String query="select * from raised_ticket  order by STR_TO_DATE(raising_date, '%Y/%m/%d') desc ,ename asc";
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
					<th>Delayed By</th>
					</tr>
					<% 
					//Used for showing status
					Map<Integer,String> status=new HashMap<Integer,String>();
							status.put(0,"Pending");
							status.put(1,"Solved");
							status.put(2,"Closed");
							status.put(3,"Lapsed");
					int count=0;
					/* Data fetch starts */
					while(rs.next())
					{
						LocalDate raising=LocalDate.parse(rs.getString("raising_date"));
						LocalDate resolution=LocalDate.parse(rs.getString("resolution_date"));
						int days=Period.between(raising, resolution).getDays();
						if(days>3){
						%>
						<tr>
						<td> <%=rs.getString("ticket_id") %></td>
						<td> <%=rs.getInt("eid") %> </td>
						<td> <%=rs.getString("ename") %> </td>
						<td> <%=rs.getString("ticketcategory") %> </td>
						<td> <%=rs.getString("description") %> </td>
						<td> <%=rs.getInt("ticket_priority") %> </td>
						<td> <%=status.get(rs.getInt("status")) %> </td>
						<td> <%=rs.getString("raising_date") %> </td>
						<td> <%=rs.getString("resolution_date") %> </td>
						<td><%= days-3 %> Days</td>
						</tr>
						<%
						count++;
						}
					}
					/* Data fetch ends */
					if(count==0){
						out.println("Hurray. You are following all the rules of SLA.");
					}
				}
				else{
					
					out.println("Hurray. No ticket is lapsed!");
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
		<!-- Dynamic content ends -->
	</div>
</body>
</html>