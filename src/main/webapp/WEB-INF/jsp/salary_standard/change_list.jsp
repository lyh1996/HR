<%@ page contentType="text/html; charset=UTF-8" language="java"
	errorPage=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/table.css" type="text/css" />
<title>无标题文档</title>
<script type="text/javascript" src="javascript/comm/comm.js"></script>
<script type="text/javascript">
	function toQueryMore(id) {
		document.forms[0].action = document.forms[0].action
				+ "?operate=toQueryMore&id=" + id;
		document.forms[0].submit();
	}
</script>
<style type="text/css">
<!--
.style3 {
	color: #0000CC
}
-->
</style>
</head>

<body>
	<form method="post" action="salarystandard.do">
		<table width="100%">
			<tr>
				<td><font color="#0000CC">您正在做的业务是:人力资源管理--薪酬标准管理--薪酬标准登记变更</font>
				</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td>符合条件的薪酬标准总数:
					 <%=((java.util.List) request.getAttribute("salaryStandards")).size()%>
				 例</td>
			</tr>
		</table>
		<table width="100%" border="1" cellpadding=0 cellspacing=1
			bordercolorlight=#848284 bordercolordark=#eeeeee class="TABLE_STYLE1">
			<tr>
				<td width="18%" class="TD_STYLE1"><span>薪酬标准编号</span></td>
				<td width="19%" class="TD_STYLE1"><span>薪酬标准名称</span></td>
				<td width="16%" class="TD_STYLE1"><span>制定人</span></td>
				<td width="30%" class="TD_STYLE1"><span>登记时间</span></td>
				<td class="TD_STYLE1" width="13%">薪酬总额</td>
				<td class="TD_STYLE1" width="4%">变更</td>
			</tr>
			<c:forEach items="${ salaryStandards }" var="salaryStandards">
				<tr class="TD_STYLE2">
					<td>${salaryStandards.standard_id }</td>
					<td>${salaryStandards.standard_name }</td>
					<td>${salaryStandards.designer }</td>
					<td>${salaryStandards.regist_time }</td>
					<td>${salaryStandards.salary_sum }</td>
					<td><a href="javascript:toQueryMore('${salaryStandards.standard_id}')">变更</a></td>
				</tr>
			</c:forEach>
		</table>

	</form>
</body>
</html>
