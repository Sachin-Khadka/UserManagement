package com.user.management.servlets;

import com.user.management.dao.UserDAO;
import com.user.management.entities.RegisterAdd;
import com.user.management.entities.User;
import com.user.management.entities.UserLog;
import com.user.management.helper.FactoryProvider;
import com.user.management.helper.FormattedDateProvider;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.Transaction;

//@WebServlet(name = "RegisterServlet", urlPatterns = {"/RegisterServlet"})

public class RegisterServlet extends HttpServlet {
	User user = new User();

	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html;charset=UTF-8");
		try (PrintWriter out = response.getWriter()) {
			try {
				String userName = request.getParameter("user_name");
				String userEmail = request.getParameter("user_email");
				String userPassword = request.getParameter("user_password");
				String userConformPassword = request.getParameter("user_cpassword");
				String userPhone = request.getParameter("user_phone");
				String userAddress = request.getParameter("user_address");

				HttpSession httpSession = request.getSession();

				// Validation
				if (userName.isEmpty()) {
					out.println("<h1 style ='color:red'> Name is Blank </h1>");
					System.out.println("Name is Empty!!");
					httpSession.setAttribute("message", "Name is Empty !!");
					response.sendRedirect("Register.jsp");
					return;
				}

				else if (user.checkName(userName) == true) {
					System.out.println("Name Alreadty Exists");
					out.println("Name Alreadty Exists, Try with Another One.");
					httpSession.setAttribute("message", "Name is Already Exits !!");
					response.sendRedirect("Register.jsp");
				} else {
					if (userPassword.equals(userConformPassword)) {

						user = new User(userName, userEmail, userPassword, userConformPassword, userPhone,
								"default.jpg", userAddress, "normal", "active");
						Session hibernateSession = FactoryProvider.getFactory().openSession();
						Transaction tx = hibernateSession.beginTransaction();
						int userId = (int) hibernateSession.save(user);
						tx.commit();
						hibernateSession.close();

						// for adding registration date
						FormattedDateProvider fdp = new FormattedDateProvider();
						 String registrationDate = fdp.getCurentDate();
					
						
						Session session = FactoryProvider.getFactory().openSession();
						RegisterAdd regadd= new RegisterAdd(userName, registrationDate, "future", "register");
						session.beginTransaction();
						Integer i = (Integer) session.save(regadd);
						System.out.println("User ID:" + i);
						session.getTransaction().commit();
						session.close();
						
						httpSession.setAttribute("username", userName);
						httpSession.setAttribute("intime", registrationDate);
						
						if (user.checkName(request.getParameter("user_name")) == true) {
							httpSession.setAttribute("message", "Name is already Exist !!");
						}

						httpSession.setAttribute("message", "Registration Successful !!" + "User ID: " + userId);
						response.sendRedirect("Register.jsp");
						return;
					} else {
						System.out.println("Password and Confirm Password not match!!");
						out.println("Password and Confirm Password is not matching, Try Again.");
						httpSession.setAttribute("message", "Password mismatch !!");
						response.sendRedirect("Register.jsp");
					}
				}
			}

			catch (Exception e) {
				e.printStackTrace();
			}

		}
	}

}
