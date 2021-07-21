package com.user.management.helper;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnect
{
  private static String url = "jdbc:mysql://localhost:3306/user_management";
  private static String userName = "root";
  private static String password = "YouFuck1@345";
  private static Connection conn;
  
  
  public static Connection getConnection()
  {
	  
	  try
	  {
		  Class.forName("com.mysql.cj.jdbc.Driver");	
		  conn = DriverManager.getConnection(url, userName, password);
	  }
	  catch(Exception e)
	  {
		  System.out.println("Database is not conncected!!");
	  }
	  return conn;
  }  
  
}
