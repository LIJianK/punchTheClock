package com.pro.service;

import java.util.List;

import com.pro.domain.Message;

public interface MessageService {
	
	//查已发送
	public List<Message> findPost(int userId);
	
	//查已接收
	public List<Message> findReceive(int userId);
}
