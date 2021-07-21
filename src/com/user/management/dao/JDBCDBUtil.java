package com.user.management.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import com.user.management.helper.DBConnect;
import com.user.management.entities.User;
import com.user.management.entities.UserLog;

public class JDBCDBUtil 
{
	private static boolean isSuccess;
	private static Connection conn = null;
	private static Statement stmt = null;
	private static ResultSet rs = null;
	
	public static List<User> validate (String userEmail, String userPassword)
	{
		
		ArrayList<User> usr = new ArrayList<>();
		try 
		{
			conn = DBConnect.getConnection();
			stmt = conn.createStatement();
			
			String sql = "select * from user where user_email='"+userEmail+"' and user_password='"+userPassword+"'";
			rs = stmt.executeQuery(sql);
			
		    if(rs.next())
		    {
		    	int id = rs.getInt(1); //(column index)
				String name = rs.getString(5);
				String email = rs.getString(4);
				String password = rs.getString(6);
				String cpassword = rs.getString(3);
				String phone = rs.getString(7);
				String picture = rs.getString(8);
				String address = rs.getString(2);
				String status = rs.getString(9);
				String type = rs.getString(10);
									
			User ad = new User(id,name,email,password, cpassword, phone, picture, address, type, status);
		    usr.add(ad);
		    }	    
		}
		
		catch(Exception e)
		{
			e.printStackTrace();
		} 
			return usr;	
	}
	

public static boolean upateUser(String id, String name, String email, String password, String cPassword, String phone, String address)
{
    try
    {
    	conn = DBConnect.getConnection();
		stmt = conn.createStatement();
		String sql = "update user set user_name='"+name+"',user_email='"+email+"',"
				+ "user_password='"+password+"',"
				+ "user_conform_password='"+cPassword+"',"
				+ " user_phone='"+phone+"',"
				+ " user_address='"+address+"'"
				+ "where user_id='"+id+"'";
		
		
		int rs = stmt.executeUpdate(sql);
		
		if(rs > 0)
	    {
	    	isSuccess = true;
	    }
		else
		{
			isSuccess = false;
		}
    }
    catch(Exception e)
    {
    	e.printStackTrace();
    }
	return isSuccess;
}
	


public static boolean ResetPassword(String mail, String pass, String cpass)
{
    try
    {
    	conn = DBConnect.getConnection();
		stmt = conn.createStatement();
		String sql = "update user set user_email='"+mail+"',"
				+ "user_password='"+pass+"',"
				+ "user_conform_password='"+pass+"'"
				+ "where user_email='"+mail+"'";
		
		
		int rs = stmt.executeUpdate(sql);
		
		if(rs > 0)
	    {
	    	isSuccess = true;
	    }
		else
		{
			isSuccess = false;
		}
    }
    catch(Exception e)
    {
    	e.printStackTrace();
    }
	return isSuccess;
}

public static List<User> getUserDetails(String Id)
{
    	
    	int convertedID = Integer.parseInt(Id);
    	
    	ArrayList<User> usr = new ArrayList<>();
    	
    	try 
    	{
    		conn = DBConnect.getConnection();
    		stmt = conn.createStatement();
    		String sql = "select * from user where user_id ='"+convertedID+"'";
    		rs = stmt.executeQuery(sql);
    		
    			  while(rs.next()) {
    				  int id = rs.getInt(1); //(column index)
    					String name = rs.getString(5);
    					String email = rs.getString(4);
    					String password = rs.getString(6);
    					String cpassword = rs.getString(3);
    					String phone = rs.getString(7);
    					String picture = rs.getString(8);
    					String address = rs.getString(2);
    					String type = rs.getString(9);
    					User ad = new User(id,name,email,password, cpassword, phone, picture, address, type);
    			       usr.add(ad);
    		}
    		
    	}
    	catch(Exception e)
    	{
    		e.printStackTrace();
    	}	
    	return usr;	
    }

public static boolean deleteUser(String id)
{
	int convId = Integer.parseInt(id);
	try {
		
		conn = DBConnect.getConnection();
		stmt = conn.createStatement();
		String sql=  "delete from user where user_Id='"+ convId+"'";
		int r = stmt.executeUpdate(sql);
		
		if(r > 0)
	    {
	    	isSuccess = true;
	    }
		else
		{
			isSuccess = false;
		}
	}
	
	catch(Exception e)
	{
		e.printStackTrace();
	}
	return isSuccess;
}


public static boolean BlockUser(String id, String name, String status) 
{
	 try
	    {
	    	conn = DBConnect.getConnection();
			stmt = conn.createStatement();
			String block = "update user set user_status='"+status+"'"
					+ "where user_id='"+id+"'";
			
			
			int rs = stmt.executeUpdate(block);
			
			if(rs > 0)
		    {
		    	isSuccess = true;
		    }
			else
			{
				isSuccess = false;
			}
	    }
	    catch(Exception e)
	    {
	    	e.printStackTrace();
	    }
	    
	   
		return isSuccess;	
}



public static boolean unBlockUser(String id, String name, String status) 
{
	 try
	    {
	    	conn = DBConnect.getConnection();
			stmt = conn.createStatement();
			String block = "update user set user_status='"+status+"'"
					+ "where user_id='"+id+"'";
			
			
			int rs = stmt.executeUpdate(block);
			
			if(rs > 0)
		    {
		    	isSuccess = true;
		    }
			else
			{
				isSuccess = false;
			}
	    }
	    catch(Exception e)
	    {
	    	e.printStackTrace();
	    }
	    
	   
		return isSuccess;	
}


public static ArrayList<UserLog> getStatus(String id)
{
	ArrayList<UserLog> ulog = new ArrayList<>();
	try 
	{
		int convertedID = Integer.parseInt(id);
		conn = DBConnect.getConnection();
		stmt = conn.createStatement();
		String sql = "select * from userlog where UserID ='"+convertedID+"'";
		rs = stmt.executeQuery(sql);
		
			  while(rs.next()) 
			  {
				    int uId = rs.getInt(1); //(column index)
					int userId = rs.getInt(4);
					String fullName = rs.getString(5);
					String login = rs.getString(2);
					String logout = rs.getString(3);
					UserLog ad = new UserLog(uId, userId,fullName, login, logout );
			         ulog.add(ad);
			         int userid= ad.getUserId();
			         String username= ad.getUserName();
			         String inlog = ad.getIndate();
			         System.out.println("Sachin ID: "+userid);
			         System.out.println("Sachin Name: "+username);
			         System.out.println("Sachin Login Date: "+inlog);         
		   }	
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}	
	return  ulog;	
}



}
