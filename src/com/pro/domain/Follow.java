package com.pro.domain;

public class Follow {
	private int followId;
	
	private int userId;
	
	private int userFollowId;
	
	private User userFollow;

	public User getUserFollow() {
		return userFollow;
	}

	public void setUserFollow(User userFollow) {
		this.userFollow = userFollow;
	}

	public int getFollowId() {
		return followId;
	}

	public void setFollowId(int followId) {
		this.followId = followId;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public int getUserFollowId() {
		return userFollowId;
	}

	public void setUserFollowId(int userFollowId) {
		this.userFollowId = userFollowId;
	}
	
	public Follow() {
		
	}

	public Follow(int userId, int userFollowId) {
		this.userId = userId;
		this.userFollowId = userFollowId;
	}
	
	
}
