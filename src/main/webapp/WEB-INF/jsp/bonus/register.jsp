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
<script type="text/javascript" src="javascript/comm/comm.js" charset="utf-8"></script>
<link rel="stylesheet" type="text/css" media="all"
			href="javascript/calendar/calendar-win2k-cold-1.css" >
		<script type="text/javascript" src="javascript/calendar/cal.js" charset="utf-8"></script>
<link rel="stylesheet" href="css/table.css" type="text/css" />
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
 

<title>无标题文档</title>
</head>

<body onload="check()">
	<form name="form1" method="post" action="bonus.do">
		<table width="100%">
			<tr>
				<td width="100%"><font color="#0000CC">您正在做的业务是：人力资源--激励管理--激励登记</font></td>
			</tr>
			<tr>
				<td><div align="right">
						<input type="button" value="添加" class="BUTTON_STYLE1"
							onclick="javascript:doAdd()"> 
							<input type="button" value="返回" class="BUTTON_STYLE1" onclick="history.back();">
					</div></td>
			</tr>
		</table>
		<table width="100%" border="1" cellpadding=0 cellspacing=1
			bordercolorlight=#848284 bordercolordark=#eeeeee class="TABLE_STYLE1">
			<tr>
				<td width="11%" class="TD_STYLE1">档案编号</td>
				<td colspan="7" class="TD_STYLE2"><input type="text"
					name="human_id" class="INPUT_STYLE2" value="${list.human_id }" readonly="true" /></td>
					 
			</tr>
			<tr>
				<td class="TD_STYLE1">姓名</td>
				<td width="11%" class="TD_STYLE2"><input type="text"
					name="human_name" class="INPUT_STYLE2" value="${list.human_name }" readonly="true" /></td>
				<td width="12%" class="TD_STYLE1">职位分类</td>
				<td width="14%" class="TD_STYLE2">
				<input  name="major_kind_id" value="${list.human_major_kind_id}" type="hidden"/>
				<input type="text"
					name="major_kind_name" class="INPUT_STYLE2" value="${list.human_major_kind_name}" readonly="true" /></td>
				<td width="11%" class="TD_STYLE1">职位名称</td>
				<td width="11%" class="TD_STYLE2">
				<input  name="major_id" value="${list.human_major_id }" type="hidden"/>
				<input type="text"
					name="major_name" class="INPUT_STYLE2" value="${list.human_major_name }" readonly="true" /></td>
				<td width="11%" class="TD_STYLE1">激励项目</td>
				<td width="14%" class="TD_STYLE2"><select
					NAME="bonus_item" class="SELECT_STYLE1">
						<c:forEach items="${ list2 }" var="list2">
							<option value="${list2.attribute_name }">${list2.attribute_name }</option>
						</c:forEach>
				</select></td>
			</tr>
			<tr>
				<td height="20" class="TD_STYLE1">激励价值</td>
				<td class="TD_STYLE2"><input type="text" name="bonus_worth"
					class="INPUT_STYLE2" /></td>
				<td class="TD_STYLE1">激励等级</td>
				<td class="TD_STYLE2"><select NAME="bonus_degree"
					class="SELECT_STYLE1">
						<c:forEach items="${ list1 }" var="list1">
							<option value="${list1.attribute_name }">${list1.attribute_name }</option>
						</c:forEach>
				</select></td>
				<td class="TD_STYLE1">登记人</td>
				<td class="TD_STYLE2"><input type="text" name="register"
					class="INPUT_STYLE2" value="${user}" readonly="true" /></td>
				<td class="TD_STYLE1">登记时间</td>
				<td class="TD_STYLE2"><input type="text" name="regist_time"
					class="INPUT_STYLE2" id="nowTime" readonly="true" /></td>
			</tr>
			<tr>
				<td class="TD_STYLE1">备注</td>
				<td colspan="7" class="TD_STYLE2"><textarea name="remark"
						rows="5" class="TEXTAREA_STYLE1"></textarea></td>
			</tr>
		</table>
	</form>
</body>
<script type="text/javascript">
Calendar.setup ({inputField : "date_start", ifFormat : "%Y-%m-%d", showsTime : false, button : "date_start", singleClick : true, step : 1});
Calendar.setup ({inputField : "date_end", ifFormat : "%Y-%m-%d", showsTime : false, button : "date_end", singleClick : true, step : 1});
</script>
</html>
<iframe width=0 height=0></iframe>
