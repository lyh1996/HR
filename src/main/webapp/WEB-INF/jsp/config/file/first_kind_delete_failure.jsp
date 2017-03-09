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
<form method="post" action="configfilefirstkind.do">
<table width="100%" >
  <tr>
    <td colspan="2"> 
    <font color="#0000CC">您正在做的业务是：人力资源--客户化设置--人力资源档案管理设置--I级机构设置 </font></td>
  </tr>
  <tr>
    <td width="49%"> 删除失败，该机构正在应用，请返回。</td>
    <td width="51%" align="right">        
    <a href="getconfigfilefirstkinds">返回</a></td></tr>
  </table>

</form>
</body>
</html>
