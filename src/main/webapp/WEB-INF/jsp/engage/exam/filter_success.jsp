<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<link rel="stylesheet" href="css/table.css"
			type="text/css"></link>
	</head>
	<body>
		<form name="humanfileForm" method="post" action="/hr/humanfile.do">
			<table width="100%">
				<tr>
					<td>
						<font color="#0000CC">您正在做的业务是:人力资源--招聘管理--招聘考试管理--成绩查询筛选</font>
					</td>
				</tr>
				 <tr>
    <td width="49%"> 筛选成功！</td>
    <td width="51%" align="right">
    <input type="button" value="返回" class="BUTTON_STYLE1" onclick="history.back();"></td></tr>
			</table>
		</form>
	</body>

</html>

