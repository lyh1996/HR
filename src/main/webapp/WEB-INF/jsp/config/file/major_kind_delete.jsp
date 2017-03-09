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
<form method="post" action="configmajorkind.do">
<table width="100%" >
  <tr>
    <td colspan="2"> 
    <font color="#0000CC">您正在做的业务是：人力资源--客户化设置--人力资源档案管理设置--职位分类设置 </font></td>
  </tr>
  <tr>
   <td width="49%"><p style="color: red;"> 您确认删除这条记录吗?</p> </td>
    <td width="51%" align="right"><input type="button" value="删除" class="BUTTON_STYLE1" onclick="javascript:doDel(${majorId})">
      <input type="button" value="返回" class="BUTTON_STYLE1" onclick="history.back();"></td>
  </tr>
  </table>

</form>
</body>
</html>
