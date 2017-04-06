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
		<link rel="stylesheet" href="css/table.css"
			type="text/css"></link>
			<script type="text/javascript">
			function search()
			{
				document.forms[0].action = document.forms[0].action + "?operate=toSearch";
				document.forms[0].submit();
			}
			</script>
	</head>
	

	<body>
		<form action="salarygrant.do" method="post">
			<table width="100%">
				<tr>
					<td>
						<font color="#0000CC">您正在做的业务是：人力资源--薪酬发放管理--薪酬发放登记</font>
					</td>
				</tr>
				<tr>
					<td align="right">
					<input type="button" value="确定" class="BUTTON_STYLE1" onclick="javascript:search();">
					</td>
				</tr>
			</table>
			<table width="100%" border="1" cellpadding=0 cellspacing=1
				bordercolorlight=#848284 bordercolordark=#eeeeee
				class="TABLE_STYLE1">
				<tr>
					<td width="27%" class="TD_STYLE1">
						薪酬发放方式
					</td>
					<td width="22%" class="TD_STYLE1">
						<select class="INPUT_STYLE2"   name="attribute_name">
						   <c:forEach items="${ list }" var="list">
							<option value="${list.attribute_name }">${list.attribute_name }</option>
						</c:forEach>
						</select>
					</td>
					<td width="60%" class="TD_STYLE1"></td>
			</table>
		</form>
	</body>
</html>