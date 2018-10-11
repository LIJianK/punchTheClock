package com.pro.dao;

import java.sql.Connection;
import java.util.List;

import com.pro.domain.Punch;

public interface PunchDao {
	
	/**
	 * @author zjw
	 * 打卡dao
	 * @param conn
	 * @param punch
	 * @throws Exception
	 */
	public void punchClick(Connection conn,Punch punch)throws Exception;
	
	/**
	 * @author zjw
	 * 判断是否已打卡
	 * @param conn
	 * @param punchId
	 * @return
	 * @throws Exception
	 */
	public int selectPunchId(Connection conn,Punch punch)throws Exception;
	
	public List<Punch> findCirclePunch(Connection conn,int circleId)throws Exception;
	
	//cjf 查找该用户打卡记录
	public List<Punch> selectUserPunch(Connection conn,int userId)throws Exception;

	public void deletePunch(Connection conn, int circleId)throws Exception;

}
