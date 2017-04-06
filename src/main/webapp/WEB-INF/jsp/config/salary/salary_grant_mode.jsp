<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
	<base href="<%=basePath %>">
		<link rel="stylesheet" href="css/table.css"
			type="text/css"></link>
			<script type="text/javascript">
		function doAdd(){
			document.forms[0].action = document.forms[0].action + "?operate=doAdd";
	 		document.forms[0].submit();
		}		

</script>
	</head>
	

	<body>
	
		<form action="configsalarygrantmode.do" method="post">
		
			<table width="100%">
				<tr>
					<td>
						<font color="#0000CC">您正在做的业务是：人力资源--客户化设置--薪酬管理设置--薪酬发放方式设置
						</font>
					</td>
				</tr>
				<tr>
					<td align="right">
						<input type="button" value="添加" class="BUTTON_STYLE1" onclick="javascript:doAdd()">
					</td>
				</tr>
			</table>
			<table width="100%" border="1" cellpadding=0 cellspacing=1
				bordercolorlight=#848284 bordercolordark=#eeeeee
				class="TABLE_STYLE1">
				<tr>
					<td width="27%" class="TD_STYLE1">
						薪酬发放方式
					</td>
					<td width="22%" class="TD_STYLE1">
						<select class="INPUT_STYLE2" name="attribute_name" >
							<option value="一级机构发放方式">一级机构发放方式</option>
							<option value="二级机构发放方式">二级机构发放方式</option>
							<option value="三级机构发放方式">三级机构发放方式</option>
						</select>
					</td>
					<td width="60%" class="TD_STYLE1"></td>
			</table>
		</form>
	</body>
</html>
