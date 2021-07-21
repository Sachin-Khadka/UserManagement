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

import org.hibernate.Session;

import com.user.management.dao.JDBCDBUtil;
import com.user.management.entities.RegisterAdd;
import com.user.management.entities.User;
import com.user.management.entities.UserStatus;
import com.user.management.helper.FactoryProvider;
import com.user.management.helper.FormattedDateProvider;

@WebServlet("/BlockServlet")
public class BlockServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		String id = request.getParameter("usrid");
		String name = request.getParameter("username");
		String email = request.getParameter("email");
		String password = request.getParameter("pass");
		String cpassword = request.getParameter("cpass");
		String phone = request.getParameter("phone");
		String address = request.getParameter("address");
		String status = request.getParameter("status");
		boolean isTrue;
		
		isTrue = JDBCDBUtil.BlockUser(id, name, status);
		
		if(isTrue == true)
		{
		List<User> blockList = JDBCDBUtil.getUserDetails(id);
		HttpSession httpSession = request.getSession();
		httpSession.setAttribute("blockList", blockList);
		
		
		String userStatus = "block";
		FormattedDateProvider fdp = new FormattedDateProvider();
		String blockDate = fdp.getCurentDate();
		
		RegisterAdd rd = new RegisterAdd();
		//String activeDate = rd.getJoinDate();
		int convertedID = Integer.parseInt(id);
		Session session = FactoryProvider.getFactory().openSession();
		UserStatus ustatus = new UserStatus(convertedID, name,userStatus, "still blocked", blockDate);
		session.beginTransaction();
		Integer i = (Integer) session.save(ustatus);
		System.out.println("User ID:" + i);
		session.getTransaction().commit();
		session.close();
		
		httpSession.setAttribute("userName", name);
		httpSession.setAttribute("ID", id);
			  
		RequestDispatcher dis = request.getRequestDispatcher("Admin.jsp");
		dis.forward(request, response);
        httpSession.setAttribute("message", " User Blocked "+ name);
		}
		else
		{
			
			HttpSession httpSession = request.getSession();
	      
			List<User> getUserList = JDBCDBUtil.getUserDetails(id);
			//request.getAttribute("userList");
			httpSession.setAttribute("Block", getUserList);
			
			RequestDispatcher dis = request.getRequestDispatcher("Admin.jsp");
			dis.forward(request, response);
	        httpSession.setAttribute("message", " User Blocked "+ name);
		}
	}

}
