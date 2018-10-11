package com.pro.dao;

import java.sql.Connection;
import java.util.List;

import com.pro.domain.Reply;

public interface ReplyDao {
	
	/**
	 * 评论打卡zjw
	 * @param conn
	 * @param reply
	 * @throws Exception
	 */
	public void reply(Connection conn,Reply reply)throws Exception;
	
	/**
	 * 评论回复
	 * @param conn 
	 * @param punchId
	 * @return
	 * @throws Exception
	 */
	public List<Reply> selectPunchReply(Connection conn,int punchId)throws Exception;

	public void deleteReply(Connection conn, int punchId)throws Exception;
	
	

}
