<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="com.pro.domain.Fans"%>
<html>
<head>
<title>我的粉丝</title>
</head>
<body>
	<table width="100%" border="1">
			<tr  align="center">
				<td width="100%" colspan="3">
					我的粉丝
				</td>

			</tr>
			<tr bgcolor="red" align="center">
				<td width="15%">
					粉丝的用户ID
				</td>
				<td width="60%">
					粉丝的用户昵称
				</td>
				<td width="25%">
					操作
				</td>
			</tr>
			<%
				List<Fans> fansList = (List<Fans>)request.getAttribute("fansList");
					for (int i = 0; i < fansList.size(); i++) {
						Fans fans = fansList.get(i);
			%>
			<tr align="center">
				<td>
					<%=fans.getUserFansId()%>
				</td>
				<td>
					<a href="../user/findUser.jsp?userId=<%=fans.getUserFansId() %>" style="text-decoration:none"><%=fans.getUserFans().getNickName()%></a>  
				</td>
				<td>					
					<a href="doDeleteFans.jsp?userId=<%=fans.getUserId() %>&userFansId=<%=fans.getUserFansId() %>" onclick="return confirm('你真的要移除该粉丝嘛？')" style="text-decoration:none">移除粉丝</a>
				</td>
			</tr>
			<%
				}
			%>
		</table>
</body>
</html>