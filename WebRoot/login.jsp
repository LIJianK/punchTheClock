<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<title>登录</title>
</head>
<body>
	<form id="frm" name="frm" action="doLogin.jsp" method="post" onsubmit="return f();">
	<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
	<table border="1" width="500" align="center"> 
		<tr	bgcolor="blue" align="center">
			<td colspan="2">登录</td>
		</tr>
		
		<tr>
			<td>用户名</td>
			<td>
				<input type="text" name="userName" id="userName" />
			</td>
		</tr>
		<tr>
			<td>密码</td>
			<td>
				<input type="password" name="pwd" id="pwd" />
			</td>
		</tr>
		<tr>
			<td></td>
			<td>
				<input type="submit" value="登录" ></input>
				<input type="reset" value="重置" ></input>
				&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="button" value="注册" onclick="window.location.href='register.jsp'"></input>
			</td>
		</tr>
	</table>
	</form>
</body>
<script type="text/javascript">
	function f(){
		var userName=document.getElementById("userName").value;
		var password=document.getElementById("pwd").value;
		if(userName==""||userName==null){
			alert('用户名不能为空');
			document.getElementById("userName").focus();
			document.getElementById("userName").style.borderColor='red';
			return false;
		}else if(password==""||password==null){
			alert('请输入密码');
			document.getElementById("pwd").focus();
			document.getElementById("pwd").style.borderColor='red';
			return false;
		}
		
	return true;

	}
</script>
</html>