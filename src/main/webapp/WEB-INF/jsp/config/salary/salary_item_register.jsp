<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
	<base href="<%=basePath%>">
		<link rel="stylesheet" href="css/table.css"
			type="text/css"></link>
	</head>
<script type="text/javascript">
		function check(){
			if (document.getElementById("aa").value==""){
				alert("薪酬项目名称不能为空!!!");
				return false;
			}
			document.forms[0].action = document.forms[0].action + "?operate=doAdd";
			document.forms[0].submit();
		}		

</script>
	<body>
		<form action="configsalarydesign.do" method="post">
			<table width="100%">
				<tr>
					<td>
						<font color="#0000CC">您正在做的业务是：人力资源--客户化设置--薪酬管理设这--薪酬项目设置
						</font>
					</td>
				</tr>
				<tr>
					<td align="right">
						<input type="button" value="提交" class="BUTTON_STYLE1"  onclick="check()">
						<input type="button" value="返回" class="BUTTON_STYLE1"
							onclick="history.back();">
					</td>
				</tr>
			</table>

			<table width="100%" border="1" cellpadding=0 cellspacing=1
				bordercolorlight=#848284 bordercolordark=#eeeeee
				class="TABLE_STYLE1">
				<tr>
					<td class="TD_STYLE1"  width="19%">
						薪酬项目名称
					</td>
					<td class="TD_STYLE2" width="81%">
						<input type="text"  id="aa" name=attribute_name class="INPUT_STYLE1"/>
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>
