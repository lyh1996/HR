<%@ page contentType="text/html; charset=utf-8" language="java"
	 errorPage=""%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<link rel="stylesheet" href="css/table.css" type="text/css">
		<link rel="stylesheet" type="text/css" media="all"
			href="javascript/calendar/calendar-win2k-cold-1.css">
		<script type="text/javascript" src="javascript/calendar/cal.js"></script>
		<script type="text/javascript" src="javascript/comm/comm.js"></script>
		<script type="text/javascript">
			function reback()
			{
				document.forms[0].action = document.forms[0].action + "?operate=passList&method=register&passStatus=0&pageNow=1";
				document.forms[0].submit();
			}
		</script>
</head>

<body>
<form action="engageresume.do" method="post">
<table width="100%" >
  <tr>
    <td colspan="2"> 
    <font color="#0000CC">您正在做的业务是：人力资源--招聘管理--录用管理--录用申请  </font></td>
  </tr>
  <tr>
    <td align="right">
      <div align="left">申请，请返回。
    </div></td>
    <td align="right"><input type="button" class="BUTTON_STYLE1" value="返回" onclick="javascript:reback();"></td>
  </tr>
  </table>
  </form>
</body>
</html>