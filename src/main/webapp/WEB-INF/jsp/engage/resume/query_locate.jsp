<%@ page contentType="text/html; charset=UTF-8" language="java" import="java.util.*"
	errorPage=""%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<link rel="stylesheet" href="css/table.css" type="text/css">
		<link rel="stylesheet" type="text/css" media="all"
			href="javascript/calendar/calendar-win2k-cold-1.css">
		<script type="text/javascript" src="javascript/calendar/cal.js"></script>
		<script type="text/javascript" src="javascript/comm/comm.js"></script>
		<script type="text/javascript" src="javascript/comm/jquery-1.12.4.js"></script>
		<script type="text/javascript">
			function doQuery()
			{
				document.forms[0].action = document.forms[0].action + "?operate=list&method=query&pageNow=1";
				document.forms[0].submit();
			}
		</script>
		<script type="text/javascript">
			//职位分类发生改变
			$(document).ready(
					function() {
						$("#MajorKind").change(
							function() {
								$.post("findInfoByMajorKind/"+ $(this).val(),
										function(json) {
												var obj =$.parseJSON(json);
													$("#majorName").html("");
														for (var i = 0; i < obj.length; i++) {
																	var major = obj[i];
																	$("#majorName").append("<option value='"+major.major_name+"'>"+major.major_name+"</option>");
																		}
																	});
												});
							});						
		</script>
	</head>

	<body>
		<form action="engageresume.do" method="post">
			<table width="100%">
				<tr>
					<td>
						<font color="#0000CC">您正在做的业务是：人力资源--招聘管理--简历管理--有效简历查询 </font>
					</td>
				</tr>
				<tr>
					<td align="right">
						<input type="button" class="SUBMIT_STYLE1" value="查询"
							onclick="javascript:doQuery();">
					</td>
				</tr>
			</table>
			
			<table class="TABLE_STYLE1" width="100%">
				<tr  class="TR_STYLE1">
					<td class="TD_STYLE1" width="20%">
						请选择职位分类
					</td>
					<td width="80%" class="TD_STYLE2">
						 <select Class="SELECT_STYLE2"
							name="human_major_kind_name"  id="MajorKind" size="5">
							<c:forEach items="${ list }" var="configfilemajorkinds">
							<option value="${configfilemajorkinds.major_kind_id}/${configfilemajorkinds.major_kind_name}">${configfilemajorkinds.major_kind_name }</option>
						</c:forEach>
						</select>
						
						<select Class="SELECT_STYLE2"
							name="human_major_name"  id="majorName" size="5">
							
						</select>
					</td>
				</tr>
				<tr>
					<td class="TD_STYLE1" width="20%" >
						请输入登记时间
					</td>
					<td width="80%" class="TD_STYLE2">
						<input type="text" name="startTime" class="INPUT_STYLE2" id="date_start"  style="width:14% "/>至
						<input type="text" name="endTime" class="INPUT_STYLE2" id="date_end"  style="width:14% "/>
						（YYYY-MM-DD）
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>

<script type="text/javascript">
Calendar.setup ({inputField : "date_start", ifFormat : "%Y-%m-%d", showsTime : false, button : "date_start", singleClick : true, step : 1});
Calendar.setup ({inputField : "date_end", ifFormat : "%Y-%m-%d", showsTime : false, button : "date_end", singleClick : true, step : 1});
</script>
