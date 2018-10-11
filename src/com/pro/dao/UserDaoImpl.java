package com.pro.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.pro.domain.User;

public class UserDaoImpl extends BaseDao implements UserDao {

	@Override
	public User getUser(Connection conn, User user) throws Exception {
		String sql ="select * from a_users where userName=? and pwd=?";
		Object param[] = {user.getUserName(),user.getPwd()};
		ResultSet rs = this.getRs(conn, sql, param);
		User us = null;
		if(rs.next()){
			us = new User();
			us.setUserId(rs.getInt("userId"));
			us.setUserName(rs.getString("userName"));
			us.setPwd(rs.getString("pwd"));
			us.setNickName(rs.getString("nickName"));
		}
		return us;
	}

	@Override
	public void insert(Connection conn, User user) throws Exception {
		String sql = "insert into a_users(userId,userName,pwd,nickName) values(seq.nextval,?,?,?)";
		Object param[] = {user.getUserName(),user.getPwd(),user.getNickName()};
		this.exeSql(conn, sql, param);
	}

	@Override
	public List<User> selectAll(Connection conn) throws Exception {
		String sql ="select * from a_users";
		Object param[] = null;
		ResultSet rs = this.getRs(conn, sql, param);
		List<User> userList = new ArrayList<User>();
		while(rs.next()){
			User user = new User();
			user.setUserId(rs.getInt("userId"));
			user.setUserName(rs.getString("userName"));
			user.setPwd(rs.getString("pwd"));
			user.setNickName(rs.getString("nickName"));
			userList.add(user);
		}
		
		return userList;
	}

	@Override
	public User selectOneByNickName(Connection conn, String nickName)
			throws Exception {
		String sql = "select * from a_users where nickName=?";
		Object param[]={nickName};
		ResultSet rs = this.getRs(conn, sql, param);
		User us = null;
		if(rs.next()){
			us = new User();
			us.setUserId(rs.getInt("userId"));
			us.setUserName(rs.getString("userName"));
			us.setPwd(rs.getString("pwd"));
			us.setNickName(rs.getString("nickName"));
		}
		return us;
	}

	@Override
	public User selectOneByUserId(Connection conn, int userId) throws Exception {
		// TODO Auto-generated method stubString sql = "select * from a_users where nickName=?";
		String sql = "select * from a_users where userId=?";
		Object param[]={userId};
		ResultSet rs = this.getRs(conn, sql, param);
		User us = null;
		if(rs.next()){
			us = new User();
			us.setUserId(rs.getInt("userId"));
			us.setUserName(rs.getString("userName"));
			us.setPwd(rs.getString("pwd"));
			us.setNickName(rs.getString("nickName"));
		}
		return us;
	}

	@Override
	public void userFollowCircle(Connection conn, int circleId, int userId)
			throws Exception {

		String sql = "insert into A_USERCIRCLE(USERCIRCLEID,CIRCLEID,USERID) values(seq.nextval,?,?)";
		Object param [] = {circleId,userId};
		this.exeSql(conn, sql, param);
		
	}

	@Override
	public int findUserAndCircle(Connection conn, int circleId, int userId)
			throws Exception {

		int n = 0;
		
		String sql = "select count(*) from A_USERCIRCLE where userId=? and circleId=?";
		Object param[]={userId,circleId};
		ResultSet rs = this.getRs(conn, sql, param);
		if(rs.next()){
			n =	rs.getInt(1);
		}
		
		
		return n;
		
		
	}

}
