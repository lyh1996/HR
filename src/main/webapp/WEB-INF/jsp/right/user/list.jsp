<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">


<link href="css/style.css" rel="stylesheet" type="text/css">
</head>
<script type="text/javascript">

function toDispact(id){
	document.forms[0].action = document.forms[0].action + "?operate=toUserDispact&UId="+id;
	document.forms[0].submit();
	}
	
	function mySearch() {
		document.forms[0].action = document.forms[0].action + "?operate=toUser";
		document.forms[0].submit();
	}

	function del(id) {
		if (window.confirm("你确定要删除 吗？")) {
			window.location.href = "right.do?operate=toUserDel&UId="+id;
		}
	}
	
	function toAdd(){
		document.forms[0].action = document.forms[0].action + "?operate=toAddUser" ;
		document.forms[0].submit();
	}
	
	function toEdit(id){
		document.forms[0].action = document.forms[0].action + "?operate=toUserEdit&UId="+id;
		document.forms[0].submit();
		}
</script>
<body>

	<div>
		<font color="#0000CC">您正在做的业务是：人力资源--权限管理--用户管理 </font>
	</div>
	<form name="sysUserForm" method="post" action="right.do">
		<input type="hidden" name="method" value="userForward">
		<div class="button_bar">
			<button class="common_button"
				onclick="toAdd()">新建</button>
			<button class="common_button" onclick="mySearch();">查询</button>
		</div>
		<table class="data_list_table">
			<tr>
				<th>用户名</th>
				<td><input type="text" name="UName" size="20" id="usrName">
				</td>
			</tr>
		</table>
		<br />
		<table width="100%" border="1" cellpadding=0 cellspacing=1
			bordercolorlight=#848284 bordercolordark=#eeeeee
			class="data_list_table">
			<tr>
				<th class="TD_STYLE1">编号</th>
				<th class="TD_STYLE1">用户名</th>
				<th class="TD_STYLE1">真实姓名</th>
				<th class="TD_STYLE1">角色</th>
				<th class="TD_STYLE1">操作</th>
			</tr>
			<c:forEach var="u" items="${list }">

				<tr align="center">
					<td class="TD_STYLE2">${u.UId}</td>
					<td class="TD_STYLE2">${u.UName}</td>
					<td class="TD_STYLE2">${u.UTrueName}</td>
					<td class="TD_STYLE2"><c:choose>
							<c:when test="${u.hrRole==null }">
							暂无
						</c:when>
							<c:otherwise>
							${u.hrRole.RName }
						</c:otherwise>
						</c:choose></td>
					 
					<td class="list_data_op">
					<img title="编辑" src="images/bt_edit.gif" class="op_button"  onclick="toEdit(${u.UId})" /> 
						<img title="指派" onclick="toDispact(${u.UId})"  src="images/bt_linkman.gif" class="op_button" /> 
						<!-- <img title="查看"
						src="images/bt_deal.gif" class="op_button" />  -->
						<img title="删除" src="images/bt_del.gif" class="op_button" onclick="del(${u.UId})" /></td>
				</tr>
			</c:forEach>
		</table>
	</form>
</body>
</html>
