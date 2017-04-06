<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="../../table.css" type="text/css">
<script type="text/javascript">
	function doExport(name)
	{
		document.forms[0].action = "<%=path %>/recordAction!Xml.action";
		document.forms[0].submit();
	}
</script>
</head>

<body>
<form  method="post">
<table width="100%" >
  <tr>
    <td colspan="2"> 
    <font color="#0000CC">您正在做的业务是：人力资源--标准数据报表--XML标准数据报表  </font></td>
  </tr>
 <tr class="TR_STYLE1">
    <td width="18%"> 请选择数据库表的名称</td>
    <td width="69%">
    <select name="item.primaryKeyTable" class="SELECT_STYLE2">
      <option value="HumanFile">人力资源档案</option>
      <option value="SalaryStandard">薪酬标准</option>
      <option value="SalaryGrant">薪酬发放</option>
      <option value="MajorChange">调动管理</option>
    </select>
    </td>
	<td width="13%">
	<input type="button" value="确定" class="BUTTON_STYLE1" onclick="doExport('');">
      <input type="button" value="返回" class="BUTTON_STYLE1">
	 </td>
  </tr>
  </table>
  </form>
</body>
 <script type="text/javascript">
  	function check(){
  		var value=document.getElementById("TableName").value;
  		if(value==0){
  			window.alert("你还没有选择数据库表的名称!");
  			return ;
  		}else{
  			document.forms[0].submit();
  		}
  	}
  </script>
</html>