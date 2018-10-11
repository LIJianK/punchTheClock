package com.pro.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.pro.domain.Circle;
import com.pro.domain.CircleType;
import com.pro.domain.User;

public class CircleDaoImpl extends BaseDao implements CircleDao{

	@Override
	public void addCircle(Connection conn, Circle circle) throws Exception {

		String sql = "insert into A_CIRCLE(CIRCLEID,CIRCLENAME,CIRCLEDESC,TYPEID,USERID) values(seq.nextval,?,?,?,?)";
		Object param[] = {circle.getCircleName(),circle.getCircleValue(),circle.getCircleType().getTypeId(),circle.getUser().getUserId()};
		this.exeSql(conn, sql, param);
		
	}

	@Override
	public List<Circle> findCircleAll(Connection conn, int userId) throws Exception {

		String sql = "select * from A_CIRCLETYPE ct,a_circle c,a_users u where c.TYPEID=ct.TYPEID and u.userId=? and u.userId=c.userId";
		Object param[] = {userId};
		ResultSet rs = this.getRs(conn, sql, param);
		List<Circle> cList = new ArrayList<Circle>();
		while(rs.next()){
			Circle circle = new Circle();
			circle.setCircleId(rs.getInt("CIRCLEID"));
			circle.setCircleName(rs.getString("CIRCLENAME"));
			circle.setCircleType(new CircleType(rs.getInt("TYPEID"),rs.getString("TYPENAME")));
			circle.setCircleValue(rs.getString("CIRCLEDESC"));
			circle.setUser(new User(rs.getInt("USERID")));
			cList.add(circle);
		}
		
		return cList;
	}

	@Override
	public Circle findCircleSingle(Connection conn, int circleId)
			throws Exception {
		String sql = "select * from A_CIRCLE ce,A_CIRCLETYPE ct where ce.TYPEID=ct.TYPEID and CIRCLEID=?";
		Object param[] = {circleId};
		ResultSet rs = this.getRs(conn, sql, param);
		Circle circle = null;
		while(rs.next()){
			circle = new Circle();
			circle.setCircleId(rs.getInt("CIRCLEID"));
			circle.setCircleName(rs.getString("CIRCLENAME"));
			circle.setCircleType(new CircleType(rs.getInt("TYPEID"),rs.getString("TYPENAME")));
			circle.setCircleValue(rs.getString("CIRCLEDESC"));
			circle.setUser(new User(rs.getInt("USERID")));
		}
		
		return circle;
	}

	@Override
	public void updateCircle(Connection conn, Circle circle) throws Exception {

		String sql = "update A_CIRCLE set CIRCLENAME=?,CIRCLEDESC=?,TYPEID=? where CIRCLEID=?";
		Object param[] = {circle.getCircleName(),circle.getCircleValue(),circle.getCircleType().getTypeId(),circle.getCircleId()};
		this.exeSql(conn, sql, param);

	}

	@Override
	public List<Circle> findCircleOfCircleType(Connection conn, int typeId)
			throws Exception {
		
		String sql = "select * from A_CIRCLE ce,A_CIRCLETYPE ct,A_USERS us where ct.TYPEID=? and ce.TYPEID=ct.TYPEID and us.USERID=ce.USERID";
		Object param[] = {typeId};
		ResultSet rs = this.getRs(conn, sql, param);
		List<Circle> cList = new ArrayList<Circle>();
		while(rs.next()){
			Circle circle = new Circle();
			circle.setCircleId(rs.getInt("CIRCLEID"));
			circle.setCircleName(rs.getString("CIRCLENAME"));
			circle.setCircleType(new CircleType(rs.getInt("TYPEID"),rs.getString("TYPENAME")));
			circle.setCircleValue(rs.getString("CIRCLEDESC"));
			circle.setUser(new User(rs.getInt("USERID"),rs.getString("NICKNAME"),rs.getString("USERNAME")));
			cList.add(circle);
		}
		
		return cList;
	}

