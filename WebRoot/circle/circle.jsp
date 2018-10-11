<%@page import="java.util.Random"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>圈子</title>
	<script type="text/javascript" src="../js/json2.js"></script>
</head>
<%
	Date day = new Date();
	SimpleDateFormat time = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd");
	/* 	Random random=new Random();
		int colorId = random.nextInt(3)+1; */
%>
<body>
	<a href="doSelfCircle.jsp">我创建的圈子</a>
	<a href="doFindCircleType.jsp">创建圈子</a>
	<hr/>
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
					操作
				</td>
			</tr>
			<tr>
				<td>
					&nbsp;
				</td>
			</tr>
		<c:forEach items="${notPunchCircleList}" var="circle">
			<tr>
				<td>
					<a href="doCirclePunch.jsp?circleId=${circle.circleId}" >${circle.circleName}</a>
				</td>
				<td>
					${circle.circleValue}
				</td>
				<td>
					${circle.circleType.typeName}
				</td>
				<td>
					<input type="button" id="${circle.circleId }" title="未打卡" onclick="punchThis(this);return false;" value="打卡"/>
				</td>
			</tr>
			</c:forEach>

		<c:forEach items="${punchCircleList}" var="circle">
			<tr>
				<td>
					<a href="doCirclePunch.jsp?circleId=${circle.circleId}&circleName=${circle.circleName}" >${circle.circleName}</a>
				</td>
				<td>
					${circle.circleValue}
				</td>
				<td>
					${circle.circleType.typeName}
				</td>
				<td>
					<input type="button" id="${circle.circleId }" title="已打卡" value="已打卡"/>
				</td>
			</tr>
			</c:forEach>
	</table>
	<!-- <a href="#" id="5" onmouseover="punchThis(this);requestPost1();return false;" onmouseout="hidDiv();">打卡</a> -->

<div id="punchDiv"
		style="border:3px solid black;position:absolute;height:280;width:450;margin-left:350;display:none;">
	<form action="">
		<table width="100%" border="0">
			<tr>
				<td align="center" bgcolor="#D9D9D" height="40">
				<input type="hidden"  id="punchTime" name="punchTime" value="<%=date.format(day) %>">
				日记时间：<%=time.format(day)%>
				</td>
			</tr>
			<tr>
				<td  height="40">日记内容：</td>
			</tr>
			<tr>
				<td height="100">
			<!-- 	<textarea id="punchMsg" name="punchMsg" style="width: 100%; height:100%;resize:none;font-size:15px; color:green;">
				</textarea> -->
				<textarea id="punchMsg" name="punchMsg" style="width: 100%; height:100%;resize:none;font-size:15px; color:green;"
					 onfocus="if(value=='今天也是元气满满的一天'){value=''}"
   					 onblur="if (value ==''){value='今天也是元气满满的一天'}">今天也是元气满满的一天</textarea>
				</td>
			</tr>
			<tr>
				<td height="50"  bgcolor="#D9D9D">
					现在的心情：
						<input type="radio" value="1" name="ck" id="ck1" checked>
					<a href="#" style="text-decoration:none;" id="a1" onclick="checkThis(this);return false;">满级开心</a>
						<input type="radio" value="1" name="ck" id="ck2">
					<a href="#" style="text-decoration:none;" id="a2" onclick="checkThis(this);return false;">一般开心</a>
						<input type="radio" value="1" name="ck" id="ck3">
					<a href="#" style="text-decoration:none;" id="a3" onclick="checkThis(this);return false;">平静</a>
						<input type="radio" value="1" name="ck" id="ck4">
					<a href="#" style="text-decoration:none;" id="a4" onclick="checkThis(this);return false;">不开心</a>
				</td>
			</tr>
			<tr>
				<td align="center" height="40">
					<input type="button" onclick="isEmpty();requestPost();" value="打卡">
					<input type="button" onclick="resetDiv();"; value="取消" >
				</td>
			</tr>
		</table>
	</form>
</div>
<div style="position:absolute;margin-left:850;display:none;"id="suDiv" >
	<font size="10" color="red">打卡成功</font>
</div>

<!-- <div style="margin-top:550;margin-left:850;display:none;"id="faildDiv" >
	<font size="10" color="red">打过卡了</font>
</div> -->

</body>
</html>

<script type="text/javascript">

	function isEmpty(){
		var ck = document.getElementsByName('ck');
		var punchMsg = document.getElementById('punchMsg').value;
		if(punchMsg==null||punchMsg==""){
			document.getElementById('punchMsg').focus();
			return false;
		}
	}
	
	function resetDiv(){
		var ck = document.getElementsByName('ck');
		document.getElementById('punchMsg').value="今天也是元气满满的一天";
		//document.getElementById("punchTime").value=null;
		for(var i=0;i<ck.length;i++){
			if(ck[i].checked){
				ck[i].checked=false;
			}
			ck[0].checked=true;
		}
		document.getElementById("punchDiv").style.display="none";
	}
		
	function checkThis(v){
		var aId = v.getAttribute('id');
		switch(aId){
			case "a1":document.getElementById("ck1").checked=true;break;
			case "a2":document.getElementById("ck2").checked=true;break;
			case "a3":document.getElementById("ck3").checked=true;break;
			case "a4":document.getElementById("ck4").checked=true;break;
		}
	}
	
	var circleId=0;
	
	function punchThis(v){
		circleId = v.getAttribute('id');
		document.getElementById("punchDiv").style.display="block";
		//document.getElementById('punchMsg').focus();
	}
	
	var xmlHttp;

	function createXMLHttpRequest(){
		if(window.ActiveXObject){
			xmlHttp = new ActiveXObject("Microsoft.XMLHtp");
		}else{
			xmlHttp = new XMLHttpRequest();
		}
	}
	
	function requestPost(){
		var ck = document.getElementsByName('ck');
		var punchMsg = document.getElementById('punchMsg').value;
		var punchTime = document.getElementById("punchTime").value;
	
		var i=0;
		for(i=0;i<ck.length;i++){
			if(ck[i].checked){
				break;
			}
		}
		
		var punchDate = {
			"punchFeel":ck[i].value,
			"punchMsg":punchMsg,
			"punchTime":punchTime,
			"circle":{"circleId":circleId},
			"user":{"userId":1},
			
		}
		createXMLHttpRequest();
		var url = "doPunchAjax2.jsp";
		var date = "punchDate="+JSON.stringify(punchDate);
		
		xmlHttp.onreadystatechange=handlerReadyStateChange;
		xmlHttp.open("post", url,true);
		
		xmlHttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xmlHttp.send(date);
	}
	
	function handlerReadyStateChange(){
		if(xmlHttp.readyState==4){
			if(xmlHttp.status == 200){
					document.getElementById("punchDiv").style.display="none";
					document.getElementById("suDiv").style.display="block";
					document.getElementById(circleId).value="已打卡";
					setTimeout(function(){document.getElementById("suDiv").style.display="none";},1000);
			}
		}
	}
	
</script>







