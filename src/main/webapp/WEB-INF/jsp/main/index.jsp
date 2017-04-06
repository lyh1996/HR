<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>欢迎使用源辰人力资源管理系统</title>
<script language="JavaScript" type="text/JavaScript">
<!--
	function MM_reloadPage(init) { //reloads the window if Nav4 resized
		if (init == true)
			with (navigator) {
				if ((appName == "Netscape") && (parseInt(appVersion) == 4)) {
					document.MM_pgW = innerWidth;
					document.MM_pgH = innerHeight;
					onresize = MM_reloadPage;
				}
			}
		else if (innerWidth != document.MM_pgW
				|| innerHeight != document.MM_pgH)
			location.reload();
	}
	MM_reloadPage(true);
	//--
</script>

<Script>
	function onClose() {

		if (window.screenTop > 10000) {
			var targeturl = "auto_logout.jsp"
			newwin = window.open("", "", "scrollbars,Toolbar=yes")
			if (document.all) {
				newwin.moveTo(0, 0)
				newwin.resizeTo(80, 60)
			}
			newwin.location = targeturl
		}
	}
	window.onunload = onClose
</Script>
</head>

<frameset rows="69,*,20" framespacing="1" border="1"
	onunload="onClose()">
	<frame src="index_top" name="top" scrolling="no"
		marginwidth="1" marginheight="1" frameborder="0">
	<frameset cols="200,*" frameborder="NO" border="0" framespacing="0">
		<frame src="index_left" name="left" scrolling="yes" noresize>
		<frame src="index_right" name="mainFrame">
	</frameset>
	<frame src="index_bottom" name="bottom" frameborder="0"
		scrolling="no" marginwidth="1" marginheight="1">
	<noframes>
		<body topmargin="0" leftmargin="0" bgcolor="#b5daff">
		</body>
	</noframes>
</frameset>
</html>
