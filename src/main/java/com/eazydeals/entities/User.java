package com.eazydeals.entities;

import java.sql.Timestamp;

public class User {
	
	private int userId;
	private String userName;
	private String userEmail;
	private String userPassword;
	private String userPhone;
	private String userGender;
	private Timestamp dateTime;
	private String userAddress;
	private String userCity;
	private String userPincode;
	private String userState;
	
	public User() {
		
	}

	public User(String userName, String userEmail, String userPassword, String userPhone, String userGender,
			String userAddress, String userCity, String userPincode, String userState) {
		super();
		this.userName = userName;
		this.userEmail = userEmail;
		this.userPassword = userPassword;
		this.userPhone = userPhone;
		this.userGender = userGender;
		this.userAddress = userAddress;
		this.userCity = userCity;
		this.userPincode = userPincode;
		this.userState = userState;
	}

	public User(String userName, String userEmail, String userPassword, String userPhone, String userGender,
			Timestamp dateTime, String userAddress, String userCity, String userPincode, String userState) {
		super();
		this.userName = userName;
		this.userEmail = userEmail;
		this.userPassword = userPassword;
		this.userPhone = userPhone;
		this.userGender = userGender;
		this.dateTime = dateTime;
		this.userAddress = userAddress;
		this.userCity = userCity;
		this.userPincode = userPincode;
		this.userState = userState;
	}
	
	public User(String userName, String userEmail, String userPhone, String userGender, String userAddress,
			String userCity, String userPincode, String userState) {
		super();
		this.userName = userName;
		this.userEmail = userEmail;
		this.userPhone = userPhone;
		this.userGender = userGender;
		this.userAddress = userAddress;
		this.userCity = userCity;
		this.userPincode = userPincode;
		this.userState = userState;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public String getUserPassword() {
		return userPassword;
	}

	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}

	public String getUserPhone() {
		return userPhone;
	}

	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}

	public String getUserGender() {
		return userGender;
	}

	public void setUserGender(String userGender) {
		this.userGender = userGender;
	}

	public Timestamp getDateTime() {
		return dateTime;
	}

	public void setDateTime(Timestamp dateTime) {
		this.dateTime = dateTime;
	}

	public String getUserAddress() {
		return userAddress;
	}

	public void setUserAddress(String userAddress) {
		this.userAddress = userAddress;
	}

	public String getUserCity() {
		return userCity;
	}

	public void setUserCity(String userCity) {
		this.userCity = userCity;
	}

	public String getUserPincode() {
		return userPincode;
	}

	public void setUserPincode(String userPincode) {
		this.userPincode = userPincode;
	}

	public String getUserState() {
		return userState;
	}

	public void setUserState(String userState) {
		this.userState = userState;
	}
	
}
