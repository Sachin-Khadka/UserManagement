package com.user.management.entities;



import java.sql.SQLException;
import com.user.management.helper.DBConnect;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class User {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(length = 10, name = "user_id")
	private int userId;
	@Column(length = 100, name = "user_name")
	private String userName;
	@Column(length = 100, name = "user_email")
	private String userEmail;
	@Column(length = 100, name = "user_password")
	private String userPassword;
	@Column(length = 100, name = "user_conform_password")
	private String userConformPassword;
	@Column(length = 12, name = "user_phone")
	private String userPhone;
	@Column(length = 1500, name = "user_pic")
	private String userPic;
	@Column(length = 1500, name = "user_address")
	private String userAddress;
	@Column(name = "user_type")
	private String userType;
	@Column(name = "user_status")
	private String userStatus;

	public User() {
		super();
	}

	public User(String userName, String userEmail, String userPassword, String userConformPassword, String userPhone,
			String userPic, String userAddress, String userType) {
		super();
		this.userName = userName;
		this.userEmail = userEmail;
		this.userPassword = userPassword;
		this.userConformPassword = userConformPassword;
		this.userPhone = userPhone;
		this.userPic = userPic;
		this.userAddress = userAddress;
		this.userType = userType;

	}

	public User(int userId, String userName, String userEmail, String userPassword, String userConformPassword,
			String userPhone, String userPic, String userAddress) {
		super();
		this.userId = userId;
		this.userName = userName;
		this.userEmail = userEmail;
		this.userPassword = userPassword;
		this.userConformPassword = userConformPassword;
		this.userPhone = userPhone;
		this.userPic = userPic;
		this.userAddress = userAddress;
	}

	
	
	public User(int userId, String userName, String userEmail, String userPassword, String userConformPassword,
			String userPhone, String userPic, String userAddress, String userType) {
		super();
		this.userId = userId;
		this.userName = userName;
		this.userEmail = userEmail;
		this.userPassword = userPassword;
		this.userConformPassword = userConformPassword;
		this.userPhone = userPhone;
		this.userPic = userPic;
		this.userAddress = userAddress;
		this.userType = userType;
	}

	public User(String userName, String userEmail, String userPassword, String userConformPassword, String userPhone,
			String userPic, String userAddress, String userType, String userStatus) 
	{
		super();
		this.userName = userName;
		this.userEmail = userEmail;
		this.userPassword = userPassword;
		this.userConformPassword = userConformPassword;
		this.userPhone = userPhone;
		this.userPic = userPic;
		this.userAddress = userAddress;
		this.userType = userType;
		this.userStatus = userStatus;
	}

	public User(int userId, String userName, String userEmail, String userPassword, String userConformPassword,
			String userPhone, String userPic, String userAddress, String userType, String userStatus) 
	{
		this.userId = userId;
		this.userName = userName;
		this.userEmail = userEmail;
		this.userPassword = userPassword;
		this.userConformPassword = userConformPassword;
		this.userPhone = userPhone;
		this.userPic = userPic;
		this.userAddress = userAddress;
		this.userType = userType;
		this.userStatus = userStatus;
	}

	public int getUserId() {
		return userId;
	}

	public String getUserName() {
		return userName;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public String getUserPassword() {
		return userPassword;
	}

	public String getUserPhone() {
		return userPhone;
	}

	public String getUserPic() {
		return userPic;
	}

	public String getUserAddress() {
		return userAddress;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}

	public String getUserConformPassword() {
		return userConformPassword;
	}

	public void setUserConformPassword(String userConformPassword) {
		this.userConformPassword = userConformPassword;
	}

	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}

	public void setUserPic(String userPic) {
		this.userPic = userPic;
	}

	public void setUserAddress(String userAddress) {
		this.userAddress = userAddress;
	}

	public String getUserType() {
		return userType;
	}

	public void setUserType(String userType) {
		this.userType = userType;
	}
	
	public String getUserStatus() {
		return userStatus;
	}

	public void setUserStatus(String userStatus) {
		this.userStatus = userStatus;
	}

	
	
	public boolean checkName(String userName) throws SQLException
	{  
	        Boolean result = false;
	        String query="select * from user where user_name = ?";
	        
	        PreparedStatement st = DBConnect.getConnection().prepareStatement(query);
	        st.setString(1, userName); 
	        ResultSet rs = st.executeQuery();
	            if(rs.next()) 
	            {
	            result = true;
	            }
	        
	        return result;
	}       
	
	public boolean passwordMismatch() 
	{
	if (userPassword.equals(userConformPassword)) 
	{
		return false;
    } 
	else
	    return true;
	}
	
		public boolean checkEmptyFields() 
		{
			if (userName.isEmpty() || userPassword.isEmpty()) 
			{
			  return true;
			} 
			else
			return false;
		}

	@Override
	public String toString() 
	{
		return "User [userId=" + userId + ", userName=" + userName + ", userEmail=" + userEmail + ", userPassword="
				+ userPassword + ", userPhone=" + userPhone + ", userPic=" + userPic + ", userAddress=" + userAddress
				+ "]";
	}
}