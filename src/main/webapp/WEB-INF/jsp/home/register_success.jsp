<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>

<script type="text/javascript">
	function login() {
		document.forms[0].action = document.forms[0].action
				+ "?operate=toLogin";
		document.forms[0].submit();
	}
	



</script>
<body>
	注册成功！

	
	
	<form method="post" action="users.do">
		
			
					<input type="button" value="前去登录" class="BUTTON_STYLE1" onclick="javascript:login();">
					
			
		

	</form>
</body>
</html>