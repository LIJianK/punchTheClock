package com.pro.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.pro.domain.CircleType;

public class CircleTypeDaoImpl extends BaseDao implements CircleTypeDao{

	@Override
	public List<CircleType> findCircleTypeAll(Connection conn) throws Exception {
		
		String sql = "select * from A_CIRCLETYPE";
		Object param[] = {};
		ResultSet rs = this.getRs(conn, sql, param);
		List<CircleType> ctList = new ArrayList<CircleType>();
		while(rs.next()){
			CircleType ct = new CircleType();
			ct.setTypeId(rs.getInt("typeId"));
			ct.setTypeName(rs.getString("TYPENAME"));
			ctList.add(ct);
		}
		
		return ctList;
	}

	
}
