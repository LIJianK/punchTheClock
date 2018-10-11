package com.pro.service;

import java.util.List;

import com.pro.domain.Punch;

public interface PunchService {
	
	/**
	 * zjw打卡
	 * @param punch
	 */
	public void punchClick(Punch punch);
	
	/**
	 * 是否打卡zjw
	 * @param punch
	 * @return
	 */
	public int findPunch(Punch punch);
	
	/**
	 * zjw查看圈子日记
	 * @param punchId
	 * @return
	 */
	public List<Punch> findCirclePunch(int circleId);
	
	//cjf 查找该用户打卡记录
	public List<Punch> findUserPunch(int userId);
}
