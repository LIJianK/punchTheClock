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

	String circleId = request.getParameter("circleId");
	String circleName = request.getParameter("circleName");
	String circleValue = request.getParameter("circleValue"); 
	String typeId = request.getParameter("typeId");

	Circle circle = new Circle();
	circle.setCircleId(Integer.parseInt(circleId));
	circle.setCircleName(circleName);
	circle.setCircleValue(circleValue); 
	circle.setCircleType(new CircleType(Integer.parseInt(typeId)));
	
	CircleService circleService = new CircleServiceImpl();
	circleService.updateCircle(circle);
	
	response.sendRedirect("doSelfCircle.jsp");
	
	
%>