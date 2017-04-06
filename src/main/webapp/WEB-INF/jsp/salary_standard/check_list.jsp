<%@ page contentType="text/html; charset=UTF-8" language="java"
	errorPage=""%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" href="css/table.css" type="text/css" />
		<title>无标题文档</title>
		<style type="text/css">
<!--
.style3 {color: #0000CC}
-->
</style>
	</head>

	<body>
		<form method="post" action="salarystandard.do">
			<table width="100%">
				<tr>
					<td>
						<font color="#0000CC">您正在做的业务是:人力资源管理--薪酬标准管理--薪酬标准登记复核</font>
					</td>
				</tr>
				<tr>
					<td>
						&nbsp;
					</td>
				</tr>
				<tr>
					<td>
						当前等待复核的薪酬标准总数:
						${list.size()}
						例
					</td>
				</tr>
			</table>
			<table width="100%" border="1" cellpadding=0 cellspacing=1
				bordercolorlight=#848284 bordercolordark=#eeeeee
				class="TABLE_STYLE1">
				<tr>
					<td width="18%" class="TD_STYLE1">
						<span>薪酬标准编号</span>
					</td>
					<td width="19%" class="TD_STYLE1">
						<span>薪酬标准名称</span>
					</td>
					<td width="16%" class="TD_STYLE1">
						<span>制定人</span>
					</td>
					<td width="30%" class="TD_STYLE1">
						<span>登记时间</span>
					</td>
					<td width="13%" class="TD_STYLE1">
						薪酬总额
					</td>
					<td width="4%" class="TD_STYLE1">
						复核
					</td>
				</tr>
				<c:forEach items="${ list }" var="salaryStandards"  >
				       <tr>
						 <td class="TD_STYLE2" >
							<p name="standard_id">${salaryStandards.standard_id }</p>
						</td>
						<td class="TD_STYLE2" >
							<p name="standard_name">${salaryStandards.standard_name }</p>
						</td>
						<td class="TD_STYLE2" >
							<p name="designer">${salaryStandards.designer }</p>
						</td>
						<td class="TD_STYLE2" >
							<p name="regist_time">${salaryStandards.regist_time }</p>
						</td>
						<td class="TD_STYLE2" >
							<p name="salary_sum">${salaryStandards.salary_sum }</p>
						</td>
						<td class="TD_STYLE2" align="center">
							<a href="salarystandard.do?operate=toEdit&id=${salaryStandards.standard_id}">复核</a>
						</td>
					</tr>
		     </c:forEach>  
			</table>
			
		</form>
	</body>
</html>
