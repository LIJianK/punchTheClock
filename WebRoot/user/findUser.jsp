<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.pro.service.UserService"%>
<%@page import="com.pro.service.UserServiceImpl"%>
<%@page import="com.pro.domain.User"%>
<%@page import="com.pro.service.FollowService"%>
<%@page import="com.pro.service.FollowServiceImpl"%>
<%@page import="java.util.List"%>
<%@page import="com.pro.domain.Follow"%>
<%@page import="com.pro.service.FansService"%>
<%@page import="com.pro.service.FansServiceImpl"%>
<%@page import="com.pro.service.CircleService"%>
<%@page import="com.pro.service.CircleServiceImpl"%>
<%@page import="com.pro.domain.Circle"%>
<%@page import="com.pro.service.PunchService"%>
<%@page import="com.pro.service.PunchServiceImpl"%>
<%@page import="com.pro.domain.Punch"%>
<%
	//获取当前账户
	User us = (User)session.getAttribute("us");

	//获取目前正在查看的账户ID
	int userId = Integer.parseInt(request.getParameter("userId"));
	
	//查找该用户关注数量
	FollowService followService = new FollowServiceImpl();
	String followCount = followService.getFollowCount(userId)+"";
	
	//查找该用户的粉丝数量
	FansService fansService = new FansServiceImpl();
	String fansCount = fansService.getFansCount(userId)+"";
	
	//flag分为三种模式0.查看的是自己的页面  1.未关注  2.已关注
	String flag="1";
	if(us.getUserId() == userId){
		flag="0";
	}
	
	List<Follow> followList = followService.findAllByUserId(us.getUserId());
	for(int i=0;i<followList.size();i++){
		Follow follow = followList.get(i);
		//如果关注表里的      "关注人"列里有    正在查看的用户
		if(follow.getUserFollowId() == userId){
			flag="2";
		}
	}
	
	//查看该用户信息
	UserService userService = new UserServiceImpl();
	User user = userService.findOneByUserId(userId);
	
	//查看该用户加入哪些圈子
	CircleService circleService = new CircleServiceImpl();
	List<Circle> myCircleList = circleService.findMyCircle(userId);
	
	//查看该用户的打卡
	PunchService punchService = new PunchServiceImpl();
	List<Punch> punchList = punchService.findUserPunch(userId);
	
	request.setAttribute("punchList",punchList);
	request.setAttribute("myCircleList",myCircleList);
	request.setAttribute("followCount",followCount);
	request.setAttribute("fansCount",fansCount);
	request.setAttribute("user",user);
	
	request.getRequestDispatcher("user"+flag+".jsp").forward(request,response);

%>