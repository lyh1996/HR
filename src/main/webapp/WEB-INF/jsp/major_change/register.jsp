<%@ page contentType="text/html; charset=UTF-8" language="java" errorPage="" %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<%@ page import="java.util.*"%> <!-- //获取系统时间必须导入的  -->
<%@ page import="java.text.*"%> <!-- //获取系统时间必须导入的  -->
<%
	//添加基底网址(只使用.jsp页面)
	String path = request.getContextPath();//doubanTeacher
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<html>
	<head>
	<base href="<%=basePath%>">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" href="css/table.css" type="text/css" >
		<link rel="stylesheet" type="text/css" media="all"
			href="javascript/calendar/calendar-win2k-cold-1.css" >
		<script type="text/javascript" src="javascript/calendar/cal.js" charset="utf-8"></script>
		<script type="text/javascript" src="javascript/comm/comm.js" charset="utf-8"></script>
		<script type="text/javascript" src="javascript/comm/jquery-1.12.4.js"></script>
 <script type="text/javascript">
	function tick() {
		var now = new Date();
		var hours, minutes, seconds, noon;
		var intHours, intMinutes, intSeconds;
		intHours = now.getHours();
		intMinutes = now.getMinutes();
		intSeconds = now.getSeconds();
		if (intHours < 24) {
			hours = intHours+":";
			noon = "A.M.";
		} else {
			intHours = intHours - 24;
			hours = intHours + ":";
			noon = "P.M.";
		}
		if (intMinutes < 10) {
			minutes = "0"+intMinutes+":";
		} else {
			minutes = intMinutes+":";
		}
		if (intSeconds < 10) {
			seconds = "0"+intSeconds+" ";
		} else {
			seconds = intSeconds+" ";
		}
		timeString = hours+minutes+seconds;
		var now = new Date();
	  	document.getElementById("nowTime").value=now.getFullYear()+"-"+(now.getMonth()+1)+"-"+now.getDate()+" "+timeString;
		window.setTimeout("tick();", 1000);
	}
	
	//load事件
	function check(){
		//获得系统当前时间的方法
	  	tick();					
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
											$("#SecondKind").append("<option value='1/软件公司'>请选择II级机构</option>");
												for (var i = 0; i < obj.length; i++) {
															var second = obj[i];
															$("#SecondKind").append("<option value='"+second.second_kind_id+"/"+second.second_kind_name+"'>"+second.second_kind_id+"/"+second.second_kind_name+"</option>");
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
											$("#ThirdKind").append("<option value='1/外包组'>请选择III级机构</option>");
												for (var i = 0; i < obj.length; i++) {
															var third = obj[i];
															$("#ThirdKind").append("<option value='"+third.third_kind_id+"/"+third.third_kind_name+"'>"+third.third_kind_id+"/"+third.third_kind_name+"</option>");
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
											$("#majorName").append("<option value='1/区域经理'>请选择职位名称</option>");
												for (var i = 0; i < obj.length; i++) {
															var major = obj[i];
															$("#majorName").append("<option value='"+major.major_id+"/"+major.major_name+"'>"+major.major_id+"/"+major.major_name+"</option>");
																}
															});
										});
					});
					
