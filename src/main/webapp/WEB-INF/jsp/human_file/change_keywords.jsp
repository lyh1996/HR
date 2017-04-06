<%@ page contentType="text/html; charset=UTF-8" language="java" errorPage="" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/table.css" type="text/css">
<script type="text/javascript">
	function doStart()
	{
		document.forms[0].action = document.forms[0].action + "?operate=doSearch&method=change";
		document.forms[0].submit();
	}
</script>
</head>

<body><form action="humanfile.do" method="post">
<table width="100%" >
  <tr>
    <td> 
    <font color="#0000CC">您正在做的业务是：人力资源--人力资源档案管理--人力资源档案查询</font></td>
  </tr>
  <tr>
    <td align="right">
	<input type="button" value="开始" class="BUTTON_STYLE1" onclick="javascript:doStart();">
      <input type="button" value="返回" class="BUTTON_STYLE1" onclick="history.back();"></td>
  </tr>
</table>
  <table width="100%" border="1" cellpadding=0 cellspacing=1 bordercolorlight=#848284 bordercolordark=#eeeeee class="TABLE_STYLE1">
  <tr class="TR_STYLE1">
    <td width="16%" class="TD_STYLE1"> 请输入查询条件</td>
    <td> <select class="TD_STYLE1" name="human_id">
    <option value="1">按姓名查询</option>
    <option value="0">按编号查询</option>
    </select></td>
    <td width="84%" class="TD_STYLE2"><input type="text"  name="human_name" class="TD_STYLE1" onkeydown="if(event.keyCode==13) return false;" /></td>
  </tr>
</table>
</form>
</body>
</html>
<iframe  width=0 height=0></iframe>
