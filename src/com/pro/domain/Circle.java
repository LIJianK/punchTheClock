package com.pro.domain;

public class Circle {
	
	private int circleId;
	private String circleName;
	private String circleValue;
	private User user;
	public int getCircleId() {
		return circleId;
	}
	public void setCircleId(int circleId) {
		this.circleId = circleId;
	}
	public String getCircleName() {
		return circleName;
	}
	public void setCircleName(String circleName) {
		this.circleName = circleName;
	}
	public String getCircleValue() {
		return circleValue;
	}
	public void setCircleValue(String circleValue) {
		this.circleValue = circleValue;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public CircleType getCircleType() {
		return circleType;
	}
	public void setCircleType(CircleType circleType) {
		this.circleType = circleType;
	}
	private CircleType circleType;
	
	private int followCount;
	public int getFollowCount() {
		return followCount;
	}
	public void setFollowCount(int followCount) {
		this.followCount = followCount;
	}
	public Circle(int circleId, String circleName) {
		
		this.circleId = circleId;
		this.circleName = circleName;
	}
	public Circle() {
	
	}
	
	
}
