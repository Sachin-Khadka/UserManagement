package com.user.management.servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import com.user.management.dao.JDBCDBUtil;
import com.user.management.entities.User;
import com.user.management.entities.UserLog;


@WebServlet("/ViewStatusServlet")
public class ViewStatusServlet extends HttpServlet 
{
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		HttpSession httpSession = request.getSession();
		String id = request.getParameter("usrid").toString(); //things to be noticed. (toString())
		//String name = request.getParameter("username");
		//String status = request.getParameter("status");
		
		System.out.println("User ID: "+id);
		//System.out.println("User Name: "+name);
		//System.out.println("User Status: "+status);
		
	   //List<UserLog> userLog = JDBCDBUtil.getStatus(id,name,status);
	   List<UserLog> userLog = JDBCDBUtil.getStatus(id);
	   request.setAttribute("userLog", userLog);
	  // httpSession.setAttribute("userStatus",  userLog);
	   RequestDispatcher rd = request.getRequestDispatcher("Status.jsp");
	   rd.forward(request, response); 	
	   System.out.println("List:"+userLog);
	}	
}
