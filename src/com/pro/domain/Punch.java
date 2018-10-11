package com.pro.domain;

public class Punch {
	
	private int punchId;
	private Circle circle;
	private User user;
	private String punchMsg;
	private String punchTime;
	private int punchFeel;
	private int replyCount;
	public int getReplyCount() {
		return replyCount;
	}
	public void setReplyCount(int replyCount) {
		this.replyCount = replyCount;
	}
	public int getPunchFeel() {
		return punchFeel;
	}
	public Punch() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Punch(int punchId) {
		super();
		this.punchId = punchId;
	}
	public void setPunchFeel(int punchFeel) {
		this.punchFeel = punchFeel;
	}
	public int getPunchId() {
		return punchId;
	}
	public void setPunchId(int punchId) {
		this.punchId = punchId;
	}
	public Circle getCircle() {
		return circle;
	}
	public void setCircle(Circle circle) {
		this.circle = circle;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}

	public String getPunchMsg() {
		return punchMsg;
	}
	public void setPunchMsg(String punchMsg) {
		this.punchMsg = punchMsg;
	}
	public String getPunchTime() {
		return punchTime;
	}
	public void setPunchTime(String punchTime) {
		this.punchTime = punchTime;
	}

}
