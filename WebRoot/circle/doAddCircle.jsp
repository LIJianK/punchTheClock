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
<%@page import="com.pro.service.UserService"%>
<%@page import="com.pro.service.UserServiceImpl"%>

<%
	request.setCharacterEncoding("UTf-8");
	User user = (User)session.getAttribute("us");

	String circleName = request.getParameter("circleName");
	String circleValue = request.getParameter("circleValue"); 
	String typeId = request.getParameter("typeId");

	Circle circle = new Circle();
	circle.setCircleName(circleName);
	circle.setCircleValue(circleValue); 
	circle.setUser(new User(user.getUserId()));
	circle.setCircleType(new CircleType(Integer.parseInt(typeId)));
	
	CircleService circleService = new CircleServiceImpl();
	circleService.addCircle(circle);
	
	
	UserService userService = new UserServiceImpl();
	Circle circle1 = userService.findUserAndCircleInDiscover(circle);
	
	//创建圈子后默认关注
	userService.userFollowCircle(circle1.getCircleId(),user.getUserId());
	
	
	//需修改。。。
	response.sendRedirect("doSelfCircle.jsp");
	
	
%>