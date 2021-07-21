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


@WebServlet("/DeleteServlet")
public class DeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		String id = request.getParameter("usrid");
		boolean isTrue;
		
		isTrue = JDBCDBUtil.deleteUser(id);
		
		if(isTrue == true)
		{
			HttpSession httpSession = request.getSession();
            httpSession.setAttribute("message", "Delete or Update Page is Landing !!" +"User ID: "+ id);
            
			RequestDispatcher dispatcher = request.getRequestDispatcher("Register.jsp");
			dispatcher.forward(request, response);
		}
		
		else
		{
			List<User> userList = JDBCDBUtil.getUserDetails(id);
			request.setAttribute("userList", userList);
			
			HttpSession httpSession = request.getSession();
	        httpSession.setAttribute("message", "Delete or Update Page is Landing !!" +"User ID: "+ id);
	        
			RequestDispatcher dispatcher = request.getRequestDispatcher("Normal.jsp");
			dispatcher.forward(request, response);
		}
	}

}
