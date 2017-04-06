<%@ page contentType="text/html; charset=utf-8" language="java"
	errorPage=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<link rel="stylesheet" href="css/table.css" type="text/css">
		<link rel="stylesheet" type="text/css" media="all"
			href="javascript/calendar/calendar-win2k-cold-1.css">
		<script type="text/javascript" src="javascript/calendar/cal.js"></script>
		<script type="text/javascript" src="javascript/comm/comm.js"></script>
		<script type="text/javascript" src="javascript/comm/time.js"></script>
	</head>

	<body>
	<form action="engageresume.do" method="post">
		<table width="100%">
			<tr>
				<td>
					<font color="#0000CC">您正在做的业务是：人力资源--招聘管理--录用管理--录用申请  </font>
				</td>
			</tr>
			<tr>
				<td>
					当前等待录用申请的简历总数：<%=((java.util.List)request.getAttribute("list")).size() %>例
				</td>
			</tr>
		</table>
			<table width="100%" border="1" cellpadding=0 cellspacing=1
				bordercolorlight=#848284 bordercolordark=#eeeeee
				class="TABLE_STYLE1">
				<tr class="TR_STYLE1">
					<td class="TD_STYLE1">
						姓名
					</td>
					<td class="TD_STYLE1">
						性别
					</td>
					<td class="TD_STYLE1">
						年龄
					</td>
					<td class="TD_STYLE1">
						职位类别
					</td>
					<td class="TD_STYLE1">
						职位名称
					</td>
					<td class="TD_STYLE1">
						毕业院校
					</td>
					<td class="TD_STYLE1">
						学历专业
					</td>
					<td class="TD_STYLE1">
						申请
					</td>
				</tr>
				<c:forEach items="${ list }" var="list"  >
				      <tr>
					<td class="TD_STYLE2">
						${list.human_name }
					</td>
					<td class="TD_STYLE2">
						${list.human_sex }
					</td>
					<td class="TD_STYLE2">
						${list.human_age }
					</td>
					<td class="TD_STYLE2">
						${list.human_major_kind_name }
					</td>
					<td class="TD_STYLE2">
						${list.human_major_name }
					</td>
					<td class="TD_STYLE2">
						${list.human_college }
					</td>
					<td class="TD_STYLE2">
						${list.human_educated_major }
					</td>
					<td class="TD_STYLE2">
						<a href="engageresume.do?operate=topassApply&id=${list.res_id }">申请</a>
					</td>
				</tr>
		     </c:forEach>
		     <tr>
				<td colspan="6">
					<!-- 分页功能 start -->
					<div align="center">
						<font size="2">共 ${page.totalPageCount} 页</font> <font size="2">第
							${page.pageNow} 页</font> <a
							href="${pageContext.request.contextPath}/engageresume.do?operate=passList&method=register&passStatus=0&pageNow=1">首页</a>
						<c:choose>
							<c:when test="${page.pageNow - 1 > 0}">
								<a
									href="${pageContext.request.contextPath}/engageresume.do?operate=passList&method=register&passStatus=0&pageNow=${page.pageNow - 1}">上一页</a>
							</c:when>
							<c:when test="${page.pageNow - 1 <= 0}">
								<a
									href="${pageContext.request.contextPath}/engageresume.do?operate=passList&method=register&passStatus=0&pageNow=1">上一页</a>
							</c:when>
						</c:choose>
						<c:choose>
							<c:when test="${page.totalPageCount==0}">
								<a
									href="${pageContext.request.contextPath}/engageresume.do?operate=passList&method=register&passStatus=0&pageNow=${page.pageNow}">下一页</a>
							</c:when>
							<c:when test="${page.pageNow + 1 < page.totalPageCount}">
								<a
									href="${pageContext.request.contextPath}/engageresume.do?operate=passList&method=register&passStatus=0&pageNow=${page.pageNow + 1}">下一页</a>
							</c:when>
							<c:when test="${page.pageNow + 1 >= page.totalPageCount}">
								<a
									href="${pageContext.request.contextPath}/engageresume.do?operate=passList&method=register&passStatus=0&pageNow=${page.totalPageCount}">下一页</a>
							</c:when>
						</c:choose>
						<c:choose>
							<c:when test="${page.totalPageCount==0}">
								<a
									href="${pageContext.request.contextPath}/engageresume.do?operate=passList&method=register&passStatus=0&pageNow=${page.pageNow}">尾页</a>
							</c:when>
							<c:otherwise>
								<a
									href="${pageContext.request.contextPath}/engageresume.do?operate=passList&method=register&passStatus=0&pageNow=${page.totalPageCount}">尾页</a>
							</c:otherwise>
						</c:choose>

					</div> 
				<!-- 分页功能 End -->
				</td>
			</tr> 
			</table>
		</form>
	</body>
</html>
