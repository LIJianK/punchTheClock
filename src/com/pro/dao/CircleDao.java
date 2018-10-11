package com.pro.dao;

import java.sql.Connection;
import java.util.List;

import com.pro.domain.Circle;
import com.pro.domain.User;

public interface CircleDao {

	public void addCircle(Connection conn,Circle circle) throws Exception;
	
	public List<Circle> findCircleAll(Connection conn, int userId) throws Exception;
	
	public Circle findCircleSingle(Connection conn, int circleId) throws Exception;

	public void updateCircle(Connection conn, Circle circle) throws Exception;

	public List<Circle> findCircleOfCircleType(Connection conn, int typeId) throws Exception;
	
	/**
	 * zjw查找我的圈子
	 * @param conn
	 * @return
	 * @throws Exception
	 */
	public List<Circle> findMyCircle(Connection conn,int userId) throws Exception;

	public Circle findUserAndCircleInDiscover(Connection conn, Circle circle) throws Exception;

	public int findFollowTheCircleCount(Connection conn, int circleId) throws Exception;

	public List<User> findUserOfFollowTheCircle(Connection conn, int circleId) throws Exception;

	public void deleteuserFollowCircle(Connection conn, int circleId, int userId) throws Exception;

	public List<Circle> findAllCircleInHomePage(Connection conn) throws Exception;

	public void deleteUserCircle(Connection conn,int circleId) throws Exception;

	public void deleteCircle(Connection conn, int circleId) throws Exception;

}
