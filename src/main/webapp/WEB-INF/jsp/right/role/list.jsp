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
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link href="css/style.css" rel="stylesheet" type="text/css">
		
	</head>
	<script type="text/javascript">
		 
		
		function toDel(id){
  			if(window.confirm("你确定要删除 吗？")){
  				window.location.href="rightAction!delRole.action?RId="+id;
  			}
  		}
		function toEdit(id){
			document.forms[0].action = document.forms[0].action + "?operate=toEditRole&RId="+id;
			document.forms[0].submit();
  		}
		function toDispact(id){
			document.forms[0].action = document.forms[0].action + "?operate=toDispact&RId="+id;
			document.forms[0].submit();
  		}
		function toQuery(id){
  				window.location.href="rightAction!delRole.action?RId="+id;
  		}
		function toAdd(){
			document.forms[0].action = document.forms[0].action + "?operate=toAdd" ;
			document.forms[0].submit();
		}
	
	</script>
	<body>
		  <div><font color="#0000CC">您正在做的业务是：人力资源--权限管理--角色管理 </font></div>
		<form name="sysRoleForm"  method="post" action="right.do">
			<div class="button_bar">
				<button class="common_button"
					onclick="toAdd()">
					新建
				</button>
			 
			</div>
			<table class="data_list_table" >
				<tr>
					<th>
						编号
					</th>
					<th>
						角色名
					</th>
					<th>
						角色描述
					</th>
					<th>
						状态
					</th>
					<th>
						操作
					</th>
				</tr>
				 <c:forEach items="${list }" var="r">
					<tr align="center">
						<td class="TD_STYLE2">
							${r.RId}
						</td>
						<td class="TD_STYLE2">
							  ${ r.RName}
						</td>
						<td>
						 ${r.RDesc}
						</td>
						<td class="TD_STYLE2">
						<c:choose>
							<c:when test="${r.RFlag== 0}">
      								禁用
    						</c:when>
							<c:when test="${r.RFlag ==1}">
       								正常
   							 </c:when>
	   						</c:choose>
						</td>
						<td class="list_data_op">
						
							<img onclick="toEdit(${r.RId})" title="编辑" src="images/bt_edit.gif" class="op_button" />&nbsp;&nbsp;
							<img onclick="toDispact(${r.RId})" title="分配权限" src="images/bt_linkman.gif" class="op_button" />&nbsp;&nbsp;
						</td>
					</tr>
					 </c:forEach>
			</table>
		</form>
	</body>
</html>

