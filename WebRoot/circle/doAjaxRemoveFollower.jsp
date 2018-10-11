<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.pro.service.CircleTypeServiceImpl"%>
<%@page import="com.pro.service.CircleTypeService"%>
<%@page import="java.util.List"%>
<%@page import="com.pro.domain.CircleType"%>
<%@page import="com.pro.service.UserServiceImpl"%>
<%@page import="com.pro.service.UserService"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="com.pro.domain.User"%>

<%
	String info = "";
	String userId = request.getParameter("userId");
	String circleId = (String)session.getAttribute("circleIdOfRemoveFollow");
	User user = (User)session.getAttribute("us");
	int userIdMain = user.getUserId();

	/*
		还差一个判断 移除的人是否是创建人
	*/
	if(userIdMain == Integer.parseInt(userId)){
		info="不能移除自己！！！";
	}else{
		UserService userService = new UserServiceImpl();
		userService.deleteuserFollowCircle(Integer.parseInt(circleId),Integer.parseInt(userId));
		info="删除成功";
	}
	
	PrintWriter write=response.getWriter();
	write.write(info);
	write.flush();
	write.close();
%>