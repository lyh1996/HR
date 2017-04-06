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
			<script type="text/javascript">
function tolist()
{
	document.forms[0].action = document.forms[0].action + "?operate=toReadLocate";
	document.forms[0].submit();
}
 
</script>
	</head>
	<body>
		<form   method="post" action="engageAnswer.do">
			<table width="100%">
				<tr>
					<td>
						<font color="#0000CC">您正在做的业务是:人力资源--招聘管理--招聘考试管理--考试阅卷</font>
					</td>
				</tr>
				 <tr>
    <td width="49%"> 自动阅卷成功！</td>
    <td width="51%" align="right">
    <input type="button" value="返回" class="BUTTON_STYLE1" onclick="javascript:tolist();"></td></tr>
			</table>
		</form>
	</body>

</html>