	@Override
	public List<Circle> findMyCircle(Connection conn, int userId) throws Exception {
		String sql = "select * from A_CIRCLETYPE ct,a_circle c,a_users u,a_usercircle uc where uc.userId=u.userId and uc.circleId=c.circleId and c.TYPEID=ct.TYPEID and u.userId=?";
		Object param[] = {userId};
		ResultSet rs = this.getRs(conn, sql, param);
		List<Circle> cList = new ArrayList<Circle>();
		while(rs.next()){
			Circle circle = new Circle();
			circle.setCircleId(rs.getInt("CIRCLEID"));
			circle.setCircleName(rs.getString("CIRCLENAME"));
			circle.setCircleType(new CircleType(rs.getInt("TYPEID"),rs.getString("TYPENAME")));
			circle.setCircleValue(rs.getString("CIRCLEDESC"));
			circle.setUser(new User(rs.getInt("USERID")));
			cList.add(circle);
		}
		
		return cList;
	}

	@Override
	public Circle findUserAndCircleInDiscover(Connection conn, Circle ce)
			throws Exception {
		
		String sql = "select * from A_CIRCLE ce where ce.USERID=? and ce.CIRCLENAME=? and ce.CIRCLEDESC=?";
		Object param[] = {ce.getUser().getUserId(),ce.getCircleName(),ce.getCircleValue()};
		ResultSet rs = this.getRs(conn, sql, param);
		Circle circle = null;
		while(rs.next()){
			circle = new Circle();
			circle.setCircleId(rs.getInt("CIRCLEID"));
		}
		
		return circle;
	}

	@Override
	public int findFollowTheCircleCount(Connection conn, int circleId)
			throws Exception {

		String sql = "select * from A_USERCIRCLE ce where ce.circleId=?";
		Object param[] = {circleId};
		ResultSet rs = this.getRs(conn, sql, param);
		int n = 0;
		while(rs.next()){
			n++;
		}
		
		return n;
	}

	@Override
	public List<User> findUserOfFollowTheCircle(Connection conn, int circleId)
			throws Exception {
		
		String sql = "select * from A_USERCIRCLE ce,A_USERS ue where ce.circleId=? and ce.userId=ue.userId";
		Object param[] = {circleId};
		List<User> userList = new ArrayList<User>();
		ResultSet rs = this.getRs(conn, sql, param);
		while(rs.next()){
			User user = new User();
			user.setNickName(rs.getString("NICKNAME"));
			user.setUserId(rs.getInt("UserId"));
			user.setUserName(rs.getString("UserName"));
			userList.add(user);
		}
		return userList;
	}

	@Override
	public void deleteuserFollowCircle(Connection conn, int circleId, int userId)
			throws Exception {

		String sql = "delete from A_USERCIRCLE ce where ce.circleId=? and ce.userId=?";
		Object param[] = {circleId,userId};
		this.exeSql(conn, sql, param);
		
	}

	@Override
	public List<Circle> findAllCircleInHomePage(Connection conn)
			throws Exception {

		String sql = "select * from A_CIRCLE ce,A_CIRCLETYPE ct,A_USERS us where ce.TYPEID=ct.TYPEID and us.USERID=ce.USERID";
		Object param[] = {};
		ResultSet rs = this.getRs(conn, sql, param);
		List<Circle> cList = new ArrayList<Circle>();
		while(rs.next()){
			Circle circle = new Circle();
			circle.setCircleId(rs.getInt("CIRCLEID"));
			circle.setCircleName(rs.getString("CIRCLENAME"));
			circle.setCircleType(new CircleType(rs.getInt("TYPEID"),rs.getString("TYPENAME")));
			circle.setCircleValue(rs.getString("CIRCLEDESC"));
			circle.setUser(new User(rs.getInt("USERID"),rs.getString("NICKNAME"),rs.getString("USERNAME")));
			cList.add(circle);
		}
		
		return cList;
	}

	@Override
	public void deleteUserCircle(Connection conn, int circleId) throws Exception {

		String sql = "delete from A_USERCIRCLE where circleId=?";
		Object param[] = {circleId};
		this.exeSql(conn, sql, param);
		
	}

	@Override
	public void deleteCircle(Connection conn, int circleId) throws Exception {
		
		String sql = "delete from A_CIRCLE where circleId=?";
		Object param[] = {circleId};
		this.exeSql(conn, sql, param);
		
	}
	
}








