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

</head>
<body>
<form method="post" action="engageresume.do">
<table width="100%" >
  <tr>
    <td colspan="2"> 
    <font color="#0000CC">您正在做的业务是：人力资源--招聘管理--简历管理--简历登记</font></td>
  </tr>
  <tr>
   <td width="59%">照片和附件已经上传完毕。如需更改，请重新上传，否则请选择"完成"</td>
    <td width="41%" align="right">
    <input type="button" value="上传照片" class="BUTTON_STYLE1" onclick="toUpLoadPhoto();">
	<input type="button" value="上传附件" class="BUTTON_STYLE1" onclick="toUpLoadAttach();">
      <input type="button" value="完成" class="BUTTON_STYLE1" onclick="javascrip:finish();"></td>
  </tr>
  </table>

</form>
</body>
</html>
