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
		<script type="text/javascript">

			function myAdd(){
				if(document.getElementById("rightCode").value=""){
					document.getElementById("codeSpan").innerHTML="不能为空";
					return;
				}
				if(document.getElementById("rightText").value=""){
					document.getElementById("textSpan").innetHTML="不能为空";
					return;
				}
				if(document.getElementById("rightUrl").value=""){
					document.getElementById("urlSpan").innerHTML="不能为空";
					return;
				}

				document.sysRightForm.submit();

			}
		</script>
	<body>
		<div class="page_title">
			权限管理 > 权限管理 > 添加权限
		</div>
		<form name="sysRightForm" method="post" action="/CRM/sysRight.do">
			<input type="hidden" name="method" value="addSysRight">
			<div class="button_bar">
				<button class="common_button" onclick="help('');">
					帮助
				</button>
				<button class="common_button" onclick="back();">
					返回
				</button>
				<button class="common_button" onclick="myAdd();">
					保存
				</button>
			</div>
			<table class="query_form_table">
				<tr>
					<th>
						编号
					</th>
					<td>
						<input type="text" name="sysRight.rightCode" value="L01" id="rightCode">
						<span class="red_star" id="codeSpan">*</span>
					</td>
					<th>
						权限类型
					</th>
					<td>
						<select name="sysRight.rightType"><option value="Folder" selected="selected">根结点</option>
							<option value="Folder" selected="selected">父节点</option>
							<option value="Document">根结点</option></select>
					</td>
					<th>
						父节点
					</th>
					<td><select name="sysRight.rightParentCode"><option value="">--请选择父节点--</option>
							<option value=""></option>
							<option value="L01">营销管理</option>
							<option value="L0101">销售机会管理</option>
							<option value="L0102">客户开发计划</option>
							<option value="L02">客户管理</option>
							<option value="L0201">客户信息管理</option>
							<option value="L0202">客户流失管理</option>
							<option value="L03">服务管理</option>
							<option value="L0301">服务创建</option>
							<option value="L0302">服务分配</option>
							<option value="L0303">服务处理</option>
							<option value="L0304">服务反馈</option>
							<option value="L0305">服务归档</option>
							<option value="L04">统计报表</option>
							<option value="L0401">客户贡献分析</option>
							<option value="L0402">客户构成分析</option>
							<option value="L0403">客户服务分析</option>
							<option value="L0404">客户流失分析</option>
							<option value="L05">基础数据</option>
							<option value="L0501">数据字典管理</option>
							<option value="L0502">查询产品信息</option>
							<option value="L0503">查询库存</option>
							<option value="L06">权限管理</option>
							<option value="L0601">用户管理</option>
							<option value="L0602">角色管理</option>
							<option value="L0603">权限信息管理</option></select>
					</td>
				</tr>
				<tr>
					<th>
						权限文本
					</th>
					<td>
						<input type="text" name="sysRight.rightText" value="营销管理" id="rightText">
						<span class="red_star" id="textSpan">*</span>
					</td>
					<th>
						权限URL
					</th>
					<td>
						<input type="text" name="sysRight.rightUrl" value=" " id="rightUrl">
						<span class="red_star" id="urlSpan">*</span>
					</td>
					<th>权限描述</th>
					<td>
						<textarea name="sysRight.rightTip">营销管理</textarea>
					</td>
				</tr>
			</table>
			<script>
				build_validate("sysRight.rightCode","编号不能为空","Limit","1","50");
				build_validate("sysRight.rightParentCode","父节点不能为空?","Limit","1","50");
				build_validate("sysRight.rightText","权限文本不能为空","Limit","1","50");
			</script>
		</form>
	</body>
</html>
