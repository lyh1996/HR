<%@ page contentType="text/html; charset=UTF-8" language="java"
	errorPage=""%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/table.css" type="text/css">
<script type="text/javascript" src="javascript/comm/comm.js"></script>
</head>
<body>
	<form method="post" action="engageresume.do">
		<table width="100%">
			<tr>
				<td colspan="2"><font color="#0000CC">您正在做的业务是：人力资源--招聘管理--简历管理--简历登记 </font></td>
			</tr>
			<tr>
				<td width="49%">基本信息录入成功。如有照片，请点击继续上传照片，如需修改简历信息，请返回。</td>
				<td width="51%" align="right"> <input type="button" value="继续" class="BUTTON_STYLE1"
							onclick="javascript:toUpLoadPhoto()">
   					 <input type="button" value="返回" class="BUTTON_STYLE1" onclick="history.back()"></td>
			</tr>
		</table>

	</form>
</body>
</html>
