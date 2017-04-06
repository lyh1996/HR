<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">


<html>
<head>
 
<link href="css/table.css" rel="stylesheet" /> 
<script type="text/javascript" src="javascript/comm/comm.js"></script>

<title>欢迎进入源辰人事管理系统</title>

<STYLE>
.t {
	LINE-HEIGHT: 1.4
}

BODY {
	FONT-FAMILY: 宋体;
	FONT-SIZE: 9pt;
	SCROLLBAR-HIGHLIGHT-COLOR: buttonface;
	SCROLLBAR-SHADOW-COLOR: buttonface;
	SCROLLBAR-3DLIGHT-COLOR: buttonhighlight;
	SCROLLBAR-TRACK-COLOR: #eeeeee;
	SCROLLBAR-DARKSHADOW-COLOR: buttonshadow;
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	height: 5%;
}

TD {
	FONT-FAMILY: 宋体;
	FONT-SIZE: 9pt
}

DIV {
	FONT-FAMILY: 宋体;
	FONT-SIZE: 9pt
}

FORM {
	FONT-FAMILY: 宋体;
	FONT-SIZE: 9pt
}

P {
	FONT-FAMILY: 宋体;
	FONT-SIZE: 9pt
}

TD {
	FONT-FAMILY: 宋体;
	FONT-SIZE: 9pt
}

BR {
	FONT-FAMILY: 宋体;
	FONT-SIZE: 9pt
}

.style5 {
	color: #CC6699;
	font-family: "Courier New", Courier, mono;
}

.style6 {
	color: #CC9900
}

.style8 {
	color: #CCCCCC
}

.style9 {
	font-family: "幼圆", Times, serif;
	color: #006633;
}
</STYLE>
<script type="text/javascript">
		
	function login() {
		if (infchk()) {
			document.forms[0].action = document.forms[0].action
			+ "?operate=doLogin";
		document.forms[0].submit();
		}
	}
	function toEditPwd() {
		//document.forms[0].action = document.forms[0].action + "?operate=toEditPwd";
		document.forms[0].action = "change_password.jsp";
		document.forms[0].submit();
	}
	function infchk() {
		var name = document.forms[0].elements["UName"];
		var pwd = document.forms[0].elements["UPassword"];
		var num = document.forms[0].elements["validateCode"];

		if (name.value == "") {
			alert("请填写用户名");
			name.focus();
			return false;
		} else if (pwd.value == "") {
			alert("请填写密码");
			pwd.focus();
			return false;
		} else if (num.value == "") {
			alert("请填写验证码");
			num.focus();
			return false;
		} else
			return true;
	}
	//刷新验证码
	function loadImage(){
		var img=document.getElementById("randImg");
		img.src="image.jsp?r="+Math.random();
	}
	
	function change() {
		var ui = document.getElementById("ui").value;
		if (ui == 0) {
			document.getElementById("b").background = "images/8.jpg";
		} else if (ui == 1) {
			document.getElementById("b").background = "images/7.jpg";
		} else {
			document.getElementById("b").background = "images/1.jpg";
		}

	}
</script>
<script type="text/javascript">
function toEditPwd() {
	document.forms[0].action = document.forms[0].action+ "?operate=toEditPwd";
	document.forms[0].submit();
}
</script>
</head>
<body background="images/1.jpg" id="b">
	<table class="TABLE_STYLE2" height="250">
		<tr class="TR_STYLE1">
			<td class="TD_STYLE3">
				<div id="Layer1"
					style="position: absolute; width: 346px; height: 77px; z-index: 1; left: 620px; top: 33px; font-size: 50px; font-weight: bold; font-style: italic;">
					<span class="style6">源</span><span class="style5">辰</span><span
						class="style6">人</span><span class="style9">事
					</span><span class="style8">HR</span>
				</div>
			</td>
		</tr>
	</table>
		
	<form method="post" action="users.do" >
		<table align="center" border="1">
			<tr>
				<td>
					<table width="100%">
						<tr>
							<td colspan="2" align="center"><font color="#30358D"><b>源辰HR&nbsp;v2.0</b>
							</font></td>
						</tr>
						<tr class="TR_STYLE1">
							<td class="TD_STYLE3">
								<p style="line-height: 200%">
									<font color="#30358D"><b>界面风格:</b> </font>
							</td>
							<td><select class="SELECT_STYLE1" name="ui"  id="ui" 
								style="width: 150px" onchange="change()">
									<option value="0">经典型</option>
									<option value="1" selected>时尚型</option>
									<option value="2">非主流</option>
							</select></td>
						</tr>
						<tr class="TR_STYLE1">
							<td class="TD_STYLE3">
								<p style="line-height: 200%">
									<font color="#30358D"><b>用户名:</b> </font>
							</td>
							<td><input type="text" name="UName" value=""
								style="width: 150px"></td>
						</tr>
						<tr class="TR_STYLE1">
							<td class="TD_STYLE3">
								<p style="line-height: 200%">
									<font color="#30358D"><b>密码:</b> </font>
							</td>
							<td><input type="password" name="UPassword" value=""
								style="width: 150px"></td>
						</tr>
						<tr class="TR_STYLE1">
							<td class="TD_STYLE3">
								<p style="line-height: 200%">
									<font color="#30358D"><b>验证码:</b> </font>
							</td>
							<td><input type="text" name="validateCode" value=""
								style="width: 70px"> <img id="randImg" src="image.jsp" border=0
								hspace="5" align="middle"></td>
						</tr>
						<tr class="TR_STYLE1">
							<td class="TD_STYLE3">
								<p style="line-height: 200%">
									<font color="#30358D"><b>&nbsp;</b> </font>
							</td>
							<td align="right"><a
								href="javascript:loadImage();">验证码看不清</a>
							</td>
						</tr>
						<c:if test="${msgImg!='' }">
					<font style="color: red;"><c:out value="${errmsg }"></c:out></font>
	</c:if>
						<tr class="TR_STYLE1">
							<td colspan="2" class="TD_STYLE3">&nbsp;</td>
						</tr>
						<tr class="TR_STYLE1">
							<td colspan="2" class="TD_STYLE3" align="center">
								<p style="line-height: 200%">
									<input type="button" value="登录" class="BUTTON_STYLE1" onclick="javascript:login();">
									 <!-- <input type="button" class="BUTTON_STYLE1" value="注册" onClick="javascript:toAdd();"> -->
									<input type="button" class="BUTTON_STYLE1" value="修改密码" onClick="javascript:toEditPwd();">
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
		<table class="TABLE_STYLE2" height="90">
			<tr class="TR_STYLE1">
				<td class="TD_STYLE3">&nbsp;</td>
			</tr>
		</table>
		<center>
			<table width="80%" height="10%" align="center">
				<tr class="TR_STYLE1">
					<td height="10%" align="center">
						<p class="testonline.style1">
							<br> <font color="#FFFFFF" size="2.5"><b>源辰信息科技有限公司&nbsp;版权所有</b></font>

							
					</td>
				</tr>
			</table>
		</center>
	</form>
</body>
</html>
