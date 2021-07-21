package com.user.management.servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.user.management.helper.DBConnect;

public class LogoutServlet extends HttpServlet 
{
	private static Connection conn = null;
	private static Statement stmt = null;

	java.util.Date now = new java.util.Date();
	String DATE_FORMAT = "yyyy-MM-dd hh:mm:ss";
	SimpleDateFormat sdf = new SimpleDateFormat(DATE_FORMAT);
	String startDate = sdf.format(now);
	
	
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		HttpSession httpSession = request.getSession();
		String name = httpSession.getAttribute("username").toString();
		try
		{
			conn = DBConnect.getConnection();
			stmt = conn.createStatement();
			 
			String queryString  = "update userlog set LogoutTime='"+startDate+"'"
					+ "where fullname='"+name+"'";
			
		   int rs = stmt.executeUpdate(queryString);    
		    if(rs>0)
		 	{
		     System.out.println("Bro Not Login"); 
		 	}
		 	conn.close();
		}
		
		catch(Exception e)
		{
			System.out.println("Exception: "+e);
		}
		
		
		httpSession.removeAttribute("current-user");
		response.sendRedirect("Login.jsp");
		
	}

}
