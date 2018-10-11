package com.pro.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.pro.domain.Punch;
import com.pro.domain.Reply;
import com.pro.domain.User;

public class ReplyDaoImpl extends BaseDao implements ReplyDao {

	@Override
	public void reply(Connection conn, Reply reply) throws Exception {
		String sql = "insert into a_reply(replyId,punchId,replyreplyId,userId,replyvalue,replytime) values(seq.nextval,?,?,?,?,?)";
		Object[] param = {reply.getPunch().getPunchId(),reply.getReply().getReplyId(),reply.getUser().getUserId(),reply.getReplyValue(),reply.getReplyTime()};
		this.exeSql(conn, sql, param);
	}

	@Override 
	public List<Reply> selectPunchReply(Connection conn, int punchId) throws Exception {
		String sql = "select * from a_reply where punchId=?";
		Object[] param = {punchId};
		ResultSet rs = this.getRs(conn, sql, param);
		List<Reply> replyList = new ArrayList<Reply>();
		while(rs.next()){
			Reply reply = new Reply();
			reply.setReplyId(rs.getInt("replyId"));
			reply.setPunch(new Punch(rs.getInt("punchId")));
			reply.setReply(new Reply(rs.getInt("replyId")));
			reply.setReplyTime(rs.getString("replyTime"));
			reply.setReplyValue(rs.getString("replyValue"));
			reply.setUser(new User(rs.getInt("userId")));
			replyList.add(reply);
		}
		
		return replyList;
	}

	@Override
	public void deleteReply(Connection conn, int punchId) throws Exception {

		String sql = "delete from a_reply where REPLYID=?";
		Object param[] = {punchId};
		this.exeSql(conn, sql, param);
		
	}

}
