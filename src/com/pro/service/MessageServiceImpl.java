package com.pro.service;

import java.sql.Connection;
import java.util.List;

import com.pro.dao.MessageDao;
import com.pro.dao.MessageDaoImpl;
import com.pro.domain.Message;
import com.pro.util.DbHelper;

public class MessageServiceImpl implements MessageService {

	@Override
	public List<Message> findPost(int userId) {
		// TODO Auto-generated method stub
		Connection conn = null;
		List<Message> messageList = null;
		
		try {
			conn = DbHelper.getConn();
			MessageDao messageDao = new MessageDaoImpl();
			messageList = messageDao.selectPost(conn, userId);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			try {
				DbHelper.closeAll(conn);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		return messageList;
	}

	@Override
	public List<Message> findReceive(int userId) {
		// TODO Auto-generated method stub
		Connection conn = null;
		List<Message> messageList = null;
		
		try {
			conn = DbHelper.getConn();
			MessageDao messageDao = new MessageDaoImpl();
			messageList = messageDao.selectReceive(conn, userId);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			try {
				DbHelper.closeAll(conn);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		return messageList;
	}

}
