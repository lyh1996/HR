<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
 
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath %>"> 
 
<title>jb-aptech毕业设计项目</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="css/style.css" rel="stylesheet" type="text/css">
<script src="script/common.js"></script>
	<script type="text/javascript" src="javascript/comm/jquery-1.12.4.js"></script>
</head>
  	<script type="text/javascript">
  		function myAdd(){
  			if($("#RName").val()==""){
  				alert("角色名不能为空！");
  				return false;
  			}
  			if($("#RDesc").val()==""){
  				alert("角色描述不能为空！");
  				return false;
  			}
  			if(confirm("确定要提交吗？")==true){
  				document.forms[0].action = document.forms[0].action + "?operate=doAdd" ;
  				document.forms[0].submit();
  			}
  		}
  	
  	</script>
  <body>
   	<div><font color="#0000CC">您正在做的业务是：人力资源--权限管理--角色管理--添加角色 </font></div>
   	<form  method="post" action="right.do">
	   	<div class="button_bar">
	   		<input type="button" value="返回" class="common_button" onclick="history.back();">
			<button class="common_button" onclick="myAdd();" type="submit">保存</button>
	   	</div>
	   	<table class="data_list_table">
	   		<tr>
	   			<th>编号</th>
	   			<td>
	   				<input type="text" name="role.roleId" size="20" value="自动增长" readonly="readonly">	   				
	   			</td>
	   			<th>角色名</th>
	   			<td>
	   				<input type="text" name="RName" size="20" value="" id="RName">
	   			</td>
	   		</tr>
	   		<tr>
	   			<th>角色描述</th>
	   			<td>
	   				<textarea name="RDesc" cols="20" rows="3" id="RDesc"></textarea>
	   			</td>
	   			<th>状态</th>
	   			<td>正常
	   			<input type="hidden" name="RFlag" value="1">
	   			</td>
	   		</tr>
	   	</table>
	</form>
  </body>
</html>
