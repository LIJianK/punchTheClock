package com.pro.dao;

import java.sql.Connection;
import java.util.List;

import com.pro.domain.User;

public interface UserDao {
	//cjf用于注册账户
	public void insert(Connection conn,User user)throws Exception;
	//cjf 按账号密码查找单个，用于验证账户名密码
	public User getUser(Connection conn,User user)throws Exception;
	//cjf 查所有 用于遍历用户名和昵称是否已经被使用
	public List<User> selectAll(Connection conn)throws Exception;
	//cjf  按照昵称查找单个   
	public User selectOneByNickName(Connection conn,String nickName)throws Exception;
	//cjf  按照id查找单个   用于查看目标用户信息
	public User selectOneByUserId(Connection conn,int userId)throws Exception;
	
	
	public void userFollowCircle(Connection conn, int circleId, int userId)throws Exception;
	public int findUserAndCircle(Connection conn, int circleId, int userId)throws Exception;
	
}
