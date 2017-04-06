<%@ page contentType="text/html; charset=UTF-8" language="java"
	errorPage=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/table.css" type="text/css" />
<title>Better伯乐HR系统用户注册</title>
<style type="text/css">
<!--
.style1 {
	font-size: 18px;
	font-weight: bold;
	color: #660000;
}
-->
</style>
<script type="text/javascript">
function doAdd() {
	document.forms[0].action = document.forms[0].action
			+ "?operate=doAdd";
	document.forms[0].submit();
}
</script>
</head>

<body bgcolor="#E9F8F3">
<form method="post" action="users.do" >
<table width="100%">
  <tr>
    <td height="169" colspan="3" align="center">
      <p >&nbsp;</p>
      <p >&nbsp;</p>
      <p >&nbsp;</p>
      <p class="style1">用户注册</p></td>
  </tr>
  <tr>
  <td width="18%" height="166">&nbsp;</td>
  <td width="62%">
  <table width="95%" border="1" cellpadding=0 cellspacing=1 bordercolorlight=#848284 bordercolordark=#eeeeee class="TABLE_STYLE1">
 
  <tr>
    <td width="20%" class="TD_STYLE1">用户名</td>
    <td width="80%" class="TD_STYLE2">
    	<input type="text" name="UName"  class="INPUT_STYLE1" style="background-color: #DEEBF7">
    </td>
  	
  </tr>
  <tr>
    <td class="TD_STYLE1">真实姓名</td>
    <td class="TD_STYLE2"> 
    	    	<input type="text" name="UTrueName"   class="INPUT_STYLE1" style="background-color: #DEEBF7"> 	
    </td>
  	
  </tr>
  <tr>
    <td class="TD_STYLE1">密码</td>
    <td class="TD_STYLE2">    	    	
   		<input type="password" name="UPassword"  class="INPUT_STYLE1" style="background-color: #DEEBF7">
	</td>
  </tr>
  <tr>
    <td class="TD_STYLE1">确认密码</td>
    <td class="TD_STYLE2"><input name="surPwd" type="password" class="INPUT_STYLE1" style="background-color: #DEEBF7"></td>
  </tr>
  </table>
  </td>
  <td width="20%" >&nbsp;</td>
  </tr>
  <tr>
    <td></td>
    <td align="center"><input type="button" value="注册" class="BUTTON_STYLE1" onclick="javascript:doAdd();"> &nbsp;
      <input type="button" value="返回" onclick="history.back();" class="BUTTON_STYLE1"></td>
	  <td></td>
  </tr>
</table>
</form>
</body>
</html>
