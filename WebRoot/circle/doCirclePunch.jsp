<%@page import="java.util.ArrayList"%>
<%@page import="com.pro.service.UserService"%>
<%@page import="com.pro.service.UserServiceImpl"%>
<%@page import="com.pro.domain.Punch"%>
<%@page import="com.pro.service.PunchServiceImpl"%>
<%@page import="com.pro.service.PunchService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.pro.service.CircleTypeServiceImpl"%>
<%@page import="com.pro.service.CircleTypeService"%>
<%@page import="java.util.List"%>
<%@page import="com.pro.domain.CircleType"%>
<%@page import="com.pro.domain.Circle"%>
<%@page import="com.pro.domain.User"%>
<%@page import="com.pro.service.CircleService"%>
<%@page import="com.pro.service.CircleServiceImpl"%>

<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");

	String circleId = request.getParameter("circleId");
	//String circleName = request.getParameter("circleName");
	
	//格局Id查找 圈子
	CircleService circleService = new CircleServiceImpl();
	Circle circle = circleService.findCircleSingle(Integer.parseInt(circleId));
	
	
	String nickName = ((User)session.getAttribute("us")).getNickName();
	//int userId = ((User)session.getAttribute("us")).getUserId();
	
	PunchService punchService = new PunchServiceImpl();
	List<Punch> punchList = punchService.findCirclePunch(Integer.parseInt(circleId));
	
	
/* 	List<User> userList = new ArrayList<User>();
	UserService userService = new UserServiceImpl();
	for(int i=0;i<punchList.size();i++){
		User user = userService.findOneByUserId(punchList.get(i).getUser().getUserId());
		userList.add(user);
	} */
	
	request.setAttribute("punchList", punchList);
	request.setAttribute("circleName", circle.getCircleName());
	
	//request.setAttribute("nickName", nickName);
	//request.setAttribute("userList", userList);
	//request.setAttribute("userId", userId);
	
	request.getRequestDispatcher("circlePunch.jsp").forward(request, response);
%>





