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
			function doRead(id)
			{
				document.forms[0].action = document.forms[0].action + "?operate=doRead&id=" + id;
				document.forms[0].submit();
			}
</script>
	</head>
	<body>
		<form method="post" action="engageAnswer.do">
			<table width="100%">
				<tr>
					<td>
						<font color="#0000CC">您正在做的业务是:人力资源--招聘管理--招聘考试管理--考试阅卷</font>
					</td>
				</tr>
				<tr>
					<td>
						&nbsp;
					</td>
				</tr>
				
			</table>
			<table width="100%" border="1" cellpadding=0 cellspacing=1
				bordercolorlight=#848284 bordercolordark=#eeeeee
				class="TABLE_STYLE1">
				<tr>
					<td width="17%" class="TD_STYLE1">
						<span>姓名</span>
					</td>
					<td width="17%" class="TD_STYLE1">
						<span>身份证号</span>
					</td>
					<td width="15%" class="TD_STYLE1">
						<span>职位分类名称</span>
					</td>
					<td width="20%" class="TD_STYLE1">
						<span>职位名称</span>
					</td>
					<td width="20%" class="TD_STYLE1">
						<span>测试时间</span>
					</td>
					<td width="5%" class="TD_STYLE1">
						<span>阅卷</span>
					</td>
				</tr>
				<c:forEach items="${list }" var="list">
					<tr class="TD_STYLE2">
						<td>
							${list.human_name }
						</td>
						<td>
							${list.human_idcard }
						</td>
						<td>
							${list.major_kind_name }
						</td>
						<td>
							${list.major_name }
						</td>
						<td>
							${list.test_time }
						</td>
						<td>
						<a href="javascript:doRead('${list.answer_number}')">阅卷</a>
						</td>
					</tr>				
					</c:forEach>
			</table>
		</form>
	</body>
</html>
