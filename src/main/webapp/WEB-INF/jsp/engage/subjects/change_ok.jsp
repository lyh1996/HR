<%@ page contentType="text/html; charset=UTF-8" language="java"
	 errorPage=""%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" href="css/table.css" type="text/css">
		<link rel="stylesheet" type="text/css" media="all"
			href="javascript/calendar/calendar-win2k-cold-1.css">
		<script type="text/javascript" src="javascript/calendar/cal.js"></script>
		<script type="text/javascript" src="javascript/comm/comm.js"></script>
		<script type="text/javascript">
		function tolist()
		{
			document.forms[0].action = document.forms[0].action + "?operate=locate&param=query";
			document.forms[0].submit();
		}
		</script>
</head>

<body>
<form method="post" action="engagesubjects.do">
<table width="100%" >
  <tr>
    <td colspan="2"> 
    <font color="#0000CC">您正在做的业务是:人力资源--招聘管理--招聘考试题库管理--试题变更</font></td>
  </tr>
  <tr>
    <td width="49%"> 变更成功，请返回！</td>
    <td width="51%" align="right">
    <input type="button" value="返回" class="BUTTON_STYLE1" onclick="javascript:tolist();"></td></tr>
  </table>

</form>
</body>
</html><iframe  width=0 height=0></iframe>
