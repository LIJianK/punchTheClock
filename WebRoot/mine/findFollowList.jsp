<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.pro.service.FollowService"%>
<%@page import="com.pro.service.FollowServiceImpl"%>
<%@page import="com.pro.domain.User"%>
<%@page import="java.util.List"%>
<%@page import="com.pro.domain.Follow"%>
<%
	//查找当前用户的关注列表
	User us = (User)session.getAttribute("us");
	
	FollowService followService = new FollowServiceImpl();
	List<Follow> followList = followService.findAllByUserId(us.getUserId());
	
	request.setAttribute("followList",followList);
	
	request.getRequestDispatcher("follow.jsp").forward(request,response);

%>