<%@ page contentType="text/html; charset=UTF-8" language="java"
	errorPage=""%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" href="css/table.css" type="text/css">
		<script type="text/javascript">
		function doDel(id){
				alert("薪酬项目"+id+"成功删除!!!");
			document.forms[0].action = document.forms[0].action + "?operate=doDelete&id="+ id;
	 		document.forms[0].submit();
		}		

</script>
</head>
<body>
<form method="post" action="configsalarydesign.do">
<table width="100%" >
  <tr>
    <td colspan="2"> 
    <font color="#0000CC">您正在做的业务是：人力资源--客户化设置--薪酬管理设这--薪酬项目设置</font></td>
  </tr>
  <tr>
    <td width="49%"><p style="color: red;"> 您确认删除这条记录吗?</p> </td>
    <td width="51%" align="right"><input type="button" value="删除" class="BUTTON_STYLE1" onclick="javascript:doDel(${pubId})">
      <input type="button" value="返回" class="BUTTON_STYLE1" onclick="history.back();"></td>
  </tr>
  </table>

</form>
</body>
</html>
