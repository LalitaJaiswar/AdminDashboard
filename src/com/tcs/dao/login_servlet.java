package com.tcs.dao;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.time.*;

import com.tcs.dbutil.*;

/**
 * Servlet implementation class login_servlet
 */
@WebServlet("/login_servlet")
public class login_servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out=response.getWriter();
		try {
			Connection cn=DBManager.getDBConnection();
			if(cn==null) {
				out.println("<script type=\"text/javascript\">");
				out.println("alert('Unable to establish a connection with database');");
				out.println("location='login.jsp';");
				out.println("</script>");
				return;
			}
			Statement st=cn.createStatement();
			ResultSet rs=null;
			String userid=request.getParameter("userid");
			String upass=request.getParameter("pass");
			String query="Select userid,pass from tbl_login where userid='"+userid+"'";
			rs=st.executeQuery(query);
			rs.next();
			if(rs.getRow()>0) {
				if(rs.getString(2).equals(upass)) {
					HttpSession session=request.getSession();
					LocalTime lt=LocalTime.now();
					session.setMaxInactiveInterval(600);
					session.setAttribute("userid",userid);
					session.setAttribute("start", lt);
					response.sendRedirect(request.getContextPath() + "/index.jsp");				}
				else {
					out.println("<script type=\"text/javascript\">");
					out.println("alert('Passowrd is incorrect!');");
					out.println("location='login.jsp';");
					out.println("</script>");
				}
				cn.close();
			}
			else {
				out.println("<script type=\"text/javascript\">");
				out.println("alert('User does not exist!');");
				out.println("location='login.jsp';");
				out.println("</script>");	
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}

}
