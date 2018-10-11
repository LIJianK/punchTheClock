<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="com.pro.domain.CircleType"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
	<head>
		<title>发现圈子</title>
	</head>
	<body>
		<h2	align="center">所有圈子</h2>
		<table width="100%" border="1">
				<tr align="center">
					<td>
						圈子名称
					</td>
					<td>
						圈子描述
					</td>
					<td>
						圈主
					</td>
					<td>
						加入人数
					</td>
					<td>
						操作
					</td>
				</tr>
				<c:forEach items="${cList}" var="circle">
				<tr align="center">
					<td>
						${circle.circleName}
					</td>
					<td>
						${circle.circleValue}
					</td>
					<td>
						${circle.user.nickName}
					</td>
					<td id="${circle.circleId}">
						${circle.followCount}
					</td>
					<td>
						<a href="#" onclick="requestGet(${circle.circleId});">加入圈子</a>/
						<a href="#" onclick="deleteFollow(${circle.circleId});">退圈</a>
					</td>
				</tr>
				</c:forEach>
			</table>
	</body>
<script type="text/javascript">
	var xmlHttp;
	var countId;
	
	function createXMLHttpRequest(){
		if(window.ActiveXObject){
			xmlHttp=new ActiveXObject("Microsoft.XMLHTTP");
		}else{
			xmlHttp=new XMLHttpRequest();
		}
	 }
	
	function requestGet(v){
		//创建核心对象
		//alert('1');
		createXMLHttpRequest();
		//alert('1');
		countId = v;
		var url = "doAddUserCircleInHomePage.jsp";
		var date = "circleId="+v;
				
		//alert(v);
		xmlHttp.onreadystatechange=handlerReadyStateChange;
		xmlHttp.open("post", url,true);
		
		xmlHttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xmlHttp.send(date);
	}
	
	function handlerReadyStateChange(){
		//alert(xmlHttp.readyState);
		if(xmlHttp.readyState==4){
		//	alert(xmlHttp.status);
			if(xmlHttp.status==200){
				var info=xmlHttp.responseText;
				alert(info);
				if(info=="已加入圈子"){}
				else{//window.location.href="doFindCircleType.jsp";
			//	alert(document.getElementById(countId).innerHTML+1);
					document.getElementById(countId).innerHTML=parseInt(document.getElementById(countId).innerHTML)+1;
				}
			}
		}
	}
	
	function deleteFollow(v){
		//创建核心对象
		//alert('1');
		createXMLHttpRequest();
		//alert('1');
		countId = v;
		var url = "doDeleteUserCircleInHomePage.jsp";
		var date = "circleId="+v;
				
		//alert(v);
		xmlHttp.onreadystatechange=handlerReadyStateChange1;
		xmlHttp.open("post", url,true);
		
		xmlHttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xmlHttp.send(date);
	}

	function handlerReadyStateChange1(){
		//alert(xmlHttp.readyState);
		if(xmlHttp.readyState==4){
		//	alert(xmlHttp.status);
			if(xmlHttp.status==200){
				var info=xmlHttp.responseText;
				alert(info);
				if(info=="成功退圈"){
					//window.location.href="doFindCircleType.jsp";
					document.getElementById(countId).innerHTML=parseInt(document.getElementById(countId).innerHTML)-1;
				}
				else{}
			}
		}
	}
</script>
</html>