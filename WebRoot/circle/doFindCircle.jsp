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
	request.setCharacterEncoding("UTf-8");
//	User user = (User)session.getAttribute("us");

//	User user = new User();
//	user.setUserId(1);

	String circleId = request.getParameter("circleId");

	CircleService circleService = new CircleServiceImpl();
	Circle circle = circleService.findCircleSingle(Integer.parseInt(circleId));
	
	CircleTypeService circleTypeService = new CircleTypeServiceImpl();
	List<CircleType> ctList = circleTypeService.findCircleTypeAll();
	
	request.setAttribute("circle",circle);
	request.setAttribute("ctList",ctList);
	
	request.getRequestDispatcher("updateCircle.jsp").forward(request,response);
	
	
%>