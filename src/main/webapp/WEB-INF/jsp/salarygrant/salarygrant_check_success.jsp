<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath %>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/table.css" type="text/css">
<script type="text/javascript" src="javascript/comm/comm.js"></script>

<script type="text/javascript">
	function toLoad(){
		document.forms[0].action = document.forms[0].action + "?operate=tocheck";
		document.forms[0].submit();
	}
</script>

</head>
<body>
<form method="post" action="salarygrant.do">
<table width="100%" >
  <tr>
    <td colspan="2"> 
    <font color="#0000CC">您正在做的业务是：人力资源--薪酬发放管理--薪酬发放复核 </font></td>
  </tr>
  <tr>
    <td width="49%"> 复核成功，谢谢！</td>
    <td width="51%" align="right">
    <input type="button" value="返回" onclick="toLoad() " class="BUTTON_STYLE1"></td></tr>
  </table>

</form>
</body>
</html>