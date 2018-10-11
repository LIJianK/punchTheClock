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
	Date day = new Date();
	SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd");
	//date.format(day);
	//String userId = request.getParameter("userId");
	int userId = ((User)session.getAttribute("us")).getUserId();
	 CircleService circleService = new CircleServiceImpl();
	 List<Circle> circleList = circleService.findMyCircle(userId);
	 List<Circle> punchCircleList = new ArrayList<Circle>();
	 List<Circle> notPunchCircleList = new ArrayList<Circle>();
	 
	 PunchService punchService = new PunchServiceImpl();
	 
	 for(int i=0;i<circleList.size();i++){
	 	Circle circle = circleList.get(i);
	 	Punch punch = new Punch();
	 	punch.setCircle(circle);
	 	punch.setUser(new User(userId));
	 	punch.setPunchTime(date.format(day));
	 	int flag = punchService.findPunch(punch);
	 	if(flag==1){
	 		punchCircleList.add(circle);
	 	}else{
	 		notPunchCircleList.add(circle);
	 	}
	 }
	 request.setAttribute("punchCircleList", punchCircleList);
	 request.setAttribute("notPunchCircleList", notPunchCircleList);
	 
	 request.getRequestDispatcher("circle.jsp").forward(request, response);
%>








