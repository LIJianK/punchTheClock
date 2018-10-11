package com.pro.dao;

import java.sql.Connection;
import java.util.List;

import com.pro.domain.Message;

public interface MessageDao {
	
	//查已发送
	public List<Message> selectPost(Connection conn,int userId) throws Exception;
	
	//查已接收
	public List<Message> selectReceive(Connection conn,int userId) throws Exception;
}
