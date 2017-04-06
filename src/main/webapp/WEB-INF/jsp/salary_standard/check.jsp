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
<link rel="stylesheet" href="css/table.css" type="text/css" />
	<title>无标题文档</title>
<script type="text/javascript" src="javascript/comm/comm.js"></script>
<script type="text/javascript" src="javascript/comm/jquery-1.12.4.js"></script>
<script type="text/javascript" >
 function addMoney(id){
	 document.getElementById("salary_sum").value= parseInt(document.getElementById("salary_sum").value)+parseInt(document.getElementById(id).value); 

 }
 
  
 
</script>
	

	</head>

	<body>
		<form action="salarystandard.do" method="post">
			<table width="100%">
				<tr>
					<td>
						<font color="#0000CC">您正在做的业务是:人力资源管理--薪酬标准管理--薪酬标准登记复核</font>
					</td>
				</tr>
				<tr>
					<td>
						<div align="right">
							<a href="javascript:doEdit('${salaryStandards.standard_id }')">复核通过</a>
							<input type="button" value="返回" onclick="history.back();" class="BUTTON_STYLE1">
						</div>
					</td>
				</tr>
			</table>
			<table width="100%" border="1" cellpadding=0 cellspacing=1
				bordercolorlight=#848284 bordercolordark=#eeeeee
				class="TABLE_STYLE1">
				<tr>
					<td width="12%" class="TD_STYLE1">薪酬编号</td>
					<td width="15%" class="TD_STYLE2">
						<p name="standard_id">${salaryStandards.standard_id }</p>		
					</td>
					<td width="12%" class="TD_STYLE1">薪酬标准名称</td>
					<td width="11%" class="TD_STYLE2">
						<input name="standard_name" type="text" value=${salaryStandards.standard_name} class="TD_STYLE2">
						
					</td>
					<td width="11%" class="TD_STYLE1">薪酬总额</td>
					<td width="17%" class="TD_STYLE2">
						<input type="text" name="salary_sum" id="salary_sum" readonly="readonly" value="${salaryStandards.salary_sum}" styleClass="INPUT_STYLE1" style="background-color: D4F8D4">
						
					</td>
					 
				</tr>
				<tr>
					<td class="TD_STYLE1">制定人</td>
					<td class="TD_STYLE2">
						<input name="designer" type="text" value=${salaryStandards.designer} class="TD_STYLE2">
					</td>
					<td class="TD_STYLE1">复核人</td>
					<td class="TD_STYLE2">
						<input name="checker" readonly="readonly" type="text" value="<%out.print((String)session.getAttribute("user")); %>" styleClass="INPUT_STYLE1" style="background-color: D4F8D4">
					</td>
					<td class="TD_STYLE1">
						复核时间
					</td>
					<td class="TD_STYLE2">
						<input type="text" name="check_time" styleClass="INPUT_STYLE1" value="${currentTime}"
						 readonly="true"  style="background-color: D4F8D4"/>
					</td>
					 
				</tr>
				<tr>
					<td class="TD_STYLE1">
						复核意见
					</td>
					<td colspan="5" class="TD_STYLE2">
							<textarea name="check_comment"
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
				<c:forEach items="${ salaryStandardDetails }" var="salaryStandardDetails" varStatus="status" >
				       <tr>
						 <td class="TD_STYLE2" >
						 	<input type="text" value="${salaryStandardDetails.item_id}" name="item_id" readonly="readonly" styleClass="INPUT_STYLE1" style="background-color: D4F8D4"  >
						</td>
						<td class="TD_STYLE2" >
							<input type="text" name="item_name" value="${salaryStandardDetails.item_name }" readonly="readonly" styleClass="INPUT_STYLE1" style="background-color: D4F8D4"  >
						</td>
						<td class="TD_STYLE2" >
							<input type="text" name="salary" id="${status.count}" value="${salaryStandardDetails.salary}" styleClass="INPUT_STYLE1" style="background-color: D4F8D4" onchange="addMoney(${status.count})">
						</td>
					</tr>
		     </c:forEach>  

			</table>
		</form>
	</body>
</html>
