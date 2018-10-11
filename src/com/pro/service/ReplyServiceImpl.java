package com.pro.service;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import com.pro.dao.ReplyDao;
import com.pro.dao.ReplyDaoImpl;
import com.pro.domain.Reply;
import com.pro.util.DbHelper;

public class ReplyServiceImpl implements ReplyService {

	@Override
	public void reply(Reply reply) {
		Connection conn = null;
		
		try {
			conn = DbHelper.getConn();
			ReplyDao replyDao = new ReplyDaoImpl();
			replyDao.reply(conn, reply);
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			try {
				DbHelper.closeAll(conn);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	@Override
	public List<Reply> findPunchReply(int punchId) {
		Connection conn = null;
		List<Reply> replyList = new ArrayList<Reply>();
		try {
			conn = DbHelper.getConn();
			ReplyDao replyDao = new ReplyDaoImpl();
			replyList = replyDao.selectPunchReply(conn, punchId);
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			try {
				DbHelper.closeAll(conn);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return replyList;
	}

}
