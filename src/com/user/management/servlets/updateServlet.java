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

@WebServlet("/UpdateCustomerServlet")
public class updateServlet extends HttpServlet 
{
	private static final long serialVersionUID = 1L;


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		String id = request.getParameter("usrid");
		String name = request.getParameter("username");
		String email = request.getParameter("email");
		String password = request.getParameter("pass");
		String cpassword = request.getParameter("cpass");
		String phone = request.getParameter("phone");
		String address = request.getParameter("address");
		boolean isTrue;
		
		isTrue = JDBCDBUtil.upateUser(id, name, email, password,cpassword, phone, address);
		
		if(isTrue == true)
		{
		List<User> getUserList = JDBCDBUtil.getUserDetails(id);
		System.out.println("Get User:" +getUserList);
		HttpSession httpSession = request.getSession();
		request.getAttribute("userList");
		request.setAttribute("userList", getUserList);
		httpSession.setAttribute("getUserList", getUserList);
			  
		RequestDispatcher dis = request.getRequestDispatcher("Normal.jsp");
		dis.forward(request, response);
		
        httpSession.setAttribute("message", "Delete or Update Page is Landing !!" +"User Name: "+ name);
		}
		else
		{
			HttpSession httpSession = request.getSession();
	        httpSession.setAttribute("message", "Delete or Update Page is Landing !!" +"User Name: "+ name);
	        
			List<User> getUserList = JDBCDBUtil.getUserDetails(id);
			request.getAttribute("userList");
			httpSession.setAttribute("getUserList", getUserList);
			
			RequestDispatcher diss = request.getRequestDispatcher("Normal.jsp");
			diss.forward(request, response);
		}
	}

}
