<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="com.pro.domain.CircleType"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
	<head>
		<title>修改圈子</title>
	</head>


	<body>
		<form action="doUpdateCircle.jsp" method="post">
			<table align="center">
				<tr>
					<td>
						圈子名称
					</td>
					<td>
						<input type="hidden" name="circleId" value="${circle.circleId}"/>
						<input type="text" name="circleName" value="${circle.circleName}"/>
					</td>
				</tr>
				<tr>
					<td>
						圈子描述
					</td>
					<td>
						<input type="text" name="circleValue" value="${circle.circleValue}"/>
					</td>
				</tr>
				<tr>
					<td>
						圈子类型
					</td>
					<td>
						<select name="typeId">
							<c:forEach items="${ctList}" var="ct">
							
							<option value="${ct.typeId}" 
						${circle.circleType.typeId==ct.typeId?'selected':''}>
									${ct.typeName}
								</option>
								</c:forEach>
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