<%@ page contentType="text/html; charset=UTF-8" language="java"
	errorPage=""%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" href="css/table.css" type="text/css" />
		<title>无标题文档</title>
	</head>

	<body>
		<form action="salarystandard.do" method="post">
			<table width="100%">
				<tr>
					<td>
						<font color="#0000CC">您正在做的业务是:人力资源管理--薪酬标准管理--薪酬标准登记查询</font>
					</td>
				</tr>
				<tr>
					<td>
						<div align="right">
							<input type="button" value="打印" class="BUTTON_STYLE1" >
							<input type="button" value="返回" onclick="history.back();" class="BUTTON_STYLE1" >
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
						
						<p name="standard_name">${salaryStandards.standard_name}</p>
					</td>
					<td width="11%" class="TD_STYLE1">薪酬总额</td>
					<td width="17%" class="TD_STYLE2">
						<p name="salary_sum" id="salary_sum" >${salaryStandards.salary_sum}</p>
					</td>
					<td width="12%" class="TD_STYLE1">
						&nbsp;
					</td>
					<td width="10%" class="TD_STYLE2">
						&nbsp;
					</td>
				</tr>
				<tr>
					<td class="TD_STYLE1">制定人</td>
					<td class="TD_STYLE2">
						<p name="designer" >${salaryStandards.designer}</p>
					</td>
					<td class="TD_STYLE1">复核人</td>
					<td class="TD_STYLE2">
						<p name="checker" >${salaryStandards.checker}</p>
					</td>
					<td class="TD_STYLE1">
						复核时间
					</td>
					<td class="TD_STYLE2">
						<p name="check_time" >${salaryStandards.check_time}</p> 
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
						备注
					</td>
					<td colspan="7" class="TD_STYLE2" height="68">
						${salaryStandards.remark }
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
							<input type="text" name="salary" id="${status.count}" value="${salaryStandardDetails.salary}" readonly="readonly" styleClass="INPUT_STYLE1" style="background-color: D4F8D4" onchange="addMoney(${status.count})">
						</td>
					</tr>
		     </c:forEach> 
				
			</table>
		</form>
	</body>
</html>
