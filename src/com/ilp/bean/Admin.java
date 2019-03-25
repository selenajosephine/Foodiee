package com.ilp.bean;

public class Admin {

	private long userId;
	private String username;
	private String email;
	private long phone;
	private String password;
	private String userType;
	private int centerId;

	public Admin() {
		super();
	}

	public Admin(long userId, String username, String email, long phone, String password, String userType,
			int centerId) {
		super();
		this.userId = userId;
		this.username = username;
		this.email = email;
		this.phone = phone;
		this.password = password;
		this.userType = userType;
		this.centerId = centerId;
	}

	public long getUserId() {
		return userId;
	}

	public void setUserId(long userId) {
		this.userId = userId;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public long getPhone() {
		return phone;
	}

	public void setPhone(long phone) {
		this.phone = phone;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getUserType() {
		return userType;
	}

	public void setUserType(String userType) {
		this.userType = userType;
	}

	public int getCenterId() {
		return centerId;
	}

	public void setCenterId(int centerId) {
		this.centerId = centerId;
	}

	@Override
	public String toString() {
		return "User [userId=" + userId + ", username=" + username + ", email=" + email + ", phone=" + phone
				+ ", password=" + password + ", userType=" + userType + ", centerId=" + centerId + "]";
	}
	

}
