package com.user.management.entities;

public class UserVerify 
{
	private String name;
	private String email;
	private String code;
	
	public UserVerify()
	{
		
	}
	
	
	public UserVerify(String name, String email, String code) 
	{
		this.name = name;
		this.email = email;
		this.code = code;
	}
	
	public String getName() 
	{
		return name;
	}
	public String getEmail()
	{
		return email;
	}
	public String getCode() 
	{
		return code;
	}
	public void setName(String name) 
	{
		this.name = name;
	}
	public void setEmail(String email) 
	{
		this.email = email;
	}
	public void setCode(String code)
	{
		this.code = code;
	}
	@Override
	public String toString() {
		return "VerifyCode [name=" + name + ", email=" + email + ", code=" + code + "]";
	}
	
	
	
	
	
}
