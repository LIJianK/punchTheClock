<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="com.pro.domain.CircleType"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
	<head>
		<title>添加圈子</title>
	</head>

	<body>
		<h2 align="center">
			我创建的圈子
		</h2>
		<table width="100%">
			<tr>
				<td>
					圈子名称
				</td>
				<td>
					圈子描述
				</td>
				<td>
					圈子类型
				</td>
				<td>
					圈子人數
				</td>
				<td>
					操作
				</td>
			</tr>
			<c:forEach items="${cList}" var="circle">
				<tr>
					<td>
						<input type="hidden" value="${circle.circleId}" />
						<a
							href="doFindUserOfFollowTheCircle.jsp?circleId=${circle.circleId}">${circle.circleName}</a>
					</td>
					<td>
						${circle.circleValue}
					</td>
					<td>
						${circle.circleType.typeName}
					</td>
					<td>
						${circle.followCount}
					</td>
					<td>
						<a href="doFindCircle.jsp?circleId=${circle.circleId}">修改</a>/
						<a href="#" onclick="deleteFollow(${circle.circleId});">删除</a>
					</td>
				</tr>
			</c:forEach>
		</table>
	</body>
<script type="text/javascript">
var xmlHttp;
var countId;

function createXMLHttpRequest() {
	if (window.ActiveXObject) {
		xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
	} else {
		xmlHttp = new XMLHttpRequest();
	}
}

function deleteFollow(v) {

	if(confirm('确认是否删除？\n(注：删除后打卡记录全都没有)')){
			//创建核心对象
	//alert('1');
	createXMLHttpRequest();
	//alert('1');
	countId = v;
	var url = "doDeleteCircle.jsp";
	var date = "circleId=" + v;

	//alert(v);
	xmlHttp.onreadystatechange = handlerReadyStateChange1;
	xmlHttp.open("post", url, true);

	xmlHttp.setRequestHeader("Content-type",
			"application/x-www-form-urlencoded");
	xmlHttp.send(date);
		
	}else{
		return false;
	}
}

function handlerReadyStateChange1() {
	//alert(xmlHttp.readyState);
	if (xmlHttp.readyState == 4) {
		//	alert(xmlHttp.status);
		if (xmlHttp.status == 200) {
			var info = xmlHttp.responseText;
			alert(info);
			window.location.href="doSelfCircle.jsp";
		}
	}
}
</script>
</html>