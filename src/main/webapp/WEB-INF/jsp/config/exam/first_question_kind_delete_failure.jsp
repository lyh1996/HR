<%@ page contentType="text/html; charset=UTF-8" language="java" errorPage="" %>
<%
	//添加基底网址
	String path = request.getContextPath();//doubanTeacher
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/table.css" type="text/css">
<script type="text/javascript" src="javascript/comm/comm.js"></script>
</head>
<body>
<form method="post" action="configquestionfirstkind.do">
<table width="100%" >
  <tr>
    <td colspan="2"> 
    <font color="#0000CC">您正在做的业务是：人力资源--客户化设置--题库管理设置--试题I级分类设置 </font></td>
  </tr>
  <tr>
    <td width="49%"> 删除失败，该分类正在应用，请返回。</td>
    <td width="51%" align="right">        
    <input type="button" value="返回" class="BUTTON_STYLE1" onclick="javascript:reBack()"></td></tr>
  </table>

</form>
</body>
</html>
