<%@page import="com.pro.service.PunchServiceImpl"%>
<%@page import="com.pro.service.PunchService"%>
<%@page import="com.alibaba.fastjson.JSON"%>
<%@page import="com.pro.domain.Punch"%>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	String punchDate = new String(request.getParameter("punchDate").getBytes("ISO-8859-1"),"UTF-8");
	Punch punch = new Punch();
	punch = JSON.parseObject(punchDate,Punch.class);

	PunchService punchService = new PunchServiceImpl();
	int flag = punchService.findPunch(punch);

	response.setCharacterEncoding("UTF-8");
	PrintWriter writer = response.getWriter();
	writer.write(flag+"");
	writer.flush();
	writer.close();
%>