<%@ page contentType="text/html; charset=UTF-8" language="java" errorPage="" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" href="css/table.css" type="text/css" >
<script type="text/javascript" src="javascript/comm/comm.js"></script>
</head>
<body>
<form method="post" action="humanfile.do" enctype="multipart/form-data">
<table width="100%" >
  <tr>
    <td colspan="2"> 
    <font color="#0000CC">您正在做的业务是：人力资源--人力资源档案管理--人力资源档案复核</font></td>
  </tr>
  <tr>
    <td width="59%">照片和附件已经上传完毕。如需更改，请重新上传，否则请选择"完成"</td>
    <td width="41%" align="right">
    <input type="button" value="上传照片" class="BUTTON_STYLE1" onclick="toUpLoadPhoto2('check');">
	<input type="button" value="上传附件" class="BUTTON_STYLE1" onclick="toUpLoadAttach2('check');">
      <input type="button" value="完成" class="BUTTON_STYLE1" onclick="finish2();"></td>
  </tr>
  </table>

</form>
</body>
</html>
<iframe  width=0 height=0></iframe>
