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
<%@page import="com.pro.service.UserService"%>
<%@page import="com.pro.service.UserServiceImpl"%>

<%
	User user = (User)session.getAttribute("us");
	int userId = user.getUserId();
	//User user = new User();
	
	CircleService circleService = new CircleServiceImpl();
	List<Circle> cList = circleService.findCircleAll(userId); 
	
	//查A_USERCIRCLE表 条件是circle的Id 查关注的人数（先找user集合）
	for(int i = 0; i < cList.size(); i++){
		
		Circle circle = cList.get(i);
		
		UserService user1 = new UserServiceImpl();
		int followCount = user1.findFollowTheCircleCount(circle.getCircleId());
		circle.setFollowCount(followCount);
		
	}
	
	request.setAttribute("cList",cList);
	
	request.getRequestDispatcher("selfCircle.jsp").forward(request,response);
%> 