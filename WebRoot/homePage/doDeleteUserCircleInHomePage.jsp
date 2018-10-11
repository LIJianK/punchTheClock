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
	//n==0 找不到 不能取消关注
	int n = userService.findUserAndCircle(Integer.parseInt(circleId),user.getUserId());
	if(n==1){
		userService.deleteuserFollowCircle(Integer.parseInt(circleId),user.getUserId());
		info="成功退圈";
	}else{
		info="还未加入圈子";
	}
	
	PrintWriter write=response.getWriter();
	write.write(info);
	write.flush();
	write.close();
%>