package com.tcs.dao;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Statement;
import java.time.LocalDate;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tcs.dbutil.DBManager;

/**
 * Servlet implementation class received_servlet
 */
@WebServlet("/received_servlet")
public class received_servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out=response.getWriter();
		Connection cn=DBManager.getDBConnection();
		if(cn==null) {
			out.println("<script type=\"text/javascript\">");
			out.println("alert('Unable to establish a connection with database');");
			out.println("location='received_ticket.jsp';");
			out.println("</script>");
			return;
		}
		try {
			int status=1;
			String ld=LocalDate.now().toString();
			String query="update raised_ticket set status='"+status+"',solution='"+request.getParameter("solution")+"',resolution_date='"+ld+"' where ticket_id='"+request.getParameter("tid_hidden")+"'";
			Statement st=cn.createStatement();
			int row=st.executeUpdate(query);
			cn.close();
			if(row>0) {
				out.println("<script type=\"text/javascript\">");
				out.println("alert('Soultion added successfully!');");
				out.println("location='received_ticket.jsp';");
				out.println("</script>");
			}
			else {
				out.println("<script type=\"text/javascript\">");
				out.println("alert('Database Error. Please try after some time');");
				out.println("location='received_ticket.jsp';");
				out.println("</script>");
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}

}
