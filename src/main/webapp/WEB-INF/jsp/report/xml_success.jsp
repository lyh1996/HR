<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="table.css" type="text/css">
</head>
<script type="text/javascript">
	function downExport()
		 	{
				document.forms[0].action = "<%=path %>/recordAction!xmlSuccess.action";
				document.forms[0].submit();
		 	}

</script>
<body>
<form method="post" action="">
<table width="100%" >
  <tr>
    <td colspan="2"> 
    <font color="#0000CC">您正在做的业务是：人力资源--标准数据报表--xml标准数据报表置 </font></td>
  </tr>
  <s:if test="#request.rows>0">
  <tr>
    <td width="49%"> 数据输出文件已成功生成，已下载完成。</td>
    <td width="51%" align="right">  
    <input type="button" value="返回" class="BUTTON_STYLE1" onclick="history.back();"></td></tr>
    </s:if><s:else>
    		<tr>
    <td width="49%"> 数据输出文件已成功生成，请下载。</td>
    <td width="51%" align="right">  <input type="button" value="下载" onclick="downExport()" class="BUTTON_STYLE1">
    <input type="button" value="返回" class="BUTTON_STYLE1" onclick="history.back();"></td></tr>
    </s:else>
  </table>

</form>
</body>
</html>

