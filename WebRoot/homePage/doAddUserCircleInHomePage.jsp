<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.pro.service.CircleTypeServiceImpl"%>
<%@page import="com.pro.service.CircleTypeService"%>
<%@page import="java.util.List"%>
<%@page import="com.pro.domain.CircleType"%>
<%@page import="com.pro.service.CircleService"%>
<%@page import="com.pro.service.CircleServiceImpl"%>
<%@page import="com.pro.domain.Circle"%>
<%@page import="com.pro.domain.User"%>
<%@page import="com.pro.service.UserServiceImpl"%>
<%@page import="com.pro.service.UserService"%>
<%@page import="java.io.PrintWriter"%>

<%
	String circleId = request.getParameter("circleId");
	User user = (User)session.getAttribute("us");

	String info = null;
	UserService userService = new UserServiceImpl();
	//n==1 找到了 不能再次关注
	int n = userService.findUserAndCircle(Integer.parseInt(circleId),user.getUserId());
	if(n==0){
		userService.userFollowCircle(Integer.parseInt(circleId),user.getUserId());
		info="成功加入圈子";
	}else{
		info="已加入圈子";
	}
	
	PrintWriter write=response.getWriter();
	write.write(info);
	write.flush();
	write.close();
%>