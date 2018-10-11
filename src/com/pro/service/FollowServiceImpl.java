package com.pro.service;

import java.sql.Connection;
import java.util.List;
import com.pro.dao.FollowDao;
import com.pro.dao.FollowDaoImpl;
import com.pro.domain.Follow;
import com.pro.util.DbHelper;

public class FollowServiceImpl implements FollowService {

	@Override
	public List<Follow> findAllByUserId(int userId) {
		Connection conn = null;
		List<Follow> followList = null;
		
		try {
			conn = DbHelper.getConn();
			FollowDao followDao = new FollowDaoImpl();
			followList = followDao.selectAllByUserId(conn, userId);
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
		
		return followList;
	}

	@Override
	public void save(Follow follow) {
		// TODO Auto-generated method stub
		Connection conn = null;
		
		try {
			conn = DbHelper.getConn();
			FollowDao followDao = new FollowDaoImpl();
			followDao.insert(conn, follow);
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
	public void remove(Follow follow) {
		// TODO Auto-generated method stub
		Connection conn = null;
		
		try {
			conn = DbHelper.getConn();
			FollowDao followDao = new FollowDaoImpl();
			followDao.delete(conn, follow);
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
	public int getFollowCount(int userId) {
		// TODO Auto-generated method stub
		Connection conn = null;
		int n = 0;
		try {
			conn = DbHelper.getConn();
			FollowDao followDao = new FollowDaoImpl();
			n = followDao.getFollowCount(conn, userId);
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
		return n;
	}

	

}
