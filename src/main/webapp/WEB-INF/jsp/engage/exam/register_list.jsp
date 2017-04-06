<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>

		<link rel="stylesheet" href="css/table.css"
			type="text/css"></link>
			<script type="text/javascript">
		function toRegister()
		{
			document.forms[0].action = document.forms[0].action + "?operate=toRegister";
			document.forms[0].submit();
		}
		</script>
	</head>

	<body >
		<form method="post" action="engageExam.do">
			<table width="100%">
				<tr>
					<td>
						<font color="#0000CC">您正在做的业务是:人力资源--招聘管理--招聘考试管理--考试出题</font>
					</td>
				</tr>
				<tr>
					<td align="right">
						<input type="button" value="出题" class="BUTTON_STYLE1"
							onclick="toRegister()">
					</td>
				</tr>
				
			</table>
			<table width="100%" border="1" cellpadding=0 cellspacing=1
				bordercolorlight=#848284 bordercolordark=#eeeeee
				class="TABLE_STYLE1">
				<tr>
					<td width="17%" class="TD_STYLE1">
						<span>职位分类名称</span>
					</td>
					<td width="20%" class="TD_STYLE1">
						<span>职位名称</span>
					</td>
					<td width="20%" class="TD_STYLE1">
						<span>套题数量</span>
					</td>
				</tr>
				<c:forEach items="${list }" var="exam">
					<tr class="TD_STYLE2">
						<td>
						${exam.major_kind_name }
						</td>
						<td>
						${exam.major_name }
						</td>
						<td>
						${exam.totalCount }
						</td>
					</tr>
				</c:forEach>
			</table>
		 
		</form>
	</body>
</html>
