package com.user.management.servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.user.management.dao.JDBCDBUtil;
import com.user.management.entities.User;
import com.user.management.helper.DBConnect;
import com.user.management.helper.FormattedDateProvider;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;


@WebServlet("/UnBlockServlet")
public class UnBlockServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		
		Connection conn = null;
		Statement stmt = null;
		String id = request.getParameter("usrid");
		String name = request.getParameter("username");
		String email = request.getParameter("email");
		String password = request.getParameter("pass");
		String cpassword = request.getParameter("cpass");
		String phone = request.getParameter("phone");
		String address = request.getParameter("address");
		String status = request.getParameter("status");
		boolean isTrue;
		
		isTrue = JDBCDBUtil.unBlockUser(id, name, status);
		
		if(isTrue == true)
		{
		List<User> unblockList = JDBCDBUtil.getUserDetails(id);
		HttpSession httpSession = request.getSession();
		httpSession.setAttribute("unblockList", unblockList);
		
		try
		{
			conn = DBConnect.getConnection();
			stmt = conn.createStatement();
			 
			String userStatus = "active";
			FormattedDateProvider fdp = new FormattedDateProvider();
			String activateTime = fdp.getCurentDate();
			String ID = httpSession.getAttribute("ID").toString();
			int convertedID = Integer.parseInt(ID);
			//String queryString  = "update userStatus set userStatus='"+userStatus+"'"
				//	+ "where fullname='"+name+"'";
			
			String sql = "update UserStatus set userstatus='"+userStatus+"',activeTime='"+activateTime+"'"
					+ "where userID='"+ convertedID+"'";
			
		   int rs = stmt.executeUpdate(sql);    
		    if(rs>0)
		 	{
		     System.out.println("You have been activated !!"); 
		 	}
		 	conn.close();
		}
		
		catch(Exception e)
		{
			System.out.println("Exception: "+e);
		}
		
			  
		RequestDispatcher dis = request.getRequestDispatcher("Admin.jsp");
		dis.forward(request, response);
        httpSession.setAttribute("message", " User Active "+ name);
		}
		else
		{
			
			HttpSession httpSession = request.getSession();
	      
			List<User> getUserList = JDBCDBUtil.getUserDetails(id);
			//request.getAttribute("userList");
			httpSession.setAttribute("Block", getUserList);
			
			RequestDispatcher dis = request.getRequestDispatcher("Admin.jsp");
			dis.forward(request, response);
	        httpSession.setAttribute("message", " User Active "+ name);
		}
	}
}
