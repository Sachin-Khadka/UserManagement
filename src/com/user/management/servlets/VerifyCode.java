package com.user.management.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.user.management.entities.UserVerify;

/**
 * Servlet implementation class VerifyCode
 */
@WebServlet("/VerifyCode")
public class VerifyCode extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
	  HttpSession session = request.getSession();
		PrintWriter out = response.getWriter();
	  
	  
	  UserVerify  uv = (UserVerify)session.getAttribute("authcode");
	  String code = request.getParameter("authcode");
	  
	  if(code.equals(uv.getCode()))
	   {
		   session.setAttribute("message", "Now, You can Reset your our Password !!");
		   response.sendRedirect("ForgetPassword.jsp");
	   }  
	  else
	  {
		  session.setAttribute("message", "Verification Error !!");
		  response.sendRedirect("Login.jsp");
		  System.out.println("Verification Error");
	  }
	}

}
