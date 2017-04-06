<%@ page contentType="text/html; charset=UTF-8" language="java"  errorPage=""%>
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
		 <link rel="stylesheet" href="css/table.css" type="text/css"> 
		<link rel="stylesheet" type="text/css" media="all"
			href="javascript/calendar/calendar-win2k-cold-1.css">
		<script type="text/javascript" src="javascript/calendar/cal.js" charset="utf-8"></script>
		<script type="text/javascript" src="javascript/comm/comm.js" charset="utf-8"></script>
		<script type="text/javascript" src="javascript/comm/jquery-1.12.4.js"></script>
<% 
	String datetime=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(Calendar.getInstance().getTime()); //获取系统时间 
	request.setAttribute("currentTime",datetime);
%>
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
															$("#SecondKind").append("<option value='"+second.second_kind_id+"/"+second.second_kind_name+"'>"+second.second_kind_name+"</option>");
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
															$("#ThirdKind").append("<option value='"+third.third_kind_id+"/"+third.third_kind_name+"'>"+third.third_kind_name+"</option>");
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
															$("#majorName").append("<option value='"+major.major_id+"/"+major.major_name+"'>"+major.major_name+"</option>");
																}
															});
										});
					});
					
</script>
	</head>
	<body>
		<form method="post" action="engagemajorrelease.do">
			<table width="100%">
				<tr>
					<td>
						<font color="#0000CC">您正在做的业务是：人力资源--招聘管理--职位发布管理--职位发布登记 </font>
					</td>
				</tr>
				<tr>
					<td align="right">
						<tr>
					<td align="right">
						<input type="button" value="添加" class="BUTTON_STYLE1" onclick="javascript:toSubmit()"> 
						<input type="reset" value="清除" class="BUTTON_STYLE1">
					</td>
				</tr>
			</table>
			<table class="TABLE_STYLE1" border="1" width="100%" cellpadding=0
				cellspacing=1 bordercolorlight=#848284 bordercolordark=#eeeeee>
				<tr class="TR_STYLE1">
					<td width="12%" class="TD_STYLE1">
						I级机构
					</td>
					<td width="13%" class="TD_STYLE2">
						<select Class="SELECT_STYLE1"
							name="first_kind_name" id="FirstKind">
							<option value="0/0">请选择I级机构</option>
							<c:forEach items="${ list }" var="configfilefirstkinds">
								<option value="${configfilefirstkinds.firstKindId}/${configfilefirstkinds.firstKindName}">${configfilefirstkinds.firstKindName }</option>
							</c:forEach>
						</select>
					</td>
					<td width="12%" class="TD_STYLE1">
						II级机构
					</td>
					<td width="13%" class="TD_STYLE2">
						<select Class="SELECT_STYLE1" name="second_kind_name"  id="SecondKind">
						<option value="0/0">请选择II级机构</option>
						</select>
					</td>
					<td width="12%" class="TD_STYLE1">
						III级机构
					</td>
					<td width="13%" class="TD_STYLE2">
						<select  Class="SELECT_STYLE1"
							name="third_kind_name" id="ThirdKind">
							<option value="0/0">请选择III级机构</option>
						</select>
					</td>
					<td width="12%" class="TD_STYLE1">
						招聘类型
					</td>
					<td width="13%" class="TD_STYLE2">
						<select Class="SELECT_STYLE1" name="engage_type">
							<option value="社会招聘">社会招聘</option>
							<option value="校园招聘">校园招聘</option>
						</select>
					</td>
				</tr>
				<tr>
					<td class="TD_STYLE1">
						职位分类
					</td>
					<td class="TD_STYLE2">
						<select Class="SELECT_STYLE1"
							name="major_kind_name"  id="MajorKind">
							<option value="0/0">请选择职位分类</option>
							<c:forEach items="${ list2 }" var="configfilemajorkinds">
							<option value="${configfilemajorkinds.major_kind_id}/${configfilemajorkinds.major_kind_name}">${configfilemajorkinds.major_kind_name }</option>
						</c:forEach>
						</select>
					</td>
					<td class="TD_STYLE1">
						职位名称
					</td>
					<td class="TD_STYLE2">
						<select Class="SELECT_STYLE1"
							name="major_name"  id="majorName">
							<option value="0/0">请选择职位名称</option>
						</select>
					</td>
					<td class="TD_STYLE1">
						招聘人数
					</td>
					<td class="TD_STYLE2">
						<input type="text" name="human_amount" class="INPUT_STYLE2">
					</td>
					<td class="TD_STYLE1">
						截止日期
					</td>
					<td class="TD_STYLE2">
						<input type="text" name="deadline" class="INPUT_STYLE2" id="date_start" >
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
						<input type="text" name="regist_time" class="INPUT_STYLE2" value="${currentTime}"
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
						职位描述
					</td>
					<td class="TD_STYLE2" colspan="7">
						<textarea name="major_describe"
						class="TEXTAREA_STYLE1" rows="4"></textarea>
					</td>
				</tr>
				<tr>
					<td class="TD_STYLE1">
						招聘要求
					</td>
					<td class="TD_STYLE2" colspan="7">
						<textarea name="engage_required"
						class="TEXTAREA_STYLE1" rows="4"></textarea>
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