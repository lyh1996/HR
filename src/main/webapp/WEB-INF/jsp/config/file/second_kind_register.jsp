<%@ page contentType="text/html; charset=UTF-8" language="java"
	errorPage=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/table.css" type="text/css">
<script type="text/javascript" src="javascript/comm/comm.js"></script>
</head>
<body>
	<form name="form1" method="post" action="configfilesecondkind.do">
		<table width="100%">
			<tr>
				<td><font color="#0000CC">您正在做的业务是：人力资源--客户化设置--人力资源档案管理设置--II级机构设置
				</font></td>
			</tr>
			<tr>
				<td align="right"><input type="button" value="提交" class="BUTTON_STYLE1" onclick="javascript:doAdd();" > 
				<input type="button" value="返回" class="BUTTON_STYLE1" onclick="history.back();"></td>
			</tr>
		</table>

		<table width="100%" border="1" cellpadding=0 cellspacing=1
			bordercolorlight=#848284 bordercolordark=#eeeeee class="TABLE_STYLE1">
			<tr>
				<td width="19%" class="TD_STYLE1">I级机构编号/名称</td>
				<td width="81%" class="TD_STYLE2"><select name="first_kind_name"
					class="SELECT_STYLE2">
						<c:forEach items="${ list }" var="configfilefirstkinds">
							<option value="${configfilefirstkinds.firstKindId}/${configfilefirstkinds.firstKindName}">${configfilefirstkinds.firstKindId }/${configfilefirstkinds.firstKindName }</option>
						</c:forEach>
				</select></td>
			</tr>
			<tr>
				<td class="TD_STYLE1">II级机构名称</td>
				<td class="TD_STYLE2"><input type="text" name="second_kind_name"
					class="INPUT_STYLE1"></td>
			</tr>
			<tr>
				<td class="TD_STYLE1">薪酬发放责任人编号（多个编号之间请用"半角逗号"加"一个空格"隔开，如", "）</td>
				<td class="TD_STYLE2"><textarea name="second_salary_id"
						class="TEXTAREA_STYLE1" rows="4"></textarea></td>
			</tr>
			<tr>
				<td class="TD_STYLE1">销售责任人编号（多个编号之间请用"半角逗号"加"一个空格"隔开，如", "）</td>
				<td class="TD_STYLE2"><textarea name="second_sale_id"
						class="TEXTAREA_STYLE1" rows="4"></textarea></td>
			</tr>
		</table>
	</form>
</body>
</html>

