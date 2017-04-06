<%@ page contentType="text/html; charset=UTF-8" language="java"
	errorPage=""%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/table.css" type="text/css">
<script type="text/javascript" src="javascript/comm/comm.js"></script>
</head>
<body>
	<form method="post" action="humanfile.do">
		<table width="100%">
			<tr>
				<td colspan="2"><font color="#0000CC">您正在做的业务是：人力资源--人力资源档案管理--人力资源档案登记
				</font></td>
			</tr>
			<tr>
				<td width="49%">基本信息复核成功。</td>
				<td width="51%" align="right"> <input type="button" value="继续" class="BUTTON_STYLE1"
							onclick="javascript:toUpLoadPhoto2('check')">
   					 <input type="button" value="返回" class="BUTTON_STYLE1" onclick="javascript:reBack();"></td>
			</tr>
		</table>

	</form>
</body>
</html>
