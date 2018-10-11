<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="com.pro.domain.CircleType"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
	<head>
		<title>圈子关注的人</title>
	</head>

	<body>
		<h2 align="center">
			圈子：${circle.circleName }&nbsp;
		</h2>加入人数:${followCount}
				<hr>
		<table width="500" align="center">
			<tr>
				<td>
					关注此圈的用户
				</td>
				<td>
					操作
				</td>
			</tr>
			<c:forEach items="${userList}" var="user">
				<tr>
					<td>
						${user.nickName}
					</td>
					<td>
						<a href="#" onclick="removeFollower(${user.userId});">移除</a>
					</td>
				</tr>
			</c:forEach>
		</table>
	</body>
	<script type="text/javascript">
var xmlHttp;

function createXMLHttpRequest() {
	if (window.ActiveXObject) {
		xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
	} else {
		xmlHttp = new XMLHttpRequest();
	}
}

function removeFollower(v) {
	//创建核心对象
	//alert('1');
	if (confirm('确定移除？')) {
		createXMLHttpRequest();
		//alert('1');
		var url = "doAjaxRemoveFollower.jsp";
		var date = "userId=" + v;

		//	alert(v);
		xmlHttp.onreadystatechange = handlerReadyStateChange;
		xmlHttp.open("post", url, true);

		xmlHttp.setRequestHeader("Content-type",
				"application/x-www-form-urlencoded");
		xmlHttp.send(date);
	} else {
		return false;
	}

}

function handlerReadyStateChange() {
	//alert(xmlHttp.readyState);
	if (xmlHttp.readyState == 4) {
		//	alert(xmlHttp.status);
		if (xmlHttp.status == 200) {
			var info = xmlHttp.responseText;
			alert(info);
			window.location.reload();
			//	if(info=="已关注"){}
			//	else{window.location.href="doFindCircleType.jsp";}
		}
	}
}
</script>
</html>