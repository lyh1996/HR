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
 
<title>jb-aptech毕业设计项目</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="css/style.css" rel="stylesheet" type="text/css">
<script src="script/common.js"></script>
<script type="text/javascript" src="javascript/comm/jquery-1.12.4.js"></script>
</head>
  	<script type="text/javascript">
  		function myAdd(){
  			 
  			if($("#RId").val()==0){
  				alert("请选择角色！");
  				return false;
  			}	
  			
  			if(confirm("确定要提交吗？")==true){
  				document.forms[0].action = document.forms[0].action + "?operate=doUserEdit" ;
  				document.forms[0].submit();
  			}
  		}
  		 
  	</script>
  <body>
   	<div><font color="#0000CC">您正在做的业务是：人力资源--权限管理--用户管理--编辑用户 </font></div>
   	<form  method="post" action="right.do">
	   	<div class="button_bar">
	   	<input type="button" value="返回" class="common_button" onclick="history.back();">
			<button class="common_button" onclick="return myAdd();" type="button">保存</button>
	   	</div>
	   	<input type="hidden" name="UId" value="${huser.UId }">
	   	<table class="data_list_table">
	   		<tr>
	   			<th>真实姓名</th>
	   			<td><input name="UTrueName" value="${huser.UTrueName }"readonly="readonly"/>
	   			</td>
	   			<th>用户名</th>
	   			<td>
	   				<input type="text" name="UName" size="20" value="${huser.UName }" readonly="readonly">
	   			</td>
	   		</tr>
	   		<tr>
	   			<th>密码</th>
	   			<td>
	   				<input type="password" name="UPassword" size="20" value="${huser.UPassword }"  readonly="readonly">
	   			</td>
	   			<th>角色</th>
	   			<td>
	   			<select name="RId"  id="RId">
	   					<option value="0">--请选择--</option>
	   					<c:forEach var="r" items="${hrRolesList }">
	   						<option value="${r.RId }">${r.RName}</option>
	   					</c:forEach>
	   				</select>
	   			</td>
	   		</tr>
	   	</table>
   	</form>
  </body>
</html>
