package com.user.management.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class UserStatus
{
	@Id
	@Column(name="id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	@Column(name = "userID")
	int userId;
	@Column(name = "fullname")
	private String userName;
	@Column(name = "userStatus")
	private String status;
	@Column(name = "activeTime")
	private String activeTime;
	@Column(name = "blockTime")
	private String blockTime;
	
	
	public UserStatus() {
		
	}


	public UserStatus(int id, int userId, String userName, String status, String activeTime, String blockTime) {
		super();
		this.id = id;
		this.userId = userId;
		this.userName = userName;
		this.status = status;
		this.activeTime = activeTime;
		this.blockTime = blockTime;
	}


	public UserStatus(int userId, String userName, String status, String activeTime, String blockTime) {
		super();
		this.userId = userId;
		this.userName = userName;
		this.status = status;
		this.activeTime = activeTime;
		this.blockTime = blockTime;
	}


	public int getId() {
		return id;
	}


	public int getUserId() {
		return userId;
	}


	public String getUserName() {
		return userName;
	}


	public String getStatus() {
		return status;
	}


	public String getActiveTime() {
		return activeTime;
	}


	public String getBlockTime() {
		return blockTime;
	}


	public void setId(int id) {
		this.id = id;
	}


	public void setUserId(int userId) {
		this.userId = userId;
	}


	public void setUserName(String userName) {
		this.userName = userName;
	}


	public void setStatus(String status) {
		this.status = status;
	}


	public void setActiveTime(String activeTime) {
		this.activeTime = activeTime;
	}


	public void setBlockTime(String blockTime) {
		this.blockTime = blockTime;
	}	 
	
}
