package com.pro.service;

import java.util.List;

import com.pro.domain.Circle;
import com.pro.domain.User;

public interface UserService {
	
	//cjf用于注册账户
	public void save(User user);
	
	//cjf 按账号密码查找单个，用于验证账户名密码
	public User getUser(User user);
	
	//cjf 查所有 用于遍历用户名和昵称是否已经被使用
	public List<User> findAll();
	
	//cjf  按照昵称查找单个   
	public User findOneByNickName(String nickName);
	
	//cjf  按照id查找单个   用于查看目标用户信息
	public User findOneByUserId(int userId);
	
	/**
	 * lj
	 * 用户关注圈子
	 */
	public void userFollowCircle(int circleId,int userId);
	
	/**
	 * lj
	 */
	public int findUserAndCircle(int circleId,int userId);
	
	public Circle findUserAndCircleInDiscover(Circle circle);
	
	/**
	 * lj
	 * @param circleId
	 * @param userId
	 * @return
	 */
	public int findFollowTheCircleCount(int circleId);
	
	public List<User> findUserOfFollowTheCircle(int circleId);
	
	public void deleteuserFollowCircle(int circleId,int userId);
	
}