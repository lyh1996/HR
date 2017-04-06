<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
 <base href="<%=basePath%>">
<title>jb-aptech毕业设计项目</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="style.css" rel="stylesheet" type="text/css">
<script src="script/common.js"></script>
<script src="script/validate.js"></script>
</head>
  
  <body>
   	<div><font color="#0000CC">您正在做的业务是：人力资源--权限管理--用户管理--查看用户 </font></div>

	   	<div class="button_bar">
	   		<button class="common_button" onclick="window.location.href='rightAction!findAllUser.action'">返回</button>
	   	</div>
	   	<input type="hidden" name="user.UTrueName"/>
	   	<table class="data_list_table">
	   		<tr>
	   			<th>真实姓名</th>
	   			<td><s:property value="#request.u.UTrueName"/>
	   			</td>
	   			<th>用户名</th>
	   			<td>
	   				<s:property value="#request.u.UName"/>
	   			</td>
	   		</tr>
	   		<tr>
	   			<th>密码</th>
	   			<td>
	   				<s:property value="#request.u.UPassword"/>
	   			</td>
	   			<th>
	   				状态
	   			</th>
	   			<td>
	   				<s:if test="#request.u.UFlag==1">正常</s:if>
	   				<s:else>禁用</s:else>
	   			</td>
	   		</tr>
	   		<tr>
	   			<th>角色</th>
	   			<td><s:property value="#request.u.hrRole.RName"/>
	   			</td>
	   		</tr>
	   	</table>
 
  </body>
</html>
