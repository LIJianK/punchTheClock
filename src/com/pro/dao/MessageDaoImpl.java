package com.pro.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.pro.domain.Message;
import com.pro.domain.User;

public class MessageDaoImpl extends BaseDao implements MessageDao {

	@Override
	public List<Message> selectPost(Connection conn, int userId)
			throws Exception {
		// TODO Auto-generated method stub
		String sql = "select m.MESSAGEID,m.MESSAGEDESC,m.POSTID,p.NICKNAME postNickName,m.RECEIVEID,r.NICKNAME receiveNickName,m.POSTDATE from a_message m,a_users p,a_users r where m.POSTID=p.USERID and m.RECEIVEID=r.USERID and m.postId=?";
		Object param [] = {userId};
		ResultSet rs = this.getRs(conn, sql, param);
		List<Message> messageList = new ArrayList<Message>();
		while(rs.next()){
			Message message = new Message();
			message.setMessageId(rs.getInt("messageId"));
			message.setMessageDesc(rs.getString("messageDesc"));
			message.setPostUser(new User(rs.getInt("postId"),rs.getString("postNickName")));
			message.setReceiveUser(new User(rs.getInt("receiveId"),rs.getString("receiveNickName")));
			message.setPostDate(rs.getString("postDate"));
			messageList.add(message);
		}
		return messageList;
	}

	@Override
	public List<Message> selectReceive(Connection conn, int userId)
			throws Exception {
		// TODO Auto-generated method stub
		String sql = "select m.MESSAGEID,m.MESSAGEDESC,m.POSTID,p.NICKNAME postNickName,m.RECEIVEID,r.NICKNAME receiveNickName,m.POSTDATE from a_message m,a_users p,a_users r where m.POSTID=p.USERID and m.RECEIVEID=r.USERID and m.receiveId=?";
		Object param [] = {userId};
		ResultSet rs = this.getRs(conn, sql, param);
		List<Message> messageList = new ArrayList<Message>();
		while(rs.next()){
			Message message = new Message();
			message.setMessageId(rs.getInt("messageId"));
			message.setMessageDesc(rs.getString("messageDesc"));
			message.setPostUser(new User(rs.getInt("postId"),rs.getString("postNickName")));
			message.setReceiveUser(new User(rs.getInt("receiveId"),rs.getString("receiveNickName")));
			message.setPostDate(rs.getString("postDate"));
			messageList.add(message);
		}
		return messageList;
	}

}
