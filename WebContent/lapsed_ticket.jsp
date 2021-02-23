<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.time.Period"%>
<%@page import="com.tcs.dbutil.DBManager"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Lapsed Tickets</title>
	<link href="css/tbl_page_common.css" rel="stylesheet" type="text/css">
	<script src="js/received_ticket.js" type="text/javascript"></script>
</head>
<body>
	<%@ include file="sidebar.jsp" %>
	<div class="container-fluid main">
		<h4 class="text-center text-dark">
			<b>Total Lapsed Tickets</b>
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
				String query="select * from raised_ticket where status=0  order by STR_TO_DATE(raising_date, '%Y/%m/%d') desc ,ename asc";
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
					<!-- data fetch starts -->
					<% 
					int count=0;
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
						<td>Lapsed</td>
						<td> <%=rs.getString("raising_date") %> </td>
						<td> <%=rs.getString("resolution_date") %> </td>
						<td>
						<form>
						<p onclick="open_editor('<%=rs.getString("ticket_id") %>')" class="btn">Solve</p>
						</form></td>
						</tr>
						<%
						count++;
						}
					}
					if(count==0){
						out.println("Hurray. No ticket is lapsed!");
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
		<!-- data fetch ends -->
		
				</table>
				</div>
			</div>
		</div>
		<!-- Dynamic content ends -->
		
		<!-- Absolute div starts -->
		<div class="editor">
			<form action="lapsed_servlet" method="post">
				<p class="text-right text-success font-weight-bold" style="cursor: pointer" onclick="$('.editor').hide();">Close</p>
				Ticket ID: <label id="lbl_tid"></label>
				<input type="hidden" name="tid_hidden" id="input_tid"/>
				<br/>
				<textarea class="txtDescription" rows="5" name="solution" required placeholder="Please write your suggestions here..."></textarea>
				<input type="submit" value="Add Solution" class="btn" />
			</form>
		</div>
		<!-- Absolute div ends -->
	</div>
</body>
</html>