<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath %>"> 
 
<title>HR</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="css/style.css" rel="stylesheet" type="text/css">
<script src="script/common.js"></script>
<script type="text/javascript" src="javascript/comm/jquery-1.12.4.js"></script>
</head>
  	<script type="text/javascript">
	function myAdd(){
			 
			if($("#RDesc").val()==""){
				alert("请填写角色名称！");
				return false;
			}	
			
			if(confirm("确定要提交吗？")==true){
				document.forms[0].action = document.forms[0].action + "?operate=doRoleEdit" ;
				document.forms[0].submit();
			}
		}
  	</script>
  <body>
   	<div><font color="#0000CC">您正在做的业务是：人力资源--权限管理--角色管理--编辑角色 </font></div>
   	<form  method="post" action="right.do">
	   	<div class="button_bar">
	   		<input type="button" value="返回" class="common_button" onclick="history.back();">
			<button class="common_button" onclick="return myAdd();" type="button">保存</button>
	   	</div>
	   	<table class="data_list_table">
	   		<tr>
	   			<th>编号</th>
	   			<td>
	   				<input type="text" name="RId" size="20" value="${list.RId }"readonly="readonly">
	   			</td>
	   			<th>角色名</th>
	   			<td>
	   				<input type="text" name="RName" size="20" value="${list.RName }">
	   			</td>
	   		</tr>
	   		<tr>
	   			<th>角色描述</th>
	   			<td>
	   				<textarea name="RDesc" cols="20" rows="3" id="RDesc">${list.RDesc }</textarea>
	   			</td>
	   			<th>状态</th>
	   			<td>
	   				<select name="RFlag">
	   					<option value="1">正  常</option>
	   					<option value="0">禁  用</option>
	   				</select>
	   				
	   			</td>
	   		</tr>
	   	</table>
	   	</form>
  </body>
</html>

