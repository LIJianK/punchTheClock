package com.pro.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.pro.dao.CircleDao;
import com.pro.dao.CircleDaoImpl;
import com.pro.dao.PunchDao;
import com.pro.dao.PunchDaoImpl;
import com.pro.dao.ReplyDao;
import com.pro.dao.ReplyDaoImpl;
import com.pro.domain.Circle;
import com.pro.domain.Punch;
import com.pro.util.DbHelper;

public class CircleServiceImpl implements CircleService {

	@Override
	public void addCircle(Circle circle) {

		Connection conn = null;
		
		try {
			conn = DbHelper.getConn();
			CircleDao circleDao = new CircleDaoImpl();
			circleDao.addCircle(conn, circle);
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
	public List<Circle> findCircleAll(int userId) {

		Connection conn = null;
		List<Circle> cList = new ArrayList<Circle>();
		
		try {
			
			conn = DbHelper.getConn();
			CircleDao circleDao =  new CircleDaoImpl();
			cList = circleDao.findCircleAll(conn,userId);
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			try {
				DbHelper.closeAll(conn);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		return cList;
	}

	@Override
	public Circle findCircleSingle(int circleId) {
		
		Connection conn = null;
		Circle circle = new Circle();
		
		try {
			
			conn = DbHelper.getConn();
			CircleDao circleDao =  new CircleDaoImpl();
			circle = circleDao.findCircleSingle(conn,circleId);
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			try {
				DbHelper.closeAll(conn);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		return circle;
	}

	@Override
	public void updateCircle(Circle circle) {
		
		Connection conn = null;
		
		try {
			conn = DbHelper.getConn();
			CircleDao circleDao = new CircleDaoImpl();
			circleDao.updateCircle(conn, circle);
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
	public List<Circle> findCircleOfCircleType(int typeId) {

		Connection conn = null;
		List<Circle> circleList = new ArrayList<Circle>();
		
		try {
			
			conn = DbHelper.getConn();
			CircleDao circleDao =  new CircleDaoImpl();
			circleList = circleDao.findCircleOfCircleType(conn,typeId);
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			try {
				DbHelper.closeAll(conn);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		return circleList;
	}

	@Override
	public List<Circle> findMyCircle(int userId) {
		Connection conn = null;
		List<Circle> cList = new ArrayList<Circle>();
		
		try {
			
			conn = DbHelper.getConn();
			CircleDao circleDao =  new CircleDaoImpl();
			cList = circleDao.findMyCircle(conn, userId);
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			try {
				DbHelper.closeAll(conn);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		return cList;
	}

	@Override
	public List<Circle> findAllCircleInHomePage() {

		Connection conn = null;
		List<Circle> cList = new ArrayList<Circle>();
		
		try {
			
			conn = DbHelper.getConn();
			CircleDao circleDao =  new CircleDaoImpl();
			cList = circleDao.findAllCircleInHomePage(conn);
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			try {
				DbHelper.closeAll(conn);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		return cList;
	}

	@Override
	public void deleteUserCircle(int circleId) {

		Connection conn = null;
		
		try {
			conn = DbHelper.getConn();
			
			conn.setAutoCommit(false);
			
			//根据circleId，删用户圈子表
			CircleDao circleDaoForDeleteUserCircle = new CircleDaoImpl();
			circleDaoForDeleteUserCircle.deleteUserCircle(conn,circleId);
			//根据circleId，找到打卡表List，根据打卡表Id，删评论表
			PunchDao findPunchDao = new PunchDaoImpl();
			List<Punch> circlePunchList = findPunchDao.findCirclePunch(conn, circleId);
			for (int i = 0; i < circlePunchList.size(); i++) {
				Punch punch = circlePunchList.get(i);
				int punchId = punch.getPunchId();
				ReplyDao replyDao = new ReplyDaoImpl();
				replyDao.deleteReply(conn,punchId);
			}
			//根据circleId，删打卡表
			PunchDao punchDao = new PunchDaoImpl();
			punchDao.deletePunch(conn,circleId);
			//根据circleId，删圈子表
			CircleDao circleDaoForDeleteCircle = new CircleDaoImpl();
			circleDaoForDeleteCircle.deleteCircle(conn,circleId);
			
			conn.commit();
			
		} catch (Exception e) {
			e.printStackTrace();
			try {
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
		}finally{
			try {
				DbHelper.closeAll(conn);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

}
