package com.user.management.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import com.user.management.helper.DBConnect;

public class ForgotPasswordDAO 
{
	public void ForgotPassword(String email,String pass)
	{
        boolean status = false;
        try{  
        	boolean isSuccess;
        	Connection conn = null;
        	Statement stmt = null;
        	ResultSet rs = null;
        	
        	conn = DBConnect.getConnection();
			stmt = conn.createStatement();
			
            String id = "SELECT userId FROM users WHERE userEmail = "+email+"";
            Integer _id = Integer.parseInt(id);
            String query ="UPDATE userdb SET password=? WHERE id ="+_id+"";
            
            PreparedStatement ps=conn.prepareStatement(query);  
            ps.setString(6,pass);  
            rs=ps.executeQuery();           
            if (rs.next()){
                status = true;
            }
            else
                status = false;
            
        }
        catch(Exception e)
        {System.out.println(e);} 
        
    }
    
}
