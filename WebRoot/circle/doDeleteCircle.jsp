<%@page import="com.pro.domain.User"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.pro.domain.Circle"%>
<%@page import="java.util.List"%>
<%@page import="com.pro.service.CircleServiceImpl"%>
<%@page import="com.pro.service.CircleService"%>
<%@page import="com.pro.service.PunchServiceImpl"%>
<%@page import="com.pro.service.PunchService"%>
<%@page import="com.alibaba.fastjson.JSON"%>
<%@page import="com.pro.domain.Punch"%>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%

	String circleId = request.getParameter("circleId");
	User user = (User)session.getAttribute("us");
	
	String info = null;
	CircleService circleService = new CircleServiceImpl();
	circleService.deleteUserCircle(Integer.parseInt(circleId));

	info="成功删除圈子。。。";
	
	PrintWriter write=response.getWriter();
	write.write(info);
	write.flush();
	write.close();

%>








