package com.pro.dao;

import java.sql.Connection;
import java.util.List;

import com.pro.domain.CircleType;

public interface CircleTypeDao {

	public List<CircleType> findCircleTypeAll(Connection conn) throws Exception;
	
}
