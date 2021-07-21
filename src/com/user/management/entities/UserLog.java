package com.user.management.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class UserLog 
{
@Id
@Column(name="id")
@GeneratedValue(strategy = GenerationType.IDENTITY)
private int id;
@Column(name = "UserID")
int userId;
@Column(name = "fullname")
private String userName;
@Column(name = "LoginTime")
private String indate;
@Column(name = "LogoutTime")
private String outdate;
 


public UserLog() 
{
	
}

public UserLog(int id, int userId, String userName, String indate, String outdate) 
{
		this.id = id;
		this.indate = indate;
		this.outdate = outdate;
		this. userName =  userName;
		this.userId = userId;
}

public UserLog(String userName,int userId, String indate, String outdate) 
{
	this.indate = indate;
	this.outdate = outdate;
	this.userName = userName;
	this.userId = userId;	
}

public int getId() 
{
	return id;
}

public String getIndate() 
{
	return indate;
}

public String getOutdate() 
{
	return outdate;
}

public void setId(int id)
{
	this.id = id;
}

public void setIndate(String indate) 
{
	this.indate = indate;
}

public void setOutdate(String outdate) 
{
	this.outdate = outdate;
}

public String getUserName() {
	return userName;
}

public void setUserName(String userName) {
	this.userName = userName;
}

public int getUserId() {
	return userId;
}

public void setUserId(int userId) {
	this.userId = userId;
}

@Override
public String toString() 
{
	return "UserLog [id=" + id + ", userId=" + userId + ", userName=" + userName + ", indate=" + indate + ", outdate="
			+ outdate + "]";
} 
}


