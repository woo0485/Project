package com.finalproject.festival.domain;

public class Festival {



	public String id;
	public String password;
	public String name;
	public String phonenumber;
	public String email;
	public String totalpay;
	public String grade;
	public String joindate;
	
	public Festival() {}

	public Festival(String id, String password, String name, String phonenumber, String email, String totalpay,
			String grade, String joindate) {
		super();
		this.id = id;
		this.password = password;
		this.name = name;
		this.phonenumber = phonenumber;
		this.email = email;
		this.totalpay = totalpay;
		this.grade = grade;
		this.joindate = joindate;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhonenumber() {
		return phonenumber;
	}

	public void setPhonenumber(String phonenumber) {
		this.phonenumber = phonenumber;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getTotalpay() {
		return totalpay;
	}

	public void setTotalpay(String totalpay) {
		this.totalpay = totalpay;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	public String getJoindate() {
		return joindate;
	}

	public void setJoindate(String joindate) {
		this.joindate = joindate;
	}

}
