package com.user.management.servlets;

import com.user.management.dao.JDBCDBUtil;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;

import com.user.management.dao.UserDAO;
import com.user.management.dao.UserLogDAO;
import com.user.management.entities.User;
import com.user.management.entities.UserLog;
import com.user.management.helper.FactoryProvider;


public class LoginServlet extends HttpServlet 
{
	
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); //HTTP 1.1
	    response.setHeader("Pragma", "no-cache"); //HTTP 1.0
	    response.setDateHeader("Expires", 0); //prevents caching at the proxy server
		
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		java.util.Date now = new java.util.Date();
		String DATE_FORMAT = "yyyy-MM-dd hh:mm:ss";
		SimpleDateFormat sdf = new SimpleDateFormat(DATE_FORMAT);
		String startDate= sdf.format(now) ;
		
		//Validation
		   
		
		
		//Authenticating user
		
		UserDAO userDAO = new UserDAO(FactoryProvider.getFactory());
		User user = userDAO.getUserByEmailAndPassword(email, password);
       
		HttpSession httpSession = request.getSession();
		PrintWriter out = response.getWriter();

		if(user==null)
		{	
			httpSession.setAttribute("message", "Invalid Details!! Try with another one.");
			response.sendRedirect("Login.jsp");
			return;
		} 
		else if(user.getUserStatus().equals("block"))
		{
			httpSession.setAttribute("message", "You have been Blocked ! Consult with Administration.");
			response.sendRedirect("Register.jsp");
		}	
		else
		{
			httpSession.setAttribute("current-user", user);  
			
			if(user.getUserType().equals("admin"))
			{	
				response.sendRedirect("Admin.jsp");	
				UserDAO udao = new UserDAO(FactoryProvider.getFactory());
				List<User> list = udao.getAllUsers();
				int id = user.getUserId();
				String name =user.getUserName();
				System.out.println("Name: "+name);
				
			Session session = FactoryProvider.getFactory().openSession();
			UserLog s = new UserLog(name, id, startDate,"Still Logged In");
			session.beginTransaction();
			Integer i = (Integer)session.save(s);
			System.out.println("Login Times:"+ i);
			session.getTransaction().commit();
			session.close();
			
			httpSession.setAttribute("userid", id);
			httpSession.setAttribute("username",name);
		    httpSession.setAttribute("intime",startDate);
			}
			
			else if(user.getUserType().equals("normal"))
			{
				try
				{
					httpSession.setAttribute("current-user", user);    
					response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); //HTTP 1.1
				    response.setHeader("Pragma", "no-cache"); //HTTP 1.0
				    response.setDateHeader("Expires", 0); //prevents caching at the proxy server
				    
					List<User> userList= JDBCDBUtil.validate(email, password);	
					httpSession.setAttribute("userList", userList);
					System.out.println("UserList: "+userList);
				    response.sendRedirect("Normal.jsp");
				    
				    UserDAO udao = new UserDAO(FactoryProvider.getFactory());
					List<User> list = udao.getAllUsers();
					int id = user.getUserId();
					String name =user.getUserName();
					System.out.println("Name: "+name);
					
					Session session = FactoryProvider.getFactory().openSession();
					UserLog s = new UserLog(name, id, startDate,"Still Logged In");
					session.beginTransaction();
					Integer i = (Integer)session.save(s);
					System.out.println("Generated ID: "+ i);
					session.getTransaction().commit();
					session.close();
					
					httpSession.setAttribute("userid", id);
					httpSession.setAttribute("username",name);
				    httpSession.setAttribute("intime",startDate);
					
				}
				
				catch(Exception e)
				{
					e.printStackTrace();
				}
			}
			else
			{
				out.println("We have not identified user type !!");
			}
				
		}	
	}
}
