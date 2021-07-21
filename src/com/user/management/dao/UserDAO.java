package com.user.management.dao;


import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

import com.user.management.entities.RegisterAdd;
import com.user.management.entities.User;
import com.user.management.entities.UserLog;
import com.user.management.entities.UserStatus;

public class UserDAO 
{
	private SessionFactory factory;

	
	public UserDAO(SessionFactory factory)
	{
		this.factory = factory;
	}

    //get user by email and password
	
	public  User getUserByEmailAndPassword(String email, String password)
	{
		User user = null;
		try
		{
			String query = "from User where userEmail = : e and userPassword= : p";
			Session session = this.factory.openSession();
			Query q = session.createQuery(query);
			q.setParameter("e", email);
			q.setParameter("p", password);
			//q.setParameter("p", PasswordHashDAO.getHash(password));
			user = (User) q.uniqueResult();
			session.close();
			
		}
		
		catch(Exception e)
		{
			e.getStackTrace();
		}
		
		return user;	
	}
	
	
	public List<User> getAllUsers()
	{
		Session s = this.factory.openSession();
		Query  query = s.createQuery("from User");
		List<User> list = query.list();
		return list;
	}
	
	
	public List<User> getAdmin()
	{
		Session s = this.factory.openSession();
		Query  query = s.createQuery("from User where user_type='admin'");
		List<User> alist = query.list();
		return alist;
	}
	
	
	public List<User> getUser()
	{
		Session s = this.factory.openSession();
		Query  query = s.createQuery("from User where user_type='normal'");
		List<User> ulist = query.list();
		return ulist;
	}
	
	public List<UserLog> getAllLogs()
	{
		Session s = this.factory.openSession();
		Query  query = s.createQuery("from  UserLog");
		List<UserLog> ulog = query.list();
		return ulog;
	}
	
	public List<UserLog> getSpecificAllLogs(String id)
	{
		Session s = this.factory.openSession();
		Query  query = s.createQuery("from  UserLog where userId = 'id'");
		List<UserLog> ulog = query.list();
		return ulog;
	}
	
	
	public List<User> getAllBockUsers()
	{
		Session s = this.factory.openSession();
		Query  query = s.createQuery("from  User where user_status='block'");
		List<User> blockList = query.list();
		return blockList;
	}
	
	
	public List<User> getAllActiveUsers()
	{
		Session s = this.factory.openSession();
		Query  query = s.createQuery("from  User where user_status='active'");
		List<User> activeList = query.list();
		return activeList;
	}
	
	public List<RegisterAdd> getAllRegisterAdd()
	{
		Session s = this.factory.openSession();
		Query  query = s.createQuery("from  RegisterAdd");
		List<RegisterAdd> statusList = query.list();
		return statusList;
	}
	
	public List<UserStatus> getAllStatus()
	{
		Session s = this.factory.openSession();
		Query  query = s.createQuery("from  UserStatus");
		List<UserStatus> status = query.list();
		return status;
	}
}



