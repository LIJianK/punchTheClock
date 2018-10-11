package com.pro.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.pro.domain.Follow;
import com.pro.domain.User;

public class FollowDaoImpl extends BaseDao implements FollowDao {

	@Override
	public List<Follow> selectAllByUserId(Connection conn, int userId)
			throws Exception {
		String sql = "select * from a_follow where userId=?";
		Object param[] = {userId};
		ResultSet rs = this.getRs(conn, sql, param);
		List<Follow> followList = new ArrayList<Follow>();
		while(rs.next()){
			Follow follow = new Follow();
			follow.setFollowId(rs.getInt("followId"));
			follow.setUserId(rs.getInt("userId"));
			follow.setUserFollowId(rs.getInt("userFollowId"));
			
			String sql1 = "select * from a_users where userId=?";
			Object param1 [] = {follow.getUserFollowId()};
			ResultSet rs1 = this.getRs(conn, sql1, param1);
			if(rs1.next()){
				follow.setUserFollow(new User(rs1.getInt("userId"),rs1.getString("nickName")));
			}
			
			
			followList.add(follow);
		}
		return followList;
	}

	@Override
	public void insert(Connection conn, Follow follow) throws Exception {
		// TODO Auto-generated method stub
		String sql = "insert into a_follow(followId,userId,userFollowId) values(seq.nextval,?,?)";
		Object param[] = {follow.getUserId(),follow.getUserFollowId()};
		this.exeSql(conn, sql, param);
	}

	@Override
	public void delete(Connection conn, Follow follow) throws Exception {
		// TODO Auto-generated method stub
		String sql = "delete from a_follow where userId=? and userFollowId=?";
		Object param [] = {follow.getUserId(),follow.getUserFollowId()};
		this.exeSql(conn, sql, param);
	}

	@Override
	public int getFollowCount(Connection conn, int userId) throws Exception {
		// TODO Auto-generated method stub
		String sql = "select count(*) from a_follow where userId=?";
		Object param[] ={userId};
		ResultSet rs = this.getRs(conn, sql, param);
		int n = 0;
		if(rs.next()){
			n = rs.getInt(1);
		}
		return n;
	}

}
