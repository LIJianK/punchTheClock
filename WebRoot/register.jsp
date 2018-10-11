<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<title>注册</title>
</head>
<body>
	<form id="frm" name="frm" action="doRegister.jsp" method="post" onsubmit="return f();">
	<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
	<table border="1" width="750" align="center"> 
		<tr	bgcolor="green" align="center">
			<td colspan="2">注册账号</td>
		</tr>
		
		<tr>
			<td>用户名</td>
			<td>
				<input type="text" name="userName" id="userName" onblur="ff();"/><label id="1" style="display:none"><font color="red">该用户名已被使用！</font></label><label id="2" style="display:none"><font color="green">可以使用！</font></label>
			</td>
		</tr>
		<tr>
			<td>昵称</td>
			<td>
				<input type="text" name="nickName" id="nickName" onblur="fg();"/><label id="3" style="display:none"><font color="red">该昵称已被使用！</font></label><label id="4" style="display:none"><font color="green">可以使用！</font></label>
			</td>
		</tr>
		<tr>
			<td>设置密码</td>
			<td>
				<input type="password" name="pwd1" id="pwd1" />
			</td>
		</tr>
		<tr>
			<td>确认密码</td>
			<td>
				<input type="password" name="pwd2" id="pwd2" />
			</td>
		</tr>
		<tr>
			<td></td>
			<td>
				<input type="submit" value="注册" ></input>
				<input type="reset" value="重置" ></input>
				&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="button" value="返回" onclick="history.go(-1);return false;"></input>
			</td>
		</tr>
	</table>
	</form>
</body>
<script type="text/javascript">
	function f(){
		//var userName=document.getElementById("userName").value;
		//var nickName=document.getElementById("nickName").value;
		var password1=document.getElementById("pwd1").value;
		var password2=document.getElementById("pwd2").value;
		if(password1==""||password1==null){
			alert('请输入密码');
			document.getElementById("pwd1").focus();
			document.getElementById("pwd1").style.borderColor='red';
			return false;
		}else if(password2!=password1){
			alert('第二次输入密码与第一次不同！');
			document.getElementById("pwd2").focus();
			document.getElementById("pwd2").style.borderColor='red';
			return false;
		}
		
	return true;

	}
	
	var xmlHttp;
	
	function createXMLHttpRequest(){
		if(window.ActiveXObject){
			xmlHttp = new ActiveXObject("Microsoft.XMLHtp");
		}else{
			xmlHttp = new XMLHttpRequest();
		}
	}
	
	function ff(){
		var userName = document.getElementById("userName").value;
		//alert(userName);
		if(userName==""||userName==null){
			alert('用户名不能为空');
			document.getElementById("userName").focus();
			document.getElementById("1").style.display="none";
  			document.getElementById("2").style.display="none";
			document.getElementById("userName").style.borderColor='red';
			return false;
		}
		
		createXMLHttpRequest();
		xmlHttp.open("post","doUserNameAjax.jsp",true);
		xmlHttp.onreadystatechange=readyStateChange;
  		xmlHttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
  		//发送数据
  		var userNameStr = "userName="+userName;
  		//alert(userNameStr);
  		xmlHttp.send(userNameStr);
	}
	
	function readyStateChange(){
  		if(xmlHttp.readyState==4&&xmlHttp.status==200){
  			var info=xmlHttp.responseText;
  			//alert(info);
  			if("1"==info){
  				document.getElementById("1").style.display="none";
  				document.getElementById("2").style.display="block";
  				document.getElementById("userName").style.borderColor='green';
  			}else if("0"==info){
  				document.getElementById("1").style.display="block";
  				document.getElementById("2").style.display="none";
  				document.getElementById("userName").focus();
  				document.getElementById("userName").style.borderColor='red';
  			}
  		}
  	}
	
	function fg(){
		var nickName=document.getElementById("nickName").value;
		
		if(nickName==""||nickName==null){
			alert('请输入昵称');
			document.getElementById("nickName").focus();
			document.getElementById("3").style.display="none";
  			document.getElementById("4").style.display="none";
			document.getElementById("nickName").style.borderColor='red';
			return false;
		}
		
		createXMLHttpRequest();
		xmlHttp.open("post","doNickNameAjax.jsp",true);
		xmlHttp.onreadystatechange=readyStateChange1;
  		xmlHttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
  		//发送数据
  		var nickNameStr = "nickName="+nickName;
  		//alert(userNameStr);
  		xmlHttp.send(nickNameStr);
	}
	
	function readyStateChange1(){
  		if(xmlHttp.readyState==4&&xmlHttp.status==200){
  			var info=xmlHttp.responseText;
  			//alert(info);
  			if("1"==info){
  				document.getElementById("3").style.display="none";
  				document.getElementById("4").style.display="block";
  				document.getElementById("nickName").style.borderColor='green';
  			}else if("0"==info){
  				document.getElementById("3").style.display="block";
  				document.getElementById("4").style.display="none";
  				document.getElementById("nickName").focus();
  				document.getElementById("nickName").style.borderColor='red';
  			}
  		}
  	}
</script>
</html>