<%@ page contentType="text/html; charset=utf-8" language="java"
	errorPage=""%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" href="css/table.css" type="text/css">
<script type="text/javascript">
		function reback()
		{
			document.forms[0].action = document.forms[0].action + "?operate=doEdits&pageNow=1";
			document.forms[0].submit();
		}
</script>
</head>

<body>
<form action="engagemajorrelease.do" method="post">
<table width="100%" >
  <tr>
    <td colspan="2"> 
    <font color="#0000CC">您正在做的业务是：人力资源--招聘管理--职位发布管理--职位发布变更 </font></td>
  </tr>
  <tr>
    <td align="right">
      <div align="left">修改成功，谢谢！ 
    </div></td>
    <td align="right"><input type="button" value="返回" class="BUTTON_STYLE1" onclick="javascript:reback();"></td>
  </tr>
  </table>
  </form>
</body>
</html>