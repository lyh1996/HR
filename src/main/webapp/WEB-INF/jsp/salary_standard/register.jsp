<%@ page contentType="text/html; charset=UTF-8" language="java"
	errorPage=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<%@ page import="java.util.*"%> <!-- //获取系统时间必须导入的  -->
<%@ page import="java.text.*"%> <!-- //获取系统时间必须导入的  -->
<html>
<head>
<% 
	String datetime=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(Calendar.getInstance().getTime()); //获取系统时间 
	request.setAttribute("currentTime",datetime);
%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/table.css" type="text/css">
<script type="text/javascript" src="javascript/comm/comm.js"></script>
<script type="text/javascript" src="javascript/comm/jquery-1.12.4.js"></script>
<script type="text/javascript" >
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
 function addMoney(id){
	 document.getElementById("salary_sum").value= parseInt(document.getElementById("salary_sum").value)+parseInt(document.getElementById(id).value); 

 }
 
</script>

</head>
<body onload="check()">
	<form method="post" action="salarystandard.do">
		<table width="100%">
			<tr>
				<td><font color="#0000CC">您正在做的业务是：人力资源--薪酬标准管理--薪酬标准登记
				</font></td>
			</tr>
			<tr>
				<td align="right"><input type="button" value="提交"
					onclick="javascript:doAdd();" class="BUTTON_STYLE1"> <input
					type="reset" value="清除" class="BUTTON_STYLE1"></td>
			</tr>
		</table>
		<table width="100%" border="1" cellpadding=0 cellspacing=1 bordercolorlight=#848284 bordercolordark=#eeeeee class="TABLE_STYLE1">
				<tr>
					<td width="74" class="TD_STYLE1">薪酬标准编号</td>
					<td width="168" class="TD_STYLE2">
						${salaryStandard.getStandard_id()}
					</td>
					<td width="83" class="TD_STYLE1">薪酬标准名称</td>
					<td width="171" class="TD_STYLE2">
						<input type="text" name="standard_name"  Class="INPUT_STYLE1" style="background-color: D4F8D4">
					</td>
					<td width="170" class="TD_STYLE1">薪酬总额</td>
					<td width="138" class="TD_STYLE2">
						<input type="text" name="salary_sum" readonly="readonly" id="salary_sum" value="0" Class="INPUT_STYLE1" style="background-color: D4F8D4">
					</td>
					 
				</tr>
				<tr>
					<td class="TD_STYLE1">制定人</td>
					<td class="TD_STYLE2">
						<input type="text" name="designer"   Class="INPUT_STYLE1" style="background-color: D4F8D4">
					</td>
					<td class="TD_STYLE1">登记人</td>
					<td class="TD_STYLE2">
						<input name="register" readonly="readonly" type="text" value="${user}"   Class="INPUT_STYLE1" style="background-color: D4F8D4">					
					</td>
					<td class="TD_STYLE1">登记时间</td>
					<td>
						<input type="text" name="regist_time"  Class="INPUT_STYLE1" id="nowTime"
						 readonly="true"  style="background-color: D4F8D4"/>					
					</td>
					 
				</tr>
				<tr>
					<td class="TD_STYLE1">
						备注
					</td>
					<td colspan="5" class="TD_STYLE2">
							<textarea name="remark"
						class="TEXTAREA_STYLE1" rows="4"></textarea>
					</td>
				</tr>
				<tr class="TD_STYLE1">
					<td align="center">
						序号
					</td>
					<td >
						薪酬项目名称
					</td>
					<td >
						金额
					</td>
					
				</tr>	
				<c:forEach items="${ countrys }" var="countrys" varStatus="status" >
				       <tr>
						 <td class="TD_STYLE2" >
						 	<input type="text" value="${status.count}" name="item_id" readonly="readonly" styleClass="INPUT_STYLE1" style="background-color: D4F8D4"  >
						</td>
						<td class="TD_STYLE2" >
							<input type="text" name="item_name" value="${countrys.attribute_name }" readonly="readonly" styleClass="INPUT_STYLE1" style="background-color: D4F8D4"  >
						</td>
						<td class="TD_STYLE2" >
							<input type="text" name="salary" id="${status.count}" styleClass="INPUT_STYLE1" style="background-color: D4F8D4" onchange="addMoney(${status.count})" >
						</td>
					</tr>
		     </c:forEach>  
		</table>
	</form>
</body>
</html>
