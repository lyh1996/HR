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
		
		<title>HR</title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link href="css/style.css" rel="stylesheet" type="text/css">
		<script type="text/javascript" src="script/common.js"></script>
	<!-- 	<script src="script/validate.js"></script> -->
 <link rel="stylesheet" type="text/css" href="css/ext-all.css">
<!-- <script type="text/javascript" src="ExtJS/adapter/ext/ext-base.js"></script> -->
<script type="text/javascript" src="script/ext-all.js"></script> 
	</head>
	<script type="text/javascript">
	function mySearch() {
		document.forms[0].action = document.forms[0].action + "?operate=toRight&pageNow=1";
		document.forms[0].submit();
	}
	
	function toEdit(id){
		document.forms[0].action = document.forms[0].action + "?operate=toRightEdit&id="+id;
		document.forms[0].submit();
		}
	</script>
	<body>
		<div class="page_title">
			权限管理 > 权限管理 > 权限查询
		</div>
		
		<form name="sysRightForm" method="post" action="right.do">
			
			<div class="button_bar">
				 
				<button class="common_button" onclick="mySearch();">
					查询
				</button>
			</div>
			<table class="query_form_table">
				<tr>
					<th>
						权限文本
					</th>
					<td>
						<select name="rightText">
						<option value="">--请选择权限文本--</option>
						 <c:forEach items="${list2 }" var="list2">
								<option value="${list2.rightText }">${list2.rightText }</option>
						</c:forEach>
						</select>
					</td>
					<th>
						权限描述
					</th>
					<td>
						<input type="text" name="rightTip" value="">
					</td>
					<th>
						权限类型
					</th>
					<td>
						<select name="rightType">
						<option value="">--请选择权限类型--</option>
							<option value="Folder">Folder </option>
							<option value="Document">Document</option></select>
					</td>
				</tr>
			</table>
			<br />
			<table class="query_form_table">
				<tr>
					<th>
						权限编号
					</th>
					<th>
						权限文本
					</th>
					<th>
						权限父节点
					</th>
					<th>
						权限类型
					</th>
					<th>
						权限描述
					</th>
					<th>
						权限操作
					</th>
				</tr>
				 <c:forEach items="${list }" var="list">
					<tr>
						<td>
							${list.rightCode }
						</td>
						<td>
						${list.rightText }
						</td>
						<td>
							${list.rightParentCode }
						</td>
						<td>
								${list.rightType }
						</td>
						<td>
							${list.rightTip }
						</td>
						<td>
							<img
								onclick="toEdit('${list.rightCode}')"
								title="编辑" src="images/bt_edit.gif" class="op_button" />
							<!-- <img
								onclick="to('sysRight.do?method=toDetailSysRight&rightId=L01');"
								title="查看" src="images/bt_deal.gif" class="op_button" /> -->
							<!-- <img
								onclick="mydel('营销管理','sysRight.do?method=toDeleteSysRight&rightId=L01');"
								title="删除" src="images/bt_del.gif" class="op_button" /> -->
						</td>
					</tr>
				 </c:forEach>
				 <tr>
				<td colspan="6">
					<!-- 分页功能 start -->
					<div align="center">
						<font size="2">共 ${page.totalPageCount} 页</font> <font size="2">第
							${page.pageNow} 页</font> <a
							href="${pageContext.request.contextPath}/right.do?operate=toRight&pageNow=1">首页</a>
						<c:choose>
							<c:when test="${page.pageNow - 1 > 0}">
								<a
									href="${pageContext.request.contextPath}/right.do?operate=toRight&pageNow=${page.pageNow - 1}">上一页</a>
							</c:when>
							<c:when test="${page.pageNow - 1 <= 0}">
								<a
									href="${pageContext.request.contextPath}/right.do?operate=toRight&pageNow=1">上一页</a>
							</c:when>
						</c:choose>
						<c:choose>
							<c:when test="${page.totalPageCount==0}">
								<a
									href="${pageContext.request.contextPath}/right.do?operate=toRight&pageNow=${page.pageNow}">下一页</a>
							</c:when>
							<c:when test="${page.pageNow + 1 < page.totalPageCount}">
								<a
									href="${pageContext.request.contextPath}/right.do?operate=toRight&pageNow=${page.pageNow + 1}">下一页</a>
							</c:when>
							<c:when test="${page.pageNow + 1 >= page.totalPageCount}">
								<a
									href="${pageContext.request.contextPath}/right.do?operate=toRight&pageNow=${page.totalPageCount}">下一页</a>
							</c:when>
						</c:choose>
						<c:choose>
							<c:when test="${page.totalPageCount==0}">
								<a
									href="${pageContext.request.contextPath}/right.do?operate=toRight&pageNow=${page.pageNow}">尾页</a>
							</c:when>
							<c:otherwise>
								<a
									href="${pageContext.request.contextPath}/right.do?operate=toRight&pageNow=${page.totalPageCount}">尾页</a>
							</c:otherwise>
						</c:choose>

					</div> <!-- 分页功能 End -->
				</td>
			</tr>
			</table>
</form>
	</body>
</html>
