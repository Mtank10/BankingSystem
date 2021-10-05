package com.green.bank.model;

public class AdminModel {
	String  username, password, confirmpassword, email,usertype;
	int a_id;

	
	public int getA_id() {
		return a_id;
	}
	public void setA_id(int a_id)
	{
		this.a_id=a_id;
	}
	
	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}
    
	public String getUsertype() {
		return usertype;
	}

	public void setUsertype(String usertype) {
		this.usertype = usertype;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
  
	public String getConfirmPassword() {
		return confirmpassword;
	}

	public void setConfirmPassword(String confirmpassword) {
		this.confirmpassword = confirmpassword;
	}

	
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
		
}
