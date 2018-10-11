<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="com.pro.domain.Follow"%>

<html>
<head>
<title>我的关注</title>
</head>
<body>
	<table width="100%" border="1">
			<tr  align="center">
				<td width="100%" colspan="3">
					我的关注
				</td>
				
			</tr>
			<tr bgcolor="red" align="center">
				<td width="15%">
					关注的用户ID
				</td>
				<td width="60%">
					关注的用户昵称
				</td>
				<td width="25%">
					操作
				</td>
			</tr>
			<%
				List<Follow> followList = (List<Follow>)request.getAttribute("followList");
					for (int i = 0; i < followList.size(); i++) {
						Follow follow = followList.get(i);
			%>
			<tr align="center">
				<td>
					<%=follow.getUserFollowId()%>
				</td>
				<td>
					<a href="../user/findUser.jsp?userId=<%=follow.getUserFollowId() %>" style="text-decoration:none"><%=follow.getUserFollow().getNickName()%></a>  
				</td>
				<td>					
					<a href="doDeleteFollow.jsp?userId=<%=follow.getUserId() %>&userFollowId=<%=follow.getUserFollowId() %>" onclick="return confirm('你真的要取消关注嘛？')" style="text-decoration:none">取消关注</a>
				</td>
			</tr>
			<%
				}
			%>
		</table>
</body>
</html>