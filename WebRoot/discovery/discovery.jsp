<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="com.pro.domain.CircleType"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
	<head>
		<title>发现</title>
	</head>
	<%
		List<CircleType> ctList = (List<CircleType>) request.getAttribute("ctList");
	%>
	<body>
		<table>
			<%
				for (int i = 0; i < ctList.size(); i++) {
					CircleType ct = ctList.get(i);
			%>
			<tr>
				<td>
					<a href="doFindCirclOfCircleType.jsp?typeId=<%=ct.getTypeId() %>"><%=ct.getTypeName()%></a>
				</td>
			</tr>
			<%
				}
			%>
		</table>
	</body>
</html>