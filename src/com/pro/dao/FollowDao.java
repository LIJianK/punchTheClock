package com.pro.dao;

import java.sql.Connection;
import java.util.List;

import com.pro.domain.Follow;

public interface FollowDao {
	//cjf 查该用户所有关注过的人
	public List<Follow> selectAllByUserId(Connection conn,int userId)throws Exception;
	
	//cjf 添加关注表  关注别的用户
	public void insert(Connection conn,Follow follow)throws Exception;
	
	//cjf 删除关注表
	public void delete(Connection conn,Follow follow)throws Exception;
	
	//cjf 查找该用户 关注的人总数
	public int getFollowCount(Connection conn,int userId)throws Exception;
}