</script>
	</head >
	<body onload="check()">
		<form method="post" action="majorchange.do">
			<table width="100%">
				<tr>
					<td>
						<font color="#0000CC">您正在做的业务是：人力资源--调动管理--调动登记</font>
					</td>
				</tr>
				<tr>
					<td align="right">
						<input type="submit" value="提交"/>
						<input type="button" value="返回" class="BUTTON_STYLE1" onclick="history.back();">
					</td>
				</tr>
			</table>
			<table width="100%" border="1" cellpadding=0 cellspacing=1
				bordercolorlight=#848284 bordercolordark=#eeeeee
				class="TABLE_STYLE1">
				<tr>
					<td class="TD_STYLE1" width="11%">
						档案编号
					</td>
					<td colspan="7"  width="%" class="TD_STYLE1">
						 <input type="text" name="human_id" class="INPUT_STYLE2" value=" ${list.human_id}" readonly="readonly">
					<input type="hidden"  name="salary_sum" value="${list.salary_sum}"/>
					</td>
				</tr>
				<tr>
					<td class="TD_STYLE1" width="11%">
						原I级机构
					</td>
					<td width="14%" class="TD_STYLE2">
			 <input type="text" name="first_kind_name" class="INPUT_STYLE2" value="${list.first_kind_id }/${list.first_kind_name }" readonly="readonly">
						
					</td>
					<td width="11%" class="TD_STYLE1">
						原II级机构
					</td>
					<td width="16%" class="TD_STYLE2">
					<input type="text" name="second_kind_name" class="INPUT_STYLE2" value="${list.second_kind_id }/${list.second_kind_name }" readonly="readonly">
						
					</td>
					<td width="11%" class="TD_STYLE1">
						原III级机构
					</td>
					<td width="18%" class="TD_STYLE2">
					<input type="text" name="third_kind_name" class="INPUT_STYLE2" value="${list.third_kind_id }/${list.third_kind_name }" readonly="readonly">
						  
						  
					</td>
					<td width="11%" class="TD_STYLE1">
						姓名
					</td>
					<td width="14%" class="TD_STYLE2">
					<input type="text" name="human_name" class="INPUT_STYLE2" value="${list.human_name } " readonly="readonly">
						  
					</td>
				</tr>
				<tr>
					<td class="TD_STYLE1">
						原职位分类
					</td>
					<td class="TD_STYLE2">
					<input type="text" name="major_kind_name" class="INPUT_STYLE2" value="${list.human_major_kind_id }/${list.human_major_kind_name }" readonly="readonly">
						 
					</td>
					<td class="TD_STYLE1">
						原职位名称
					</td>
					 <td class="TD_STYLE2">
					  <input type="text" name="major_name" class="INPUT_STYLE2" value="${list.human_major_id }/${list.human_major_name }" readonly="readonly">
						 
					</td>
					 <td class="TD_STYLE1">
						原薪酬标准
					</td>
					 <td class="TD_STYLE2" >
					 <input type="text" name="salary_standard_name" class="INPUT_STYLE2" value="${list.salary_standard_id }/${list.salary_standard_name }" readonly="readonly">
						 
					</td>
					<td class="TD_STYLE1">
						&nbsp;
					</td>
					<td class="TD_STYLE2">
						&nbsp;
					</td>
				</tr>
				<tr>
					 <td class="TD_STYLE1" width="11%">
						新I级机构
					</td>
					<td width="14%" class="TD_STYLE2">
						<select Class="SELECT_STYLE1"
							name="new_first_kind_name" id="FirstKind">
							<option value="1/集团">重新选择I级机构</option>
							<c:forEach items="${ list_first }" var="configfilefirstkinds">
							<option value="${configfilefirstkinds.firstKindId}/${configfilefirstkinds.firstKindName}">${configfilefirstkinds.firstKindId }/${configfilefirstkinds.firstKindName }</option>
						</c:forEach>
						</select>
					</td>
					<td width="11%" class="TD_STYLE1">
						新II级机构
					</td>
					<td width="14%" class="TD_STYLE2">
						<select Class="SELECT_STYLE1" name="new_second_kind_name"  id="SecondKind">
						</select>
					</td>
					<td width="11%" class="TD_STYLE1">
						新III级机构
					</td>
					<td class="TD_STYLE2" >
						<select  Class="SELECT_STYLE1"
							name="new_third_kind_name" id="ThirdKind">
						</select>
					</td>
					<td class="TD_STYLE1">
						&nbsp;
					</td>
					<td class="TD_STYLE2">
						&nbsp;
					</td>
				</tr>
				<tr>
					 <td class="TD_STYLE1">
						新职位分类
					</td>
					<td class="TD_STYLE2">
						<select Class="SELECT_STYLE1"
							name="new_major_kind_name"  id="MajorKind">
							<option value="1/销售">重新选择职位分类</option>
							<c:forEach items="${ list2 }" var="configfilemajorkinds">
							<option value="${configfilemajorkinds.major_kind_id}/${configfilemajorkinds.major_kind_name}">${configfilemajorkinds.major_kind_id }/${configfilemajorkinds.major_kind_name }</option>
						</c:forEach>
						</select>
					</td>
					<td class="TD_STYLE1">
						新职位名称
					</td>
					<td class="TD_STYLE2">
						<select Class="SELECT_STYLE1"
							name="new_major_name"  id="majorName">
						</select>
					</td>
					<td class="TD_STYLE1">
						新薪酬标准
					</td>
					<td class="TD_STYLE2">
						<select Class="SELECT_STYLE1"
							name="new_salary_standard_name">
							<option value="0/未定义">0/未定义</option>
							<c:forEach items="${ standards }" var="standards">
							<option value="${standards.standard_id}/${standards.standard_name }">${standards.standard_id }/${standards.standard_name }</option>
						</c:forEach>
						</select>
					</td>
					<td class="TD_STYLE1">
						&nbsp;
					</td>
					<td class="TD_STYLE2">
						&nbsp;
					</td>
				</tr>
				<tr>
				<td class="TD_STYLE1">
						登记人
					</td>
					<td class="TD_STYLE2">
						<input type="text" name="register" class="INPUT_STYLE2"
							value="${user}" readonly="true" />
					</td>
					<td class="TD_STYLE1">
						登记时间
					</td>
					<td class="TD_STYLE2">
					<input type="text" name="regist_time" class="INPUT_STYLE2" id="nowTime"
						 readonly="true"/>
					</td>
					<td class="TD_STYLE1">
						&nbsp;
					</td>
					<td class="TD_STYLE2">
						&nbsp;
					</td>
					<td class="TD_STYLE1">
						&nbsp;
					</td>
					<td class="TD_STYLE2">
						&nbsp;
					</td>
				</tr>
				<tr>
					<td class="TD_STYLE1">
						调动原因
					</td>
					<td colspan="7" class="TD_STYLE2">
							<textarea name="change_reason"
						class="TEXTAREA_STYLE1" rows="4"></textarea>
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

<!-- <iframe  width=0 height=0></iframe> -->
