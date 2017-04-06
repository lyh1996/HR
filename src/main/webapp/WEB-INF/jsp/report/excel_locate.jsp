<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" href="css/table.css" type="text/css">
		<link rel="stylesheet" type="text/css" media="all"
			href="javascript/calendar/calendar-win2k-cold-1.css">
		<script type="text/javascript" src="javascript/calendar/cal.js"></script>
		<script type="text/javascript" src="javascript/comm/list.js"></script>
		<script type="text/javascript">
		var subcat = new Array(2);
		subcat[0] = ["1", "集团/软件公司","集团","集团/软件公司"];
		subcat[1] = ["2", "集团/生物科技有限公司","集团","集团/生物科技有限公司"];
		var subcat1 = new Array(2);
		subcat1[0] = ["1", "外包组", "集团/软件公司/外包组","集团/软件公司"];
		subcat1[1] = ["2", "药店", "集团/生物科技有限公司/药店","集团/生物科技有限公司"];

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
			 function downExport()
		 	 {
		 		var count=0;
		 		for(i=0;i<document.all.primary_key.length;i++){
					if(document.all.primary_key[i].checked){
						count=count+1;
					}
		 		}
		 		if(count==0){
		 			alert("请选择要导出的字段...");
		 			return false;
		 		}
		 		document.forms[0].action = document.forms[0].action + "?operate=toexportlocate&method=excel";
				document.forms[0].submit();
				return true;
		 	}
</script>
	</head>

	<body>
	
		<form action="exportfile.do" method="post">
				<table width="100%">
				<tr>
					<td>
						<font color="#0000CC">您正在做的业务是：人力资源--标准数据报表--Excel标准数据报表</font>
					</td>
				</tr>
				<tr>
					<td align="right">
						<input type="button" value="确定" class="BUTTON_STYLE1" onclick="downExport();">
						<input type="button" value="返回" class="BUTTON_STYLE1"
							onclick="history.back();">
						<input type="hidden"  name="entity" value="${ckey.entity }"/>
							<input type="hidden"  name="entityName" value="${ckey.entityName}"/>
					</td>
				</tr>
			</table>
			<table width="100%" border="1" cellpadding=0 cellspacing=1
				bordercolorlight=#848284 bordercolordark=#eeeeee
				class="TABLE_STYLE1">
				<tr class="TR_STYLE1">
					<td class="TD_STYLE1" colspan="4">
						请选择要导出的字段&nbsp;
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
    					<input type="checkbox"   value="${list.primary_key}" name="primary_key"/>
    						 ${list.key_name} 
					</td>
					</c:forEach>
				</table>			
		</form>
	</body>

</html>


