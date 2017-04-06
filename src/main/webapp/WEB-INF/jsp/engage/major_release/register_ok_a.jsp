<%@ page contentType="text/html; charset=utf-8" language="java" errorPage="" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" href="css/table.css" type="text/css">
</head>
<script type="text/javascript">
	function back()
	{	
		document.forms[0].action=document.forms[0].action + "?operate=toAdd";
		document.forms[0].submit();
	}
</script>
<body>
<form method="post" action="engagemajorrelease.do">
<table width="100%" >
  <tr>
    <td colspan="2"> 
    <font color="#0000CC">您正在做的业务是：人力资源--招聘管理--职位发布管理--职位发布登记  </font></td>
  </tr>
  <tr>
    <td align="right">
      <div align="left">登记成功，请返回！  
    </div></td>
    <td align="right"><input type="button" class="BUTTON_STYLE1" value="返回" onclick="javascript:back()"></td>
  </tr>
  </table>
  </form>
</body>
</html>