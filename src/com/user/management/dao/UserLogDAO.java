package com.user.management.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.SessionFactory;

import com.user.management.entities.UserLog;
import com.user.management.helper.DBConnect;


public class UserLogDAO
{
	private static Connection conn = null;
	private static Statement stmt = null;
	private static ResultSet rs = null;
	
    private SessionFactory factory;	
	public UserLogDAO(SessionFactory factory)
	{
		this.factory = factory;
	}
		
	//for Retrieve(R) 	
	public static ArrayList<UserLog> getStatus(String id, String name, String status)
	{
		int convertedID = Integer.parseInt(id);
		ArrayList<UserLog> ulog = new ArrayList<>();
	    	
	    	try 
	    	{
	    		conn = DBConnect.getConnection();
	    		stmt = conn.createStatement();
	    		String sql = "select * from userlog where UserID ='"+convertedID+"'";
	    		rs = stmt.executeQuery(sql);
	    		
	    		    while(rs.next()) {
	    			int Id = rs.getInt(1);
	    			String login = rs.getString(2);
	    			String logout= rs.getString(3);
	    			String fullName = rs.getString(4);
	    			int userID = rs.getInt(5);
	    			UserLog log = new UserLog(Id,userID, fullName, login, logout);
	    			ulog.add(log);
	    		}
	    		
	    	}
	    	catch(Exception e) 
	    	{
	    		e.printStackTrace();
	    	}	
	    	return ulog;	
	    }

	
	
	
}

