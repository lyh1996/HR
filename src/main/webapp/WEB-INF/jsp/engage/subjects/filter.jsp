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
		<link rel="stylesheet" href="css/table.css" type="text/css" />
		<link rel="stylesheet" type="text/css" media="all"
			href="javascript/calendar/calendar-win2k-cold-1.css">
		<script type="text/javascript" src="javascript/calendar/cal.js"></script>
		<script type="text/javascript" src="javascript/comm/jquery-1.12.4.js"></script>
		<script type="text/javascript">
		//一级试题发生改变
		$(document).ready(
				function() {
					$("#FirstKind").change(
						function() {
							$.post("findInfoByFirstKindQuestion/"+ $(this).val(),
									function(json) {
											var obj =$.parseJSON(json);
												$("#SecondKind").html("");
													for (var i = 0; i < obj.length; i++) {
																var second = obj[i];
																$("#SecondKind").append("<option value='"+second.second_kind_id+"/"+second.second_kind_name+"'>"+second.second_kind_id+"/"+second.second_kind_name+"</option>");
																	}
																});
											});
						});
		</script>
		<script type="text/javascript">
			function toquerylist()
			{
				document.forms[0].action = document.forms[0].action + "?operate=toquerylist";
				document.forms[0].submit();
			}
		</script>
		
		<title>无标题文档</title>
		<script type="text/javascript">		
			
	
		</script>
	</head>

	<body>
		<form method="post" action="engagesubjects.do">
			<table width="100%">
				<tr>
					<td>
						<font color="#0000CC">您正在做的业务是:人力资源--招聘管理--招聘考试题库管理--试题查询</font>
					</td>
				</tr>
				<tr>
					<td>
						<div align="right">
							<input type="button" value="开始" class="BUTTON_STYLE1" onclick="toquerylist()">
						</div>
					</td>
				</tr>
			</table>
			<table width="100%" border="1" cellpadding=0 cellspacing=1
				bordercolorlight=#848284 bordercolordark=#eeeeee
				class="TABLE_STYLE1">
				<tr>
					<td width="20%" class="TD_STYLE1">
						请选择试题分类
					</td>
					<td class="TD_STYLE2">														
						<select Class="SELECT_STYLE1"
							name="first_kind_name" id="FirstKind" multiple="multiple" onclick="" style="width: 290;height: 100">
							<option value="0/null" selected="selected">--请选择--</option>
							<c:forEach items="${ list }" var="list">
							<option value="${list.first_kind_id}/${list.first_kind_name}">${list.first_kind_id }/${list.first_kind_name }</option>
						</c:forEach>
						</select> 												
						<select name="second_kind_name" multiple="multiple" onclick="" style="width: 290;height: 100" id="SecondKind">
							<option value="0/null" selected="selected">--请选择--</option>
						</select>
					</td>
				</tr>
				<tr>
				</tr>
				<tr>
					<td class="TD_STYLE1">
						请输入登记时间
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