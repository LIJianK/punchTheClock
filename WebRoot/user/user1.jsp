<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.pro.domain.User"%>
<%@page import="java.util.List"%>
<%@page import="com.pro.domain.Circle"%>
<%@page import="com.pro.domain.Punch"%>
<html>
<head>
<title>用户信息</title>
</head>
<body>
<%
	User user = (User)request.getAttribute("user");
	String followCount = (String)request.getAttribute("followCount");
	String fansCount = (String)request.getAttribute("fansCount");
	List<Circle> myCircleList = (List<Circle>)request.getAttribute("myCircleList");
	List<Punch> punchList = (List<Punch>)request.getAttribute("punchList");
%>
	<div id="userInformation"  align="center" style="background-color:#33FFFF;">
		<h3 align="center" ><%=user.getNickName() %></h3>
		<font color="#CACACA" ><label >账户ID：<%=user.getUserId() %></label></font>
		<input type="hidden" name="userId" id="userId" value="<%=user.getUserId() %>" />
		<table align="center" width="300">
			<tr >
				<td width="25%" align="right">
					关注：
				</td>
				<td width="25%" align="left" id="followCount">
					<%=followCount %>
				</td>
				<td width="25%" align="right">
					粉丝：
				</td>
				<td width="25%" align="left" id="fansCount">
					<%=fansCount %>
				</td>
			</tr>
		</table>
	</div><hr/>
	
	
	<div id="userCircle" >
	关注的圈子:
		<table align ="center" >
			<tr align="center" height="100">
<%
	for(int i = 0;i<myCircleList.size();i++){
		Circle circle = myCircleList.get(i);	
%>
				<td width="90">
					<a href="../circle/doCirclePunch.jsp?circleId=<%=circle.getCircleId() %>" style="text-decoration:none"><font size="4" color="green"><%=circle.getCircleName() %></font></a>
				</td>
<% 
	}
%>
			</tr>
		</table>	
	</div><hr/>
	
	
	<div id="userPunch">
	打卡日记：	
	<br/>
<%
	for(int i=0;i<punchList.size();i++){
		Punch punch = punchList.get(i);
		String feel = "";
		if(punch.getPunchFeel()==1){
			feel = "满级开心";
		}else if(punch.getPunchFeel()==2){
			feel = "一般";
		}else if(punch.getPunchFeel()==3){
			feel = "平静";
		}else if(punch.getPunchFeel()==4){
			feel = "不开心";
		}
%>		
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color="#CACACA">-----------------------------------------------------------------------------</font>
		<table align ="center" width="90%">
			<tr>
				<td >
					&nbsp;&nbsp;&nbsp;<font color="#CACACA">在</font><a href="../circle/doCirclePunch.jsp?circleId=<%=punch.getCircle().getCircleId() %>" style="text-decoration:none"><font size="4" color="green"><%=punch.getCircle().getCircleName() %></font></a><font color="#CACACA">的打卡：</font>
				</td>
			</tr>
			<tr>
				<td >
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=punch.getPunchMsg() %>
				</td>
			</tr>
			<tr>
				<td >
					&nbsp;&nbsp;&nbsp;<font color="#CACACA" size="1.5"><%=feel %>&nbsp;&nbsp;&nbsp;<%=punch.getPunchTime() %></font>
				</td>
			</tr>
		</table>
<%
	}
%>	
	</div><hr/>
	
	
	<div align="center" id="1" style="display:block;height:30px;background-color:#FAA5DA;" onclick="f();">
		<font><label >关注</label></font>
		
	</div>
	<div align="center" id="2" style="display:none;height:30px;background-color:#DDDDDD;" onclick="g();">
		<font><label >取消关注</label></font>
	</div>
</body>
<script type="text/javascript">
	
	var xmlHttp;
	
	function createXMLHttpRequest(){
		if(window.ActiveXObject){
			xmlHttp = new ActiveXObject("Microsoft.XMLHtp");
		}else{
			xmlHttp = new XMLHttpRequest();
		}
	}
	
	function f(){
		//alert(1);
		
		var userId = document.getElementById("userId").value;
		var userIdStr = "userId="+userId;
		
		createXMLHttpRequest();
		xmlHttp.open("post","doFollowAjax.jsp",true);
		xmlHttp.onreadystatechange=readyStateChange;
  		xmlHttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
  		xmlHttp.send(userIdStr);
	}
	
	function readyStateChange(){
 		if(xmlHttp.readyState==4&&xmlHttp.status==200){
	  			document.getElementById("1").style.display="none";
				document.getElementById("2").style.display="block";
				var fansCount = parseFloat(document.getElementById("fansCount").innerHTML)+1;
				document.getElementById("fansCount").innerHTML = fansCount;
  			}
  	}
  	
	function g(){
		//alert(1);
		
		var userId = document.getElementById("userId").value;
		var userIdStr = "userId="+userId;
		
		createXMLHttpRequest();
		xmlHttp.open("post","doNoFollowAjax.jsp",true);
		xmlHttp.onreadystatechange=readyStateChange1;
  		xmlHttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
  		xmlHttp.send(userIdStr);
	}
	
	function readyStateChange1(){
 		if(xmlHttp.readyState==4&&xmlHttp.status==200){
	  			document.getElementById("1").style.display="block";
				document.getElementById("2").style.display="none";
				var fansCount = parseFloat(document.getElementById("fansCount").innerHTML)-1;
				document.getElementById("fansCount").innerHTML = fansCount;
  			}
  	}
</script>
</html>