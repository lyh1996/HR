<%@ page contentType="text/html; charset=utf-8" language="java"
	errorPage=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" href="css/table.css" type="text/css">
<script type="text/javascript">
	function doDelete(id)
	{
		document.forms[0].action = document.forms[0].action + "?operate=doDelete&id="+id;
		document.forms[0].submit();
	}
</script>
</head>

<body>
<form action="engageinterview.do" method="post">
<table width="100%" >
  <tr>
    <td colspan="2"> 
    <font color="#0000CC">您正在做的业务是：人力资源--招聘管理--面试管理--面试筛选 </font></td>
  </tr>
  <tr>
    <td align="right">
      <div align="left">您确认删除${resumeid }该简历吗？ 
    </div></td>
    <td align="right"><input type="button" class="SUBMIT_STYLE1" value="确认" onclick="javascript:doDelete('${resumeid }');">
    <input type="button" class="BUTTON_STYLE1" value="返回" onclick="history.back()"></td>
  </tr>
  </table>
  </form>
</body>
</html>