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

/**
 * Servlet implementation class ResetPasswordServlet
 */
@WebServlet("/ResetPasswordServlet")
public class ResetPasswordServlet extends HttpServlet 
{
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		String mail = request.getParameter("email");
		String pass = request.getParameter("password");
		String cpass = request.getParameter("re_password");
         boolean isTrue;
		
		isTrue = JDBCDBUtil.ResetPassword(mail, pass, cpass);
		
		if(isTrue == true)
		{
         System.out.println("Mail: "+mail);
         System.out.println("Password: "+pass);
         System.out.println("Re-Password: "+cpass);
		HttpSession httpSession = request.getSession();	  
		RequestDispatcher dis = request.getRequestDispatcher("Login.jsp");
		dis.forward(request, response);
		
        httpSession.setAttribute("message", "Reset Password Successful !!"+ mail);
		}
		else
		{
			HttpSession httpSession = request.getSession();
			httpSession.setAttribute("message", "Reset Password Successful !!"+ mail);
			RequestDispatcher diss = request.getRequestDispatcher("Login.jsp");
			diss.forward(request, response);
		}
	}
		
	}

