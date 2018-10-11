package com.pro.service;

import java.util.List;

import com.pro.domain.Fans;

public interface FansService {
	//cjf 添加粉丝表  点击关注后为目标账户的粉丝表添加内容
	public void save(Fans fans);
	//cjf 删除粉丝表 
	public void remove(Fans fans);
	//cjf 查找粉丝总数
	public int getFansCount(int userId);
	//cjf 查该用户所有粉丝
	public List<Fans> findAllByUserId(int userId);
}
