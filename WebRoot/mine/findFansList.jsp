<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.pro.domain.User"%>
<%@page import="com.pro.service.FansService"%>
<%@page import="com.pro.service.FansServiceImpl"%>
<%@page import="java.util.List"%>
<%@page import="com.pro.domain.Fans"%>
<%
	//查找当前用户的粉丝列表
	User us = (User)session.getAttribute("us");
	
	FansService fansService = new FansServiceImpl();
	List<Fans> fansList = fansService.findAllByUserId(us.getUserId());
	
	request.setAttribute("fansList",fansList);
	
	request.getRequestDispatcher("fans.jsp").forward(request,response);
	






%>