<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.pro.service.UserServiceImpl"%>
<%@page import="com.pro.service.UserService"%>
<%@page import="java.util.List"%>
<%@page import="com.pro.domain.User"%>
<%@page import="java.io.PrintWriter"%>
<%
	request.setCharacterEncoding("UTF-8");

	String userName=request.getParameter("userName");
	
	UserService userService = new UserServiceImpl();
	List<User> userList = userService.findAll();
	String flag ="1";
	for(int i=0;i<userList.size();i++){
		User user = userList.get(i);
		if(userName.equals(user.getUserName())||user.getUserName() == userName){
			flag ="0";
		}
	}
	
	PrintWriter write=response.getWriter();
	write.write(flag);
	write.flush();
	write.close();
	
	

%>