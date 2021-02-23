package com.tcs.dao;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Statement;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tcs.dbutil.DBManager;

/**
 * Servlet implementation class raise_servlet
 */
@WebServlet("/raise_servlet")
public class raise_servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out=response.getWriter();
		Connection cn=DBManager.getDBConnection();
		if(cn==null) {
			out.println("<script type=\"text/javascript\">");
			out.println("alert('Unable to establish a connection with database');");
			out.println("location='raise.jsp';");
			out.println("</script>");
			return;
		}
		/* Used for deciding the priority of Ticket */
		Map<String,Integer> priority=new HashMap<String,Integer>();
		priority.put("Office", 1);
		priority.put("Hardware", 2);
		priority.put("Software", 3);
		priority.put("HR", 4);
		priority.put("Ultimatix", 5);
		priority.put("Ievolve", 6);
		priority.put("Knome", 6);
		priority.put("FrescoPlay", 6);
		priority.put("HIS", 7);
		priority.put("Udemy", 8);
		priority.put("LinkedIn", 8);
		LocalDate ld=LocalDate.now();
		String time1=LocalTime.now().toString();
		String lt=request.getParameter("eid").toString()+ld.toString()+time1.substring(0, time1.lastIndexOf('.'));
		lt=lt.replaceAll("[^\\d]", " "); 
		lt=lt.replaceAll("\\s", "");
		try {
			String query="insert into raised_ticket(ticket_id,eid,ename,ticketcategory,description,status,ticket_priority,raising_date,resolution_date) values('"+lt+"','"+request.getParameter("eid")+"','"+request.getParameter("ename")+"','"+request.getParameter("ticketCategory")+"','"+request.getParameter("description")+"',0,'"+priority.get(request.getParameter("ticketCategory"))+"','"+ld.toString()+"','"+ld.plusDays(3).toString()+"')";
			Statement st=cn.createStatement();
			int row=st.executeUpdate(query);
			cn.close();
			if(row>0) {
				out.println("<script type=\"text/javascript\">");
				out.println("alert('Ticket raised successfully. Your ticket id is:"+lt+"\\nOur spport team will contact you soon!');");
				out.println("location='raise.jsp';");
				out.println("</script>");			}
			else {
				out.println("<script type=\"text/javascript\">");
				out.println("alert('Database Error. Please try after some time.');");
				out.println("location='raise.jsp';");
				out.println("</script>");	
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}

}
