<%@ page contentType="text/html; charset=UTF-8" language="java" errorPage="" %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" href="css/table.css" type="text/css" >
<script type="text/javascript" src="javascript/comm/comm.js"></script>
<script type="text/javascript">
function doRecov(id)
	{
		document.forms[0].action = document.forms[0].action + "?operate=doRecover&id=" + id;
		document.forms[0].submit();
	}
</script>

</head>
<body>
<form method="post" action="humanfile.do">
<table width="100%" >
  <tr>
    <td colspan="2"> 
    <font color="#0000CC">您正在做的业务是：人力资源--人力资源档案管理--人力资源档案删除管理--人力资源档案恢复 </font></td>
  </tr>
  <tr>
     <td width="49%"> 您确认要恢复档案编号为: <span style="color: red;">${humanid}</span>这例档案吗? </td>
    <td width="51%" align="right"><input type="button" value="恢复" class="BUTTON_STYLE1" onclick="javascript:doRecov(${humanid})">
      <input type="button" value="返回" class="BUTTON_STYLE1" onclick="history.back();"></td>
  </tr>
  </table>

</form>
</body>
</html>
<iframe  width=0 height=0></iframe>
