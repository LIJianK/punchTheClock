<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.pro.domain.User"%>
<%@page import="com.pro.service.UserService"%>
<%@page import="com.pro.service.UserServiceImpl"%>
<%
	String userName = request.getParameter("userName");
	String pwd = request.getParameter("pwd");
	
	User user = new User();
	user.setUserName(userName);
	user.setPwd(pwd);
	UserService userService = new UserServiceImpl();
	User us = userService.getUser(user);
	String path="login.jsp";
	if(us!=null){
		path="index.jsp";
		session.setAttribute("us",us);
	}
	
	response.sendRedirect(path);


%>