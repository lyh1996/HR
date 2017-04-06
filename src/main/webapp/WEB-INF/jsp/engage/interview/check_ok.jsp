<%@ page contentType="text/html; charset=utf-8" language="java"
	errorPage=""%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<link rel="stylesheet" href="css/table.css" type="text/css">
		<script type="text/javascript" src="javascript/comm/comm.js"></script>
		<script type="text/javascript">
			function toEdit()
			{
				document.forms[0].action = document.forms[0].action + "?operate=list&pageNow=1";
				document.forms[0].submit();
			}
		</script>
	</head>

<body>
<form action="engageinterview.do" method="post">
<table width="100%" >
  <tr>
    <td colspan="2"> 
    <font color="#0000CC">您正在做的业务是：人力资源--招聘管理--面试管理--面试筛选 
  </font></td>
  </tr>
  <tr>
    <td>筛选成功，请返回！</td>
    <td align="right"><input type="button" class="BUTTON_STYLE1" value="返回" onclick="javascript:toEdit();"></td>
  </tr>
</table>
</form>
</body>
</html>