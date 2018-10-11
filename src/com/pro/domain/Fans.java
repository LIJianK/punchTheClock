package com.pro.domain;

public class Fans {
	private int fansId;
	
	private int userId;
	
	private int userFansId;
	
	private User userFans;

	public User getUserFans() {
		return userFans;
	}

	public void setUserFans(User userFans) {
		this.userFans = userFans;
	}

	public int getFansId() {
		return fansId;
	}

	public void setFansId(int fansId) {
		this.fansId = fansId;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public int getUserFansId() {
		return userFansId;
	}

	public void setUserFansId(int userFansId) {
		this.userFansId = userFansId;
	}
	
	public Fans() {
		
	}

	public Fans(int userId, int userFansId) {
		this.userId = userId;
		this.userFansId = userFansId;
	}
	
	
}
