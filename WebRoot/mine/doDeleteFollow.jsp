<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.pro.service.FollowService"%>
<%@page import="com.pro.service.FollowServiceImpl"%>
<%@page import="com.pro.domain.Follow"%>
<%@page import="com.pro.service.FansService"%>
<%@page import="com.pro.service.FansServiceImpl"%>
<%@page import="com.pro.domain.Fans"%>
<%
	int userId = Integer.parseInt(request.getParameter("userId"));
	int userFollowId = Integer.parseInt(request.getParameter("userFollowId"));
	
	FollowService followService = new FollowServiceImpl();
	followService.remove(new Follow(userId,userFollowId));
	
	FansService fansService = new FansServiceImpl();
	fansService.remove(new Fans(userFollowId,userId));
	
	response.sendRedirect("findFollowList.jsp");
	


%>