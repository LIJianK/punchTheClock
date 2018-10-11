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
<%@page import="java.util.ArrayList"%>
<%@page import="com.pro.service.UserService"%>
<%@page import="com.pro.service.UserServiceImpl"%>

<%
	String typeId = request.getParameter("typeId");

	CircleService circleService = new CircleServiceImpl();
	List<Circle> circleList = circleService.findCircleOfCircleType(Integer.parseInt(typeId));
	
	//查A_USERCIRCLE表 条件是circle的Id 查关注的人数（先找user集合）
	for(int i = 0; i < circleList.size(); i++){
		
		Circle circle = circleList.get(i);
		
		UserService user = new UserServiceImpl();
		int followCount = user.findFollowTheCircleCount(circle.getCircleId());
		circle.setFollowCount(followCount);
		if(i==0){
			String cirlceTypeName = circle.getCircleType().getTypeName();
			request.setAttribute("cirlceTypeName",cirlceTypeName);
		}
	}
	request.setAttribute("circleList",circleList);
	
	
	request.getRequestDispatcher("circleOfCircleType.jsp").forward(request,response);
%>