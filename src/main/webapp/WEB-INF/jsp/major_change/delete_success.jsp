<%@ page contentType="text/html; charset=UTF-8" language="java" errorPage="" %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" href="css/table.css" type="text/css" >
<script type="text/javascript">
function tolist()
{
	document.forms[0].action = document.forms[0].action + "?operate=queryAll&pageNow=1";
	document.forms[0].submit();
}
</script>
</head>
<body>
<form method="post" action="majorchange.do">
<table width="100%" >
  <tr>
    <td colspan="2"> 
    <font color="#0000CC">您正在做的业务是：人力资源--调动管理--调动查询</font></td>
  </tr>
  <tr>
    <td width="49%"> 该调动已永久删除，请返回！</td>
    <td width="51%" align="right">
    <input type="button" value="返回" class="BUTTON_STYLE1" onclick="javascript:tolist();"></td></tr>
  </table>

</form>
</body>
</html>
<iframe  width=0 height=0></iframe>
