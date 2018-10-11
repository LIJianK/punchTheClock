<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.pro.domain.User"%>
<%@page import="com.pro.service.UserService"%>
<%@page import="com.pro.service.UserServiceImpl"%>
<%
	
	request.setCharacterEncoding("UTF-8");
	
	String userName = request.getParameter("userName");
	String nickName = request.getParameter("nickName");
	String pwd = request.getParameter("pwd1");
	
	User user = new User();
	user.setUserName(userName);
	user.setNickName(nickName);
	user.setPwd(pwd);
	UserService userService = new UserServiceImpl();
	userService.save(user);
	
	response.sendRedirect("login.jsp");




%>