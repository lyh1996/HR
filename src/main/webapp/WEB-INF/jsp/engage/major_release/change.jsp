<%@ page contentType="text/html; charset=utf-8" language="java"
	errorPage=""%>
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
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<link rel="stylesheet" href="css/table.css" type="text/css">
		<link rel="stylesheet" type="text/css" media="all"
			href="javascript/calendar/calendar-win2k-cold-1.css">
		<script type="text/javascript" src="javascript/calendar/cal.js"></script>
		<script type="text/javascript" src="javascript/comm/comm.js"></script>
		<script type="text/javascript" src="javascript/comm/time.js"></script>
		<script type="text/javascript">
			function checkHumanAmount(textName)
			{	
				if(textName.value > 32767)
				{
				   alert("数字超出范围！");
				} 				   
			}
		</script>
<% 
	String datetime=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(Calendar.getInstance().getTime()); //获取系统时间 
	request.setAttribute("currentTime",datetime);
%>
	</head>

	<body>
		<table width="100%">
			<tr>
				<td>
					<font color="#0000CC">您正在做的业务是：人力资源--招聘管理--职位发布管理--职位发布变更 </font>
				</td>
			</tr>
			<tr>
				<td align="right">
					<input type="button" class="BUTTON_STYLE1" value="重新提交"
						onclick="javascript:doEdit('${list.mre_id}');">
					<input type="button" value="返回" class="BUTTON_STYLE1"
						onclick="history.back()">
				</td>
			</tr>
		</table>

		<form action="engagemajorrelease.do" method="post">
			<table class="TABLE_STYLE1" border="1" width="100%" cellpadding=0
				cellspacing=1 bordercolorlight=#848284 bordercolordark=#eeeeee>
				<tr class="TR_STYLE1">
					<td class="TD_STYLE1">
						I级机构
					</td>
					<td class="TD_STYLE2" width="13%" name="first_kind_name" id="FirstKind">					
							${list.first_kind_name }
					</td>
					<td class="TD_STYLE1" width="11%" >
						II级机构
					</td>
					<td class="TD_STYLE2" width="13%">					
							${list.second_kind_name }
					</td>
					<td class="TD_STYLE1" width="11%">
						III级机构
					</td>
					<td class="TD_STYLE2" width="13%">
							${list.third_kind_name }
					</td>
					<td class="TD_STYLE1" width="11%">
						招聘类型
					</td>
					<td class="TD_STYLE2" width="13%">
						<select Class="SELECT_STYLE1" name="engage_type" value="">
							<option value="社会招聘" <c:if test="${ list.engage_type == '社会招聘' }">selected="selected"</c:if>>社会招聘</option>
							<option value="校园招聘" <c:if test="${ list.engage_type == '校园招聘' }">selected="selected"</c:if>>校园招聘</option>
						</select>
					</td>
				</tr>
				<tr class="TR_STYLE1">
					<td class="TD_STYLE1" width="11%">
						职位分类
					</td>
					<td class="TD_STYLE2" width="13%">						
							${list.major_kind_name }				
					</td>
					<td class="TD_STYLE1" width="11%">
						职位名称
					</td>
					<td class="TD_STYLE2" width="13%">					
							${list.major_name }
					</td>
					<td class="TD_STYLE1" width="11%">
						招聘人数
					</td>
					<td class="TD_STYLE2" width="13%">
							<input type="text" name=human_amount value="${list.human_amount }"class="INPUT_STYLE2" >
					</td>
					<td class="TD_STYLE1" width="11%">
						截止日期
					</td>
					<td class="TD_STYLE2" width="13%">
							<input type="text" name="deadline" value="${list.deadline }"class="INPUT_STYLE2" id="date_start" >
					</td>
				</tr>
				<tr class="TR_STYLE1">
					<td class="TD_STYLE1" width="11%">
						变更人
					</td>
					<td class="TD_STYLE2" width="13%">
						<input type="text" name="changer" class="INPUT_STYLE2"
							value="${user}" readonly="true" />
					</td>
					<td class="TD_STYLE1" width="11%">
						变更时间
					</td>
					<td class="TD_STYLE2" width="13%">
						<input type="text" name="change_time" class="INPUT_STYLE2" value="${currentTime}"
						 readonly="true"/>
					</td>
					<td class="TD_STYLE1" width="11%">
						&nbsp;
					</td>
					<td class="TD_STYLE2" width="13%">
						&nbsp;
					</td>
					<td class="TD_STYLE1" width="11%">
						&nbsp;
					</td>
					<td class="TD_STYLE2" width="13%">
						&nbsp;
					</td>
				</tr>
				<tr class="TR_STYLE1">
					<td class="TD_STYLE1" height="65" width="11%">
						职位描述
					</td>
					<td class="TD_STYLE2" colspan="7">
							<textarea name="major_describe"
						class="TEXTAREA_STYLE1"rows="4">${list.major_describe }</textarea>
					</td>
				</tr>
				<tr class="TR_STYLE1">
					<td class="TD_STYLE1">
						招聘要求
					</td>
					<td class="TD_STYLE2" colspan="7">
							<textarea name="engage_required"
						class="TEXTAREA_STYLE1" rows="4">${list.engage_required }</textarea>
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
