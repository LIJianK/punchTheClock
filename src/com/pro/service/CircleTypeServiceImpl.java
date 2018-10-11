package com.pro.service;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import com.pro.dao.CircleTypeDao;
import com.pro.dao.CircleTypeDaoImpl;
import com.pro.domain.CircleType;
import com.pro.util.DbHelper;

public class CircleTypeServiceImpl implements CircleTypeService {

	@Override
	public List<CircleType> findCircleTypeAll() {
		
		Connection conn = null;
		List<CircleType> ctList = new ArrayList<CircleType>();
		
		try {
			
			conn = DbHelper.getConn();
			CircleTypeDao circleTypeDao =  new CircleTypeDaoImpl();
			ctList = circleTypeDao.findCircleTypeAll(conn);
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			try {
				DbHelper.closeAll(conn);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		return ctList;
	}

}
