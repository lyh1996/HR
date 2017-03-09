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
		<form method="post" action="configquestionsecondkind.do">
			<table width="100%">
				<tr>
					<td>
						<font color="#0000CC">您正在做的业务是：人力资源--客户化设置--题库管理设置--试题II级分类设置
						</font>
					</td>
				</tr>
				<tr>
					<td align="right">
						<input type="button" value="提交" class="BUTTON_STYLE1"
							onclick="doAdd();">
						<input type="button" value="返回" class="BUTTON_STYLE1"
							onclick="history.back();">
					</td>
				</tr>
			</table>

			<table width="100%" border="1" cellpadding=0 cellspacing=1
				bordercolorlight=#848284 bordercolordark=#eeeeee
				class="TABLE_STYLE1">
				<tr>
					<td width="19%" class="TD_STYLE1">
						试题I级分类编号/名称
					</td>
					<td width="81%" class="TD_STYLE2">
						<select name="first_kind_name" class="SELECT_STYLE2">
						<c:forEach items="${ list }" var="configQuestionFirstKinds">
							<option value="${configQuestionFirstKinds.first_kind_id}/${configQuestionFirstKinds.first_kind_name}">${configQuestionFirstKinds.first_kind_id }/${configQuestionFirstKinds.first_kind_name }</option>
						</c:forEach>
				</select>
					</td>
				</tr>
				<tr>
					<td class="TD_STYLE1">
						试题二级分类名称
					</td>
					<td class="TD_STYLE2">
						<input type="text" name="second_kind_name" class="INPUT_STYLE1">
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>

