<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.pro.service.UserService"%>
<%@page import="com.pro.service.UserServiceImpl"%>
<%@page import="java.util.List"%>
<%@page import="com.pro.domain.User"%>
<%@page import="com.pro.service.CircleService"%>
<%@page import="com.pro.service.CircleServiceImpl"%>
<%@page import="com.pro.domain.Circle"%>

<%

	String circleId = request.getParameter("circleId");

	UserService user = new UserServiceImpl();
	List<User> userList = user.findUserOfFollowTheCircle(Integer.parseInt(circleId));
	int followCount = user.findFollowTheCircleCount(Integer.parseInt(circleId));
	CircleService circleService = new CircleServiceImpl();
	Circle circle = circleService.findCircleSingle(Integer.parseInt(circleId));

	request.setAttribute("circle",circle);
	request.setAttribute("followCount",followCount);
	request.setAttribute("userList",userList);
	session.setAttribute("circleIdOfRemoveFollow",circleId);
	
	
	request.getRequestDispatcher("showCircleFollower.jsp").forward(request,response);
%>








