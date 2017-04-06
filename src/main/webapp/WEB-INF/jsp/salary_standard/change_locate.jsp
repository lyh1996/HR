<%@ page contentType="text/html; charset=UTF-8" language="java"
	errorPage=""%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" href="css/table.css" type="text/css" />
		<link rel="stylesheet" type="text/css" media="all"
			href="javascript/calendar/calendar-win2k-cold-1.css">
		<script type="text/javascript" src="javascript/calendar/cal.js"></script>
		<script type="text/javascript" src="javascript/comm/jquery-1.12.4.js"></script>
		<script type="text/javascript" src="javascript/comm/comm.js"></script>
		<script type="text/javascript">
		function doChangeQuery(checkStatus)
		{
			document.forms[0].action = document.forms[0].action + "?operate=doChangeQuery&check_status="+checkStatus;
			document.forms[0].submit();
		}
</script>
	</head>

	<body>
		<form method="post" action="salarystandard.do">
			<table width="100%">
				<tr>
					<td>
						<font color="#0000CC">您正在做的业务是:人力资源管理--薪酬标准管理--薪酬标准变更</font>
					</td>
				</tr>
				<tr>
					<td align="right">
						<input type="button" value="开始" class="BUTTON_STYLE1"
							onclick="javascript:doChangeQuery(1);">
					</td>
				</tr>
			</table>
			<table width="100%" border="1" cellpadding=0 cellspacing=1
				bordercolorlight=#848284 bordercolordark=#eeeeee
				class="TABLE_STYLE1">
				<tr>
					<td width="20%" class="TD_STYLE1">
						请输入薪酬标准编号
					</td>
					<td class="TD_STYLE2">
						<input type="text" id="standard_id" name="standard_id" class="INPUT_STYLE1">
					</td>
				</tr>
				<tr>
				</tr>
				<tr>
					<td class="TD_STYLE1">
						请输入登记时间
					</td>
					<td class="TD_STYLE2">
						<input type="text" name="time_first" value="" class="INPUT_STYLE1" id="date_start">
						至
						<input type="text" name="time_second" value="" class="INPUT_STYLE1" id="date_end">
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
