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
		
		<title>jb-aptech毕业设计项目</title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link href="css/style.css" rel="stylesheet" type="text/css">
		<script src="script/common.js"></script>
		<script type="text/javascript" src="javascript/comm/jquery-1.12.4.js"></script>
		
		<script type="text/javascript">
		function myAdd(){
  			if($("#rightText").val()==""||$("#rightText").val()==null){
  				alert("请填写权限文本！");
  				return false;
  			}	
  			if($("#rightTip").val()==""||$("#rightTip").val()==null){
  				alert("请填写权限描述！");
  				return false;
  			}	
  			
  			if(confirm("确定要提交吗？")==true){
  				document.forms[0].action = document.forms[0].action + "?operate=doRightEdit&pageNow=1" ;
  				document.forms[0].submit();
  			}
  		}
		</script>
	</head>
	<body>
		<div class="page_title">
			权限管理 > 权限管理 > 编辑权限
		</div>
		<form  method="post" action="right.do">
			<div class="button_bar">
				<input type="button" value="返回" class="common_button" onclick="history.back();">
				<button class="common_button" onclick="myAdd();" type="button">保存</button>
			</div>
			<table class="query_form_table">
				<tr>
					<th>
						编号
					</th>
					<td>
						${list.rightCode }
						<input type="hidden" name="rightCode" value="${list.rightCode }">
					</td>
					<th>
						权限类型
					</th>
					<td>
						 <c:choose>
						 	<c:when test="${list.rightType =='Folder'}">
						 		根节点
						 	</c:when>
						 	<c:when test="${list.rightType =='Document'}">
						 		子节点
						 	</c:when>
						 </c:choose>
					</td>
					<th>
						父节点
					</th>
					<td> 
					${list.rightParentCode }
					</td>
				</tr>
				<tr>
					<th>
						权限文本
					</th>
					<td>
						<input type="text" name="rightText" value="${list.rightText }" id="rightText">
					</td>
					<th>
						权限URL
					</th>
					<td>
					<c:choose>
						 	<c:when test="${list.rightUrl ==''}">
						 		暂无
						 	</c:when>
						 	<c:otherwise>
						 		${list.rightUrl } 
						 	</c:otherwise>
						 </c:choose>
						
					</td>
					<th>权限描述</th>
					<td>
						<textarea name="rightTip" id="rightTip">${list.rightTip }</textarea>
					</td>
				</tr>
			</table>
			 
		</form>
	</body>
</html>
