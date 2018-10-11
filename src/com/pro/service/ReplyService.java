package com.pro.service;

import java.util.List;

import com.pro.domain.Reply;

public interface ReplyService {
	
	/**
	 * 评论打卡zjw
	 * @param reply
	 */
	public void reply(Reply reply);
	
	/**
	 * 回复评论
	 * @param punchId
	 * @return
	 */
	public List<Reply> findPunchReply(int punchId);

}
