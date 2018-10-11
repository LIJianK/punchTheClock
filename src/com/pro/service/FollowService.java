package com.pro.service;

import java.util.List;
import com.pro.domain.Follow;

public interface FollowService {
	//cjf 查该用户所有关注过的人
	public List<Follow> findAllByUserId(int userId);
	
	//cjf 添加关注表  关注别的用户
	public void save(Follow follow); 
	
	//cjf 删除粉丝表 
	public void remove(Follow follow);
	
	//cjf 查找该用户 关注的人总数
	public int getFollowCount(int userId);
}
