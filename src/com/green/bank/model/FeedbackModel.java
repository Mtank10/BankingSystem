package com.green.bank.model;

public class FeedbackModel {

	int f_id;
	String email,comment,experience;
	public void setEmail(String email) {
		this.email = email;
	}
	public String getEmail() {
		return email;
	}
	
	
	public void setF_id(int f_id) {
		this.f_id = f_id;
	}
	public int getF_id() {
		return f_id;
	}
	public void setExperience(String experience) {
		this.experience = experience;}
		
	public String getExperience() {
		return experience;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public String getComment() {
		return comment;
	}
}
