package com.user.management.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class RegisterAdd 
{
	@Id
	@Column(name="id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	@Column(name = "FullName")
	private String userName;
	@Column(name = "JoinDate")
	private String joinDate;
	@Column(name = "UserCreatedDate")
	private String userCreatedDate;
	@Column(name = "AdminCreatedDate")
	private String adminCreatedDate;
	
	public RegisterAdd() 
	{
		
	}

	public RegisterAdd(int id, String userName, String joinDate, String userCreatedDate,String adminCreatedDate)
	{
		super();
		this.id = id;
		this.userName = userName;
		this.joinDate = joinDate;
		this.userCreatedDate = userCreatedDate;
		this.adminCreatedDate = adminCreatedDate;
	}

	public RegisterAdd(String userName, String joinDate, String userCreatedDate, String adminCreatedDate) {
		super();
		this.userName = userName;
		this.joinDate = joinDate;
		this.userCreatedDate = userCreatedDate;
		this.adminCreatedDate = adminCreatedDate;
	}

	
	
	
	public int getId() {
		return id;
	}

	public String getUserName() {
		return userName;
	}

	public String getJoinDate() {
		return joinDate;
	}

	public String getUserCreatedDate() {
		return userCreatedDate;
	}

	public String getAdminCreatedDate() {
		return adminCreatedDate;
	}

	public void setId(int id) {
		this.id = id;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public void setJoinDate(String joinDate) {
		this.joinDate = joinDate;
	}

	public void setUserCreatedDate(String userCreatedDate) {
		this.userCreatedDate = userCreatedDate;
	}

	public void setAdminCreatedDate(String adminCreatedDate) {
		this.adminCreatedDate = adminCreatedDate;
	}

	@Override
	public String toString() {
		return "RegisterAdd [id=" + id + ",userName=" + userName + ", joinDate=" + joinDate
				+ ", userCreatedDate=" + userCreatedDate + ", adminCreatedDate=" + adminCreatedDate + "]";
	} 
	
}
