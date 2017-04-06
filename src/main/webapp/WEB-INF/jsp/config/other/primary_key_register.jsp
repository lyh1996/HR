<%@ page contentType="text/html; charset=UTF-8" language="java"
	errorPage=""%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" href="css/table.css" type="text/css">
		<script type="text/javascript">
 	function selAll(obj)
 	{
 		var cho = document.all.choice.value;
 		if(cho == "全选")
 			document.all.choice.value = "取消";
 		else
 			document.all.choice.value = "全选";
 			
 		 for(var i=0;i<obj.elements.length;i++){
 			if(obj.elements[i].tagName.toLowerCase()=="input" &&obj.elements[i].type=="checkbox"){
 				if(cho == "全选")
 					obj.elements[i].checked=true;
 				else
 					obj.elements[i].checked=false;
 			}
 		}
 	}
 	function doRegister()
 	{
 		document.forms[0].action = document.forms[0].action + "?operate=doRegister";
		document.forms[0].submit();
 	}
</script>
	</head>

	<body>
		<form action="configprimarykey.do" method="post">
			<table width="100%">
				<tr>
					<td>
						<font color="#0000CC">您正在做的业务是：人力资源--客户化设置--其他设置--关键字查询设置</font>
					</td>
				</tr>
				<tr>
					<td align="right">
						<input type="button" value="提交" class="BUTTON_STYLE1" onclick="doRegister();">
						<input type="button" value="返回" class="BUTTON_STYLE1"
							onclick="history.back();">
					</td>
				</tr>
			</table>
			<table width="100%" border="1" cellpadding=0 cellspacing=1
				bordercolorlight=#848284 bordercolordark=#eeeeee
				class="TABLE_STYLE1">
				<tr class="TR_STYLE1">
					<td class="TD_STYLE1" colspan="4">
						请选择用于关键字查询的字段&nbsp;
						<input type="button" name="choice" value="全选"
							class="BUTTON_STYLE1" onclick="selAll(this.form)">
								<input type="hidden" name="primary_key_table" value="${tableName }" />
					</td>
				</tr>
				
					<c:forEach  items="${list }"  varStatus="status" var="list">
					<c:if test="${status.count%4==0 }">
						<tr></tr>
					</c:if>  
					<td class="TD_STYLE2">
    					<input type="checkbox"   value="${list.prk_id}" name="prk_id"/>
    						 ${list.key_name} 
					</td>
					</c:forEach>
				</table>		
		</form>
	</body>
</html>

<iframe  width=0 height=0></iframe>
