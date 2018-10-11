package com.pro.domain;

public class Reply {
	
	private int replyId;
	private String replyValue;
	private String replyTime;
	private Punch punch;
	private Reply reply;
	private User user;
	public int getReplyId() {
		return replyId;
	}
	public void setReplyId(int replyId) {
		this.replyId = replyId;
	}
	public String getReplyValue() {
		return replyValue;
	}
	public void setReplyValue(String replyValue) {
		this.replyValue = replyValue;
	}
	public String getReplyTime() {
		return replyTime;
	}
	public void setReplyTime(String replyTime) {
		this.replyTime = replyTime;
	}
	public Punch getPunch() {
		return punch;
	}
	public void setPunch(Punch punch) {
		this.punch = punch;
	}
	public Reply getReply() {
		return reply;
	}
	public void setReply(Reply reply) {
		this.reply = reply;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Reply(int replyId) {
		super();
		this.replyId = replyId;
	}
	public Reply() {
		super();
	}
	
}
