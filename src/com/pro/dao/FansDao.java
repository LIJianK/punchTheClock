package com.pro.dao;

import java.sql.Connection;
import java.util.List;
import com.pro.domain.Fans;


public interface FansDao {
	//cjf 添加粉丝表  点击关注后为目标账户的粉丝表添加内容
	public void insert(Connection conn,Fans fans)throws Exception;
	//cjf 删除粉丝表 
	public void delete(Connection conn,Fans fans)throws Exception;
	//cjf 查找粉丝总数
	public int getFansCount(Connection conn,int userId)throws Exception;
	//cjf 查该用户所有粉丝
	public List<Fans> selectAllByUserId(Connection conn,int userId)throws Exception;
}
