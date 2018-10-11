package com.pro.domain;

public class User {
	private int userId;
	
	private String userName;
	
	private String pwd;
	
	private String nickName;

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
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

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public User(int userId) {
		super();
		this.userId = userId;
	}

	public User() {
		super();
		// TODO Auto-generated constructor stub
	}

	public User(int userId, String nickName) {
		super();
		this.userId = userId;
		this.nickName = nickName;
	}

	public User(int userId, String userName, String nickName) {
		super();
		this.userId = userId;
		this.userName = userName;
		this.nickName = nickName;
	}
	
	
	
}
