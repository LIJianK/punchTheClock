<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.pro.service.CircleTypeServiceImpl"%>
<%@page import="com.pro.service.CircleTypeService"%>
<%@page import="java.util.List"%>
<%@page import="com.pro.domain.CircleType"%>

<%
	CircleTypeService CircleTypeService = new CircleTypeServiceImpl();
	List<CircleType> ctList = CircleTypeService.findCircleTypeAll();
	
	request.setAttribute("ctList",ctList);
	
	request.getRequestDispatcher("addCircle.jsp").forward(request,response);
%> 