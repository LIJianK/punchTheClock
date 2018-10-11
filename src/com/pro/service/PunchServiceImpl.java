package com.pro.service;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import com.pro.dao.PunchDao;
import com.pro.dao.PunchDaoImpl;
import com.pro.domain.Punch;
import com.pro.util.DbHelper;

public class PunchServiceImpl implements PunchService {

	@Override
	public void punchClick(Punch punch) {
		Connection conn = null;
		
		try {
			conn = DbHelper.getConn();
			PunchDao punchDao = new PunchDaoImpl();
			punchDao.punchClick(conn, punch);
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

	/**
	 * 是否打卡zjw
	 */
	@Override
	public int findPunch(Punch punch) {
		Connection conn = null;
		int flag = 0;
		try {
			conn = DbHelper.getConn();
			PunchDao punchDao = new PunchDaoImpl();
			flag = punchDao.selectPunchId(conn, punch);
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			try {
				DbHelper.closeAll(conn);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return flag;
	}

	@Override
	public List<Punch> findCirclePunch(int circleId) {
		Connection conn = null;
		List<Punch> punchList = new ArrayList<Punch>();
		try {
			conn = DbHelper.getConn();
			PunchDao punchDao = new PunchDaoImpl();
			punchList = punchDao.findCirclePunch(conn, circleId);
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			try {
				DbHelper.closeAll(conn);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return punchList;
	}

	@Override
	public List<Punch> findUserPunch(int userId) {
		// TODO Auto-generated method stub
		Connection conn = null;
		List<Punch> punchList = new ArrayList<Punch>();
		try {
			conn = DbHelper.getConn();
			PunchDao punchDao = new PunchDaoImpl();
			punchList = punchDao.selectUserPunch(conn, userId);
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			try {
				DbHelper.closeAll(conn);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return punchList;
	}

}
