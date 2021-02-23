package com.tcs.dao;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tcs.dbutil.DBManager;

import java.time.*;

/**
 * Servlet implementation class logout_servlet
 */
@WebServlet("/logout_servlet")
public class logout_servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out=response.getWriter();
		HttpSession session=request.getSession();
		if(session.getAttribute("userid")==null) {
			out.println("<script type=\"text/javascript\">");
			out.println("alert('Your session has expired!')");
			out.println("location='login.jsp';");
			out.println("</script>");
			return;
		}
		LocalTime start=LocalTime.parse(session.getAttribute("start").toString());
		  LocalTime end=LocalTime.now();
		  session.invalidate();
		  long hours=Duration.between(start, end).toHours();
		  long minutes=Duration.between(start, end).toMinutes();
		  long seconds=Duration.between(start, end).toSeconds();
		  /* Code for storing spent hours in database */
			Connection cn=DBManager.getDBConnection();
			if(cn==null) {
				out.println("<script type=\"text/javascript\">");
				out.println("location='login.jsp';");
				out.println("</script>");
				return;
			}
			String cdate=LocalDate.now().toString();
			
			try {
				String query="update spent_hours set hours1=hours1+'"+hours+"',minutes1=minutes1+'"+minutes+"',seconds1=seconds1+'"+seconds+"' where date1='"+cdate+"'";
				Statement st=cn.createStatement();
				int row=st.executeUpdate(query);
				if(row==0){
					query="insert into spent_hours(date1,hours1,minutes1,seconds1) values('"+cdate+"','"+hours+"','"+minutes+"','"+seconds+"')";
					row=st.executeUpdate(query);
					cn.close();
					if(row==0) 
					{
						out.println("<script type=\"text/javascript\">");
						out.println("alert('Unable to update your spent duration for this page.');");
						out.println("location='login.jsp';");
						out.println("</script>");
					}
				}
			}
			catch(Exception e) {
				e.printStackTrace();
			}
		  /* updation is successful */
		  response.sendRedirect("login.jsp");
		
	}

}
