package com.pro.service;

import java.sql.Connection;
import java.util.List;

import com.pro.dao.FansDao;
import com.pro.dao.FansDaoImpl;
import com.pro.domain.Fans;
import com.pro.util.DbHelper;

public class FansServiceImpl implements FansService {

	@Override
	public void save(Fans fans) {
		// TODO Auto-generated method stub
		Connection conn = null;
		
		try {
			conn = DbHelper.getConn();
			FansDao fansDao = new FansDaoImpl();
			fansDao.insert(conn, fans);
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
	public void remove(Fans fans) {
		// TODO Auto-generated method stub
		Connection conn = null;
		
		try {
			conn = DbHelper.getConn();
			FansDao fansDao = new FansDaoImpl();
			fansDao.delete(conn, fans);
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
	public int getFansCount(int userId) {
		// TODO Auto-generated method stub
		Connection conn = null;
		int n = 0;
		
		try {
			conn = DbHelper.getConn();
			FansDao fansDao = new FansDaoImpl();
			n = fansDao.getFansCount(conn, userId);
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

	@Override
	public List<Fans> findAllByUserId(int userId) {
		// TODO Auto-generated method stub
		Connection conn = null;
		List<Fans> fansList = null;
		
		try {
			conn = DbHelper.getConn();
			FansDao fansDao = new FansDaoImpl();
			fansList = fansDao.selectAllByUserId(conn, userId);
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
		return fansList;
	}

}
