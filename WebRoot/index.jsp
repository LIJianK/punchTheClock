<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<HTML>
<HEAD>
	<TITLE>欢迎来到小打卡！</TITLE>
</HEAD>
<style type="text/css">
	*{
		margin:0px;
	}
</style>

<body>
  	<table width="100%" height="100%">
  		<tr height="90%">
  			<td colspan="5">
  				<iframe src="homePage/doFindAllCircleInHomePage.jsp" width="100%" height="100%" name="yqr"></iframe>
  			</td>
  		</tr>
  		<tr height="10%" align="center"  bgcolor="#D9D9D" >
  			<td>
  					<a href="homePage/doFindAllCircleInHomePage.jsp" target="yqr" style="line-height:100px;text-decoration:none;display:inline-block; width: 100%;height:100%;">首页</a>
  			</td>
  			<td>
					<a href="discovery/doFindCircleType.jsp" target="yqr" style="line-height:100px;text-decoration:none;display:inline-block; width: 100%;height:100%;">发现</a>
			</td>
			<td>
	  				<a href="circle/doCircle.jsp" target="yqr" style="line-height:100px;text-decoration:none;display:inline-block; width: 100%;height:100%;">圈子</a>
  			</td>
  			<td>
	  				<a href="message/postAndReceive.jsp" style="line-height:100px;text-decoration:none;display:inline-block; width: 100%;height:100%;" target="yqr">消息</a>
  			</td>
  			<td> 
	  				<a href="mine/selectMine.jsp" style="line-height:100px;text-decoration:none;display:inline-block; width: 100%;height:100%;" target="yqr">我的</a>
  			</td>
  		</tr>
  	</table>  
</body>

</HTML>

