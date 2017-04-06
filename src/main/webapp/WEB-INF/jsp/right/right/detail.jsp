<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		
		<title>jb-aptech毕业设计项目</title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link href="../../css/style.css" rel="stylesheet" type="text/css">
		<script src="../../script/common.js"></script>
		<script src="../../script/validate.js"></script>
	</head>
	<body>
		<div class="page_title">
			权限管理 > 权限管理 > 添加权限
		</div>
		<form name="sysRightForm" method="post" action="/CRM/sysRight.do">
			<div class="button_bar">
				<button class="common_button" onClick="help('');">
					帮助
				</button>
				<button class="common_button" onClick="to('sysRight.do?method=toAddSysRight');">
					添加
				</button>
				<button class="common_button" onClick="back();">
					返回
				</button>
				
			</div>
			<table class="query_form_table">
				<tr>
					<th>
						编号
					</th>
					<td>
						L01
					</td>
					<th>
						权限类型
					</th>
					<td>
						Folder
					</td>
					<th>
						父节点
					</th>
					<td>
						ROOT_MENU
					</td>
				</tr>
				<tr>
					<th>
						权限文本
					</th>
					<td>
						营销管理
					</td>
					<th>
						权限URL
					</th>
					<td>
						 
					</td>
					<th>权限描述</th>
					<td>
						营销管理
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>
