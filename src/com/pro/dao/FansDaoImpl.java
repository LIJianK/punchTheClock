package com.pro.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.pro.domain.Fans;
import com.pro.domain.User;

public class FansDaoImpl extends BaseDao implements FansDao {

	@Override
	public void insert(Connection conn, Fans fans) throws Exception {
		// TODO Auto-generated method stub
		String sql = "insert into a_fans(fansId,userId,userFansId) values(seq.nextval,?,?)";
		Object param[] = {fans.getUserId(),fans.getUserFansId()};
		this.exeSql(conn, sql, param);
	}

	@Override
	public void delete(Connection conn, Fans fans) throws Exception {
		// TODO Auto-generated method stub
		String sql = "delete from a_fans where userId=? and userFansId=?"; 
		Object param [] = {fans.getUserId(),fans.getUserFansId()};
		this.exeSql(conn, sql, param);
	}

	@Override
	public int getFansCount(Connection conn, int userId) throws Exception {
		String sql = "select count(*) from a_fans where userId=?";
		Object param [] = {userId};
		ResultSet rs = this.getRs(conn, sql, param);
		int n = 0;
		if(rs.next()){
			n = rs.getInt(1);
		}
		return n;
	}

	@Override
	public List<Fans> selectAllByUserId(Connection conn, int userId)
			throws Exception {
		// TODO Auto-generated method stub
		String sql ="select * from a_fans where userId=?";
		Object param [] = {userId};
		ResultSet rs = this.getRs(conn, sql, param);
		List<Fans> fansList = new ArrayList<Fans>();
		while(rs.next()){
			Fans fans = new Fans();
			fans.setFansId(rs.getInt("fansId"));
			fans.setUserId(rs.getInt("userId"));
			fans.setUserFansId(rs.getInt("userFansId"));
			
			String sql1 = "select * from a_users where userId=?";
			Object param1 [] = {rs.getInt("userFansId")};
			ResultSet rs1 = this.getRs(conn, sql1, param1);
			if(rs1.next()){
				fans.setUserFans(new User(rs1.getInt("userId"),rs1.getString("nickName")));
			}
			
			fansList.add(fans);
		}
		return fansList;
	}

}
