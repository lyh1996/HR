<%@ page contentType="text/html; charset=UTF-8" language="java" import="java.util.*"
	errorPage=""%>
	<%@ page isELIgnored="false"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" href="css/table.css" type="text/css" >
		<link rel="stylesheet" type="text/css" media="all"
			href="javascript/calendar/calendar-win2k-cold-1.css">
		<script type="text/javascript" src="javascript/calendar/cal.js"></script>
		<script type="text/javascript" src="javascript/comm/comm.js"></script>
		<script type="text/javascript" src="javascript/comm/jquery-1.12.4.js"></script>
		<script type="text/javascript">
 		function getlist()
		{
			document.forms[0].action = document.forms[0].action + "?operate=list&method=change";
			document.forms[0].submit();
		}
		function search()
		{
			document.forms[0].action = document.forms[0].action + "?operate=toSearch&method=change";
			document.forms[0].submit();
		}
 		</script>
	<script type="text/javascript">
//一级机构发生改变
	$(document).ready(
			function() {
				$("#FirstKind").change(
					function() {
						$.post("findInfoByFirstKind/"+ $(this).val(),
								function(json) {
										var obj =$.parseJSON(json);
											$("#SecondKind").html("");
											$("#SecondKind").append("<option value='0/0' selected='selected'></option>");
												for (var i = 0; i < obj.length; i++) {
															var second = obj[i];
															$("#SecondKind").append("<option value='"+second.second_kind_id+"/"+second.second_kind_name+"'>"+$("#FirstKind").val()+"/"+second.second_kind_name+"</option>");
																}
															});
										});
					});
					//二级机构发生改变
	$(document).ready(
			function() {
				$("#SecondKind").change(
					function() {
						//alert($("#SecondKind").val());
						$.post("findInfoByFirstKind/"+$("#FirstKind").val()+"?SecondName="+$("#SecondKind").val(),
								function(json) {
										var obj =$.parseJSON(json);
											$("#ThirdKind").html("");
											$("#ThirdKind").append("<option value='0/0' selected='selected'></option>");
												for (var i = 0; i < obj.length; i++) {
															var third = obj[i];
															$("#ThirdKind").append("<option value='"+third.third_kind_id+"/"+third.third_kind_name+"'>"+$("#FirstKind").val()+"/"+$("#SecondKind").val()+"/"+third.third_kind_name+"</option>");
																}
															});
										});
					});
					
	//职位分类发生改变
	$(document).ready(
			function() {
				$("#MajorKind").change(
					function() {
						$.post("findInfoByMajorKind/"+ $(this).val(),
								function(json) {
										var obj =$.parseJSON(json);
											$("#majorName").html("");
											$("#majorName").append("<option value='0/0' selected='selected'></option>");
												for (var i = 0; i < obj.length; i++) {
															var major = obj[i];
															$("#majorName").append("<option value='"+major.major_id+"/"+major.major_name+"'>"+$("#MajorKind").val()+"/"+major.major_name+"</option>");
																}
															});
										});
					});
					
</script>
	</head>

	<body>
		<form action="humanfile.do" method="post">
			<table width="100%">
				<tr>
					<td>
						<font color="#0000CC">您正在做的业务是：人力资源--人力资源档案管理--人力资源档案变更 </font>
					</td>
				</tr>
				<tr>
					<td align="right">
						<input type="button" value="开始"
							class="BUTTON_STYLE1" onclick="javascript:getlist();">
						<input type="button" value="搜索"
							class="BUTTON_STYLE1" onclick="search();">
					</td>
				</tr>
			</table>
			<table width="100%" border="1" cellpadding=0 cellspacing=1
				bordercolorlight=#848284 bordercolordark=#eeeeee
				class="TABLE_STYLE1">
				<tr class="TR_STYLE1">
					<td width="16%" class="TD_STYLE1">
						请选择员工所在I级机构
					</td>
					<td width="84%" class="TD_STYLE2">
							<select Class="SELECT_STYLE2"
							name="first_kind_name" id="FirstKind" size="5">
							<option value="0/0" selected="selected"></option>
							<c:forEach items="${ list_first }" var="configfilefirstkinds">
							<option value="${configfilefirstkinds.firstKindId}/${configfilefirstkinds.firstKindName}">${configfilefirstkinds.firstKindName }</option>
						</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<td class="TD_STYLE1">
						请选择员工所在II级机构
					</td>
					<td width="84%" class="TD_STYLE2">
						 <select Class="SELECT_STYLE2" name="second_kind_name"  id="SecondKind" size="5">
						 <option value="0/0" selected="selected"></option>
						 <c:forEach items="${ list_second }" var="configfilesecondtkinds">
							<option value="${configfilesecondtkinds.second_kind_id}/${configfilesecondtkinds.second_kind_name}">${configfilesecondtkinds.second_kind_name }</option>
						</c:forEach>
						</select>
					</td>
				</tr>
				<tr class="TR_STYLE1">
					<td width="16%" class="TD_STYLE1">
						请选择员工所在III级机构
					</td>
					<td width="84%" class="TD_STYLE2">
						 <select  Class="SELECT_STYLE2"
							name="third_kind_name" id="ThirdKind" size="5">
							<option value="0/0" selected="selected"></option>
							<c:forEach items="${ list_third }" var="third">
							<option value="${third.third_kind_id}/${third.third_kind_name}">${third.third_kind_name }</option>
						</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<td class="TD_STYLE1">
						请选择职位分类
					</td>
					<td width="84%" class="TD_STYLE2">
						 <select Class="SELECT_STYLE2"
							name="human_major_kind_name"  id="MajorKind" size="5">
							<option value="0/0" selected="selected"></option>
							<c:forEach items="${ list_major_kind }" var="configfilemajorkinds">
							<option value="${configfilemajorkinds.major_kind_id}/${configfilemajorkinds.major_kind_name}">${configfilemajorkinds.major_kind_name }</option>
						</c:forEach>
						</select>
					</td>
				</tr>
				<tr class="TR_STYLE1">
					<td width="16%" class="TD_STYLE1">
						请选择职位名称
					</td>
					<td width="84%" class="TD_STYLE2">
						<select Class="SELECT_STYLE2"
							name="human_major_name"  id="majorName" size="5">
							<option value="0/0" selected="selected"></option>
							<c:forEach items="${ list_major }" var="configfilemajors">
							<option value="${configfilemajors.major_id}/${configfilemajors.major_name}">${configfilemajors.major_name }</option>
						</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<td class="TD_STYLE1">
						请输入建档时间
					</td>
					<td width="84%" class="TD_STYLE2">
						<input type="text" name="startTime" class="INPUT_STYLE2" id="date_start"  style="width:14% "/>至
						<input type="text" name="endTime" class="INPUT_STYLE2" id="date_end"  style="width:14% "/>
						（YYYY-MM-DD）
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
<iframe  width=0 height=0></iframe>
