<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.pro.domain.User"%>
<%@page import="com.pro.domain.Follow"%>
<%@page import="com.pro.service.FollowService"%>
<%@page import="com.pro.service.FollowServiceImpl"%>
<%@page import="com.pro.domain.Fans"%>
<%@page import="com.pro.service.FansService"%>
<%@page import="com.pro.service.FansServiceImpl"%>
<%
	request.setCharacterEncoding("UTF-8");
	//获取要    取消关注的userId
	String userId=request.getParameter("userId");
	//获取当前账户
	User us = (User)session.getAttribute("us");
	
	//装入follow对象 1.要关注别人的账户ID   2.被关注者的账户ID
	Follow follow = new Follow(us.getUserId(),Integer.parseInt(userId));
	//调用业务层 添加进关注表
	FollowService followService = new FollowServiceImpl();
	followService.remove(follow);
	
	//与前面同理  对应的添加粉丝表
	Fans fans = new Fans(Integer.parseInt(userId),us.getUserId());
	FansService fansService = new FansServiceImpl();
	fansService.remove(fans);



%>