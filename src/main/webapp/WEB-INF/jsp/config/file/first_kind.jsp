<%@ page contentType="text/html; charset=UTF-8" language="java"
	errorPage=""%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<html>
	<head>
		<link rel="stylesheet" href="css/table.css" type="text/css">
		<script type="text/javascript" src="javascript/comm/comm.js"></script>
	</head>

	<body>
		<form method="post" action="configfilefirstkind.toadd">
			<table width="100%">
				<tr>
					<td>
						<font color="#0000CC">您正在做的业务是：人力资源--客户化设置--人力资源档案管理设置--I级机构设置
						</font>
					</td>
				</tr>
				<tr>
					<td align="right">
						<input type="button" value="添加" class="BUTTON_STYLE1"
							onclick="javascript:toAdd()" />
					</td>
				</tr>
			</table>
			<table width="100%" border="1" cellpadding=0 cellspacing=1
				bordercolorlight=#848284 bordercolordark=#eeeeee
				class="TABLE_STYLE1">
				<tr>
					 
					<td width="20%" class="TD_STYLE1">
						I级机构名称
					</td>
					<td width="25%" class="TD_STYLE1">
						薪酬发放责任人编号
					</td>
					<td width="25%" class="TD_STYLE1">
						销售责任人编号
					</td>
					<td width="5%" class="TD_STYLE1">
						变更
					</td>
					<td width="5%" class="TD_STYLE1">
						删除
					</td>
				</tr>
				 <c:forEach items="${ configFileFirstKindList }" var="configFileFirstKind"  >
				       <tr>
						 
						<td class="TD_STYLE2">
						 ${configFileFirstKind.firstKindName}
						</td>
						<td class="TD_STYLE2">
						${configFileFirstKind.firstKindSalaryId}
						</td>
						<td class="TD_STYLE2">
							${configFileFirstKind.firstKindSaleId}
						</td>
						<td class="TD_STYLE2">
							<a href="EditConfigFileFirstKind/${configFileFirstKind.firstKindId}">变更</a>
						</td>
						<td class="TD_STYLE2">
							<a href="toDelConfigFileFirstKind/${configFileFirstKind.firstKindId}">删除</a>
						</td>
					</tr>
		     </c:forEach>  
			</table>
		</form>
	</body>
</html>
