<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="com.pro.domain.CircleType"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
	<head>
		<title>添加圈子</title>
	</head>
<%
	List<CircleType> ctList = (List<CircleType>)request.getAttribute("ctList");
	
%>	

	<body>
		<form action="doAddCircle.jsp" method="post">
			<table align="center">
				<tr>
					<td>
						圈子名称
					</td>
					<td>
						<input type="text" name="circleName"/>
					</td>
				</tr>
				<tr>
					<td>
						圈子描述
					</td>
					<td>
						<input type="text" name="circleValue"/>
					</td>
				</tr>
				<tr>
					<td>
						圈子类型
					</td>
					<td>
						<select name="typeId">
							<% for(int i = 0; i < ctList.size(); i++)
								{
								CircleType ct = ctList.get(i);
							%>
						<option value="<%=ct.getTypeId() %>">
									<%=ct.getTypeName() %>
								</option>
							<%
							}
							%>
						</select>
					</td>
				</tr>
				<tr>
					<td>
					</td>
					<td>
						<input value="提交" type="submit" />
						<input value="取消" type="reset" />
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>