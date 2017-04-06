<%@ page contentType="text/html; charset=utf-8" language="java"
	errorPage=""%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<link rel="stylesheet" href="css/table.css" type="text/css">
		<script type="text/javascript">
			function doStart()
			{
				document.forms[0].action=document.forms[0].action+"?operate=list&method=interview&pageNow=1";
				document.forms[0].submit();
			}
		</script>
	</head>

<body>
<form action="engageresume.do" method="post">
<table width="100%" >
  <tr>
    <td colspan="2"> 
    <font color="#0000CC">您正在做的业务是：人力资源--招聘管理--面试管理--面试结果登记 
  </font></td>
  </tr>
  <tr>
    <td>登记成功，请返回！</td>
    <td align="right"><input type="button" class="BUTTON_STYLE1" value="返回" onclick="doStart();"></td>
  </tr>
</table>
</form>
</body>
</html>