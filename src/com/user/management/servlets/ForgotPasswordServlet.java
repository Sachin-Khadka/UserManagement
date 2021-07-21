package com.user.management.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.user.management.entities.SendEmail;
import com.user.management.entities.UserVerify;


@WebServlet("/ForgotPasswordServlet")
public class ForgotPasswordServlet extends HttpServlet 
{
	  private static final long serialVersionUID = 1L;
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		
		String name = request.getParameter("username");
		String email = request.getParameter("usermail");
	
		SendEmail sm = new SendEmail();
		String code = sm.getRandom();

		UserVerify uv = new UserVerify(name, email, code);
		
		boolean test = sm.sendEmail(uv);
		
		if(test)
		{
			HttpSession session = request.getSession();
			session.setAttribute("authcode", uv);
			response.sendRedirect("verify.jsp");
		}
		
		
	}
	
	

}
