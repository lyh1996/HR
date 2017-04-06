<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
	<base href="<%=basePath %>">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" href="css/table.css" type="text/css" />
		<link rel="stylesheet" type="text/css" media="all"
			href="javascript/calendar/calendar-win2k-cold-1.css">
		<script type="text/javascript" src="javascript/calendar/cal.js"></script>
		<title>无标题文档</title>
		<script type="text/javascript">
			function toquerylist()
			{
				document.forms[0].action = document.forms[0].action + "?operate=toquerylist";
				document.forms[0].submit();
			}
		</script>
	</head>

	<body>
		<form method="post" action="salarygrant.do">
			<table width="100%">
				<tr>
					<td>
						<font color="#0000CC">您正在做的业务是:人力资源管理--薪酬发放管理--薪酬发放查询</font>
					</td>
				</tr>
				<tr>
					<td>
						<div align="right">
							<input type="button" value="查询" class="BUTTON_STYLE1"  onclick="javascript:toquerylist()">
							<input type="reset" value="重置" class="BUTTON_STYLE1">
						</div>
					</td>
				</tr>
			</table>
			<table width="100%" border="1" cellpadding=0 cellspacing=1
				bordercolorlight=#848284 bordercolordark=#eeeeee
				class="TABLE_STYLE1">
				<tr>
					<td width="20%" class="TD_STYLE1">
						请输入薪酬单号
					</td>
					<td class="TD_STYLE2">
						<input type="text"  name="salary_grant_id" class="INPUT_STYLE1" />
					</td>
				</tr>
				<tr>
					<td class="TD_STYLE1">
						请输入发放时间
					</td>
					<td class="TD_STYLE2">
						<input type="text"  name="startTime"  class="INPUT_STYLE1"  Id="date_start"/>
						至
						<input type="text"  name="endTime"  class="INPUT_STYLE1"  Id="date_end"/>
						(YYYY-MM-DD)
					</td>
				</tr>
			</table>
		</form>
	</body>
	<script type="text/javascript">
	Calendar.setup ({inputField : "date_start", ifFormat : "%Y-%m-%d", showsTime : false, button : "date_start", singleClick : true, step : 1});
	Calendar.setup ({inputField : "date_end", ifFormat : "%Y-%m-%d", showsTime : false, button : "date_end", singleClick : true, step : 1});
	</script>
</html>
