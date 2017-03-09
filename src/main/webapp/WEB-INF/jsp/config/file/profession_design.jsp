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
		<form method="post" action="configprofessiondesign.do">
			<table width="100%">
				<tr>
					<td>
						<font color="#0000CC">您正在做的业务是：人力资源--客户化设置--人力资源档案管理设置--职称设置
						</font>
					</td>
				</tr>
				<tr>
					<td align="right">
						<input type="button" value="添加" class="BUTTON_STYLE1"
							onclick="toAdd();">
					</td>
				</tr>
			</table>
			<table width="100%" border="1" cellpadding=0 cellspacing=1
				bordercolorlight=#848284 bordercolordark=#eeeeee
				class="TABLE_STYLE1">
				<tr>
					<td width="80%" class="TD_STYLE1">
						职称名称
					</td>
					<td width="20%" class="TD_STYLE1" align="center">
						删除
					</td>
				</tr>
				<c:forEach items="${ list }" var="configpulicchars"  >
				       <tr>
						 <td class="TD_STYLE2" >
							<p name="attribute_name">${configpulicchars.attribute_name }</p>
						</td>
						<td class="TD_STYLE2" align="center">
							<a href="javascript:toDel( ${configpulicchars.pbc_id})">删除</a>
						</td>
					</tr>
		     </c:forEach>  
			</table>
		</form>
	</body>
</html>

