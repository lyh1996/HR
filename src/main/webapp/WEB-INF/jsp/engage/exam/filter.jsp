<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>

		<link rel="stylesheet" href="css/table.css"
			type="text/css"></link>
			<link rel="stylesheet" type="text/css" media="all"
			href="javascript/calendar/calendar-win2k-cold-1.css">
		<script type="text/javascript" src="javascript/calendar/cal.js"></script>
		<script type="text/javascript">
			function toquerylist()
			{
				document.forms[0].action = document.forms[0].action + "?operate=tofilterlist";
				document.forms[0].submit();
			}
		</script>
	</head>

	<body>
		<form method="post" action="engageAnswer.do">
			<table width="100%">
				<tr>
					<td>
						<font color="#0000CC">您正在做的业务是：人力资源--招聘管理--招聘考试管理--考试成绩筛选</font>
					</td>
				</tr>
				<tr>
					<td>
						<div align="right">
							<input type="button" value="查询" class="BUTTON_STYLE1" onclick="toquerylist()">
						</div>
					</td>
				</tr>
			</table>
			<table width="100%" border="1" cellpadding=0 cellspacing=1
				bordercolorlight=#848284 bordercolordark=#eeeeee
				class="TABLE_STYLE1">
				
				<tr>
					<td class="TD_STYLE1" width="15%">
						身份证号码
					</td>
					<td class="TD_STYLE2" width="35%"> 
						<input type="text" name="human_idcard" class="INPUT_STYLE2">
					</td>
					<td class="TD_STYLE2" > 
						&nbsp
					</td>
				</tr>
				<tr>
					<td class="TD_STYLE1">
						请输入关键字 (应试者姓名)
					</td>
					<td class="TD_STYLE2" >
						<input class="INPUT_STYLE2" name="human_name">
					</td>
					<td class="TD_STYLE2" > 
						&nbsp
					</td>
				</tr>
				<tr>
					<td class="TD_STYLE1">
						请输入应试时间
					</td>
					<td class="TD_STYLE2">
						<input type="text" name="start_time" value="" class="INPUT_STYLE1" id="date_start">
						至
						<input type="text" name="end_time" value="" class="INPUT_STYLE1" id="date_end">
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
