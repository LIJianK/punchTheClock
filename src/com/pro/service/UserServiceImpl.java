package com.pro.service;

import java.sql.Connection;
import java.util.List;

import com.pro.dao.CircleDao;
import com.pro.dao.CircleDaoImpl;
import com.pro.dao.UserDao;
import com.pro.dao.UserDaoImpl;
import com.pro.domain.Circle;
import com.pro.domain.User;
import com.pro.util.DbHelper;

public class UserServiceImpl implements UserService {

	@Override
	public User getUser(User user) {
		// TODO Auto-generated method stub
		Connection conn = null;
		User us = null;
		
		try {
			conn = DbHelper.getConn();
			UserDao userDao = new UserDaoImpl();
			us = userDao.getUser(conn, user);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			try {
				DbHelper.closeAll(conn);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		return us;
	}

	@Override
	public void save(User user) {
		// TODO Auto-generated method stub
		Connection conn = null;
		
		try {
			conn = DbHelper.getConn();
			UserDao userDao = new UserDaoImpl();
			userDao.insert(conn, user);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			try {
				DbHelper.closeAll(conn);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	@Override
	public List<User> findAll() {
		// TODO Auto-generated method stub
		Connection conn = null;
		List<User> userList = null;
		
		try {
			conn = DbHelper.getConn();
			UserDao userDao = new UserDaoImpl();
			userList = userDao.selectAll(conn);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			try {
				DbHelper.closeAll(conn);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		return userList;
	}

	@Override
	public User findOneByNickName(String nickName) {
		// TODO Auto-generated method stub
		Connection conn = null;
		User us = null;
		
		try {
			conn = DbHelper.getConn();
			UserDao userDao = new UserDaoImpl();
			us = userDao.selectOneByNickName(conn, nickName);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			try {
				DbHelper.closeAll(conn);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		return us;
	}

	@Override
	public User findOneByUserId(int userId) {
		// TODO Auto-generated method stub
		Connection conn = null;
		User us = null;
		
		try {
			conn = DbHelper.getConn();
			UserDao userDao = new UserDaoImpl();
			us = userDao.selectOneByUserId(conn, userId);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			try {
				DbHelper.closeAll(conn);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		return us;
	}

	@Override
	public void userFollowCircle(int circleId, int userId) {

		Connection conn = null;
		
		try {
			conn = DbHelper.getConn();
			UserDao userDao = new UserDaoImpl();
			userDao.userFollowCircle(conn, circleId, userId);
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
	public int findUserAndCircle(int circleId, int userId) {

		Connection conn = null;
		int n = 0;
		
		try {
			conn = DbHelper.getConn();
			UserDao userDao = new UserDaoImpl();
			n = userDao.findUserAndCircle(conn, circleId, userId);
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			try {
				DbHelper.closeAll(conn);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		return n;
	}

	@Override
	public Circle findUserAndCircleInDiscover(Circle circle) {

		
		Connection conn = null;
		Circle c = null;
		
		try {
			
			conn = DbHelper.getConn();
			CircleDao circleDao =  new CircleDaoImpl();
			c = circleDao.findUserAndCircleInDiscover(conn,circle);
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			try {
				DbHelper.closeAll(conn);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		return c;
	}

	@Override
	public int findFollowTheCircleCount(int circleId) {
		
		Connection conn = null;
		int n = 0;
		
		try {
			conn = DbHelper.getConn();
			CircleDao circleDao =  new CircleDaoImpl();
			n = circleDao.findFollowTheCircleCount(conn, circleId);
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			try {
				DbHelper.closeAll(conn);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		return n;
	}

	@Override
	public List<User> findUserOfFollowTheCircle(int circleId) {
		
		Connection conn = null;
		List<User> userList = null;
		
		try {
			conn = DbHelper.getConn();
			CircleDao circleDao =  new CircleDaoImpl();
			userList = circleDao.findUserOfFollowTheCircle(conn,circleId);
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			try {
				DbHelper.closeAll(conn);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		return userList;
	}

	@Override
	public void deleteuserFollowCircle(int circleId, int userId) {
		
		Connection conn = null;
		
		try {
			conn = DbHelper.getConn();
			CircleDao circleDao =  new CircleDaoImpl();
			circleDao.deleteuserFollowCircle(conn,circleId,userId);
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

}
