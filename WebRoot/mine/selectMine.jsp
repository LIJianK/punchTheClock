<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.pro.domain.User"%>
<%@page import="com.pro.service.FollowService"%>
<%@page import="com.pro.service.FollowServiceImpl"%>
<%@page import="com.pro.service.FansService"%>
<%@page import="com.pro.service.FansServiceImpl"%>
<%@page import="com.pro.service.CircleService"%>
<%@page import="com.pro.service.CircleServiceImpl"%>
<%@page import="java.util.List"%>
<%@page import="com.pro.domain.Circle"%>
<%@page import="com.pro.service.PunchService"%>
<%@page import="com.pro.service.PunchServiceImpl"%>
<%@page import="com.pro.domain.Punch"%>
<%
	User us = (User)session.getAttribute("us");
	
	
	FollowService followService = new FollowServiceImpl();
	String followCount = followService.getFollowCount(us.getUserId())+"";
	
	FansService fansService = new FansServiceImpl();
	String fansCount = fansService.getFansCount(us.getUserId())+"";
	
	CircleService circleService = new CircleServiceImpl();
	List<Circle> myCircleList = circleService.findMyCircle(us.getUserId());
	
	PunchService punchService = new PunchServiceImpl();
	List<Punch> punchList = punchService.findUserPunch(us.getUserId());
	
	request.setAttribute("punchList",punchList);
	request.setAttribute("myCircleList",myCircleList);
	request.setAttribute("followCount",followCount);
	request.setAttribute("fansCount",fansCount);
	request.setAttribute("user",us);
	
	request.getRequestDispatcher("../user/user0.jsp").forward(request,response);

%>