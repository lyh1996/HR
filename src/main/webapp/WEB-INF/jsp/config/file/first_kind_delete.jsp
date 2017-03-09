<%@ page contentType="text/html; charset=UTF-8" language="java"
	errorPage=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
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
		<table width="100%">
			<tr>
				<td colspan="2"><font color="#0000CC">您正在做的业务是：人力资源--客户化设置--人力资源档案管理设置--I级机构设置
				</font></td>
			</tr>
			<tr>
				<td width="49%"><p style="color: red;">您确认删除这条记录吗?</p>
				</td>
				<td width="51%" align="right"> 
				<a href="dodeleteconfigfilefirstkind/${id}">删除</a>
				<a href="getconfigfilefirstkinds">返回</a>
					 </td>
			</tr>
		</table>

	</form>
</body>
</html>
