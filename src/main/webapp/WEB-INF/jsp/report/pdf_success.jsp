<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/table.css" type="text/css">
</head>
<script type="text/javascript">
	function downExport()
		 	{
		document.forms[0].action = document.forms[0].action + "?operate=down&method=pdf";
		document.forms[0].submit();
		 	}
</script>
<body>
<form method="post" action="exportfile.do">
<table width="100%" >
  <tr>
    <td colspan="2"> 
    <font color="#0000CC">您正在做的业务是：人力资源--标准数据报表--Excel标准数据报表置 </font></td>
  </tr>
    <tr>
    <td width="49%"> 数据输出文件已成功生成，请下载。</td>
    <td width="51%" align="right"> <a href="${newFileUrl}">下载PDF文件</a>
    <input type="button" value="返回" class="BUTTON_STYLE1" onclick="history.back();">
    </td>
    </tr>
  </table>
</form>
</body>
</html>

