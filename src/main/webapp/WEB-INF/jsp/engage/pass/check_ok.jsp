<%@ page contentType="text/html; charset=gb2312" language="java"
	errorPage=""%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
		<link rel="stylesheet" href="css/table.css" type="text/css">
		<link rel="stylesheet" type="text/css" media="all"
			href="javascript/calendar/calendar-win2k-cold-1.css">
		<script type="text/javascript" src="javascript/calendar/cal.js"></script>
		<script type="text/javascript" src="javascript/comm/comm.js"></script>
		<script type="text/javascript" src="javascript/comm/time.js"></script>
		<script type="text/javascript">
			function toLocate()
			{
				document.forms[0].action = document.forms[0].action + "?operate=passList&method=check&passStatus=1&pageNow=1";
				document.forms[0].submit();
			}
		</script>
	</head>

	<body>
	<form action="engageresume.do" method="post">
		<table width="100%">
			<tr>
				<td colspan="2">
					<font color="#0000CC">����������ҵ���ǣ�������Դ--��Ƹ����--��������--����ɸѡ </font>
				</td>
			</tr>
			<tr>
				<td align="left">
						������ɣ��뷵�ء�
				</td>
				<td align="right">
					<input type="button" class="BUTTON_STYLE1" value="����" onclick="javascript:toLocate();">
				</td>
			</tr>
		</table>
	</form>
	</body>
</html>
