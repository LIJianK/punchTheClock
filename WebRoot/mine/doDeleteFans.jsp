<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.pro.service.FollowService"%>
<%@page import="com.pro.service.FollowServiceImpl"%>
<%@page import="com.pro.domain.Follow"%>
<%@page import="com.pro.service.FansService"%>
<%@page import="com.pro.domain.Fans"%>
<%@page import="com.pro.service.FansServiceImpl"%>
<%
	int userId = Integer.parseInt(request.getParameter("userId"));
	int userFansId = Integer.parseInt(request.getParameter("userFansId"));
	
	FollowService followService = new FollowServiceImpl();
	followService.remove(new Follow(userFansId,userId));
	
	FansService fansService = new FansServiceImpl();
	fansService.remove(new Fans(userId,userFansId));

	response.sendRedirect("findFansList.jsp");
%>