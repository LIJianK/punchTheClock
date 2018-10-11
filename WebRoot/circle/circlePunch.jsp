<%@page import="com.pro.domain.Punch"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="com.pro.domain.CircleType"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
	<head>
		<title>圈子日记</title>
	</head>
<body>
<font size="4" color="green">${circleName }圈子的内容：</font><br/><hr/>
	<c:forEach items="${punchList}" var="punch">
		
		<div style="height:auto;width:auto;">
			&emsp;&emsp;<a href="../user/findUser.jsp?userId=${punch.user.userId }" style="text-decoration:none"><font color="#FF6100" size="4">
			${punch.user.nickName }</font></a>的打卡:
			<br/><br/>&emsp;&emsp;&emsp;&emsp;<font size="4">${punch.punchMsg }</font><br/><br/>
			&emsp;&emsp;<font color="grey" size="2">（打卡时间${punch.punchTime }）</font>
			<button onclick="replyPunch(${punch.punchId });">评论</button><hr/><br/>
			
		</div>
		
		<div id="replyDiv" style="display:none;position:absolute;height:auto;width:auto;left:100;margin-top:50px">
				<textarea name="punchMsg" style="width:100%; height:75;font-size:15px;color:green;resize:none;"
					 onfocus="if(value=='评论他的打卡记录吧'){value=''}"
								 onblur="if (value ==''){value='评论他的打卡记录吧'}">评论他的打卡记录吧</textarea>
				<button onclick="sendReply();">发送</button>
				<button onclick="hidDiv(${punch.punchId });">取消</button>
		</div>
		
	</c:forEach>
	
	
	
</body>
<script type="text/javascript">
	
	function replyPunch(v){
		document.getElementById("replyDiv").style.display="block";
	}
	
	function hidDiv(v){
		document.getElementsByName("punchMsg").value="评论他的打卡记录吧";
		document.getElementById("replyDiv").style.display="none";
	}
	
</script>
</html>












