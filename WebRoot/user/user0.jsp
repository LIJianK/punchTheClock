<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.pro.domain.User"%>
<%@page import="java.util.List"%>
<%@page import="com.pro.domain.Circle"%>
<%@page import="com.pro.domain.Punch"%>
<html>
<head>
<title>用户信息</title>
</head>
<body>
<%
	User user = (User)request.getAttribute("user");
	String followCount = (String)request.getAttribute("followCount");
	String fansCount = (String)request.getAttribute("fansCount");
	List<Circle> myCircleList = (List<Circle>)request.getAttribute("myCircleList");
	List<Punch> punchList = (List<Punch>)request.getAttribute("punchList");
%>
	<div id="userInformation"  align="center" style="background-color:#33FFFF;">
		<h3 align="center" ><%=user.getNickName() %></h3>
		<font color="#CACACA" ><label >账户ID：<%=user.getUserId() %></label></font>
		<input type="hidden" name="userId" value="<%=user.getUserId() %>" />
		<table align="center" width="300">
			<tr align="center">
				<td width="50%">
					<a href="../mine/findFollowList.jsp" style="text-decoration:none">关注（<%=followCount %>）</a>
				</td>
				<td width="50%">
					<a href="../mine/findFansList.jsp" style="text-decoration:none">粉丝（<%=fansCount %>）</a>
				</td>
			</tr>
		</table>
	</div><hr/>
	
	
	<div id="userCircle" >
	关注的圈子:
		<table align ="center" >
			<tr align="center" height="100">
<%
	for(int i = 0;i<myCircleList.size();i++){
		Circle circle = myCircleList.get(i);	
%>
				<td width="90">
					<a href="../circle/doCirclePunch.jsp?circleId=<%=circle.getCircleId() %>" style="text-decoration:none"><font size="4" color="green"><%=circle.getCircleName() %></font></a>
				</td>
<% 
	}
%>
			</tr>
		</table>
	</div><hr/>
	
	
	<div id="userPunch" >
	打卡日记：	
	<br/>
<%
	for(int i=0;i<punchList.size();i++){
		Punch punch = punchList.get(i);
		String feel = "";
		if(punch.getPunchFeel()==1){
			feel = "满级开心";
		}else if(punch.getPunchFeel()==2){
			feel = "一般";
		}else if(punch.getPunchFeel()==3){
			feel = "平静";
		}else if(punch.getPunchFeel()==4){
			feel = "不开心";
		}
%>		
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color="#CACACA">-----------------------------------------------------------------------------</font>
		<table align ="center" width="90%">
			<tr>
				<td >
					&nbsp;&nbsp;&nbsp;<font color="#CACACA">在</font><a href="../circle/doCirclePunch.jsp?circleId=<%=punch.getCircle().getCircleId() %>" style="text-decoration:none"><font size="4" color="green"><%=punch.getCircle().getCircleName() %></font></a><font color="#CACACA">的打卡：</font>
				</td>
			</tr>
			<tr>
				<td >
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=punch.getPunchMsg() %>
				</td>
			</tr>
			<tr>
				<td >
					&nbsp;&nbsp;&nbsp;<font color="#CACACA" size="1.5"><%=feel %>&nbsp;&nbsp;&nbsp;<%=punch.getPunchTime() %></font>
				</td>
			</tr>
		</table>
<%
	}
%>
	</div>
	
	
	
	
	
	
	
	
	
</body>
</html>