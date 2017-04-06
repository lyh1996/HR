<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/table.css" type="text/css">
<script type="text/javascript">
	function doExports()
	{
		document.forms[0].action = document.forms[0].action + "?operate=doexport&method=excel";
		document.forms[0].submit();
	}
</script>
</head>

<body>

<table width="100%" >
  <tr>
    <td colspan="2"> 
    <font color="#0000CC">您正在做的业务是：人力资源--标准数据报表--Excel标准数据报表  </font></td>
  </tr>
 </table>
<form action="exportfile.do" method="post">
<table width="100%" border="0">
  <tr class="TR_STYLE1">
    <td width="18%"> 请选择数据库表的名称</td>
    <td width="69%">
    <select name="primary_key_table" class="SELECT_STYLE2">
    <option value="human_file">人力资源档案</option>
      <option value="salary_standard">薪酬标准</option>
      <option value="salary_grant">薪酬发放</option>
      <option value="major_change">调动管理</option>
      <option value="training">培训管理</option>
      <option value="bonus">激励管理</option>
    </select>
    </td>
	<td width="13%">
	<input type="button" value="确定" class="BUTTON_STYLE1" onclick="javascript:doExports();">
      <input type="button" value="返回" class="BUTTON_STYLE1">
	 </td>
  </tr>
</table>
</form>
</body>
</html>