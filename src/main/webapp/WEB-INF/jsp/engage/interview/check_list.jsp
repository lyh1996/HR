<%@ page contentType="text/html; charset=utf-8" language="java"
	 errorPage=""%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<link rel="stylesheet" href="css/table.css" type="text/css">
		<link rel="stylesheet" type="text/css" media="all"
			href="javascript/calendar/calendar-win2k-cold-1.css">
		<script type="text/javascript" src="javascript/calendar/cal.js"></script>
		<script type="text/javascript" src="javascript/comm/comm.js"></script>
		<script type="text/javascript" src="javascript/comm/time.js"></script>
		<script type="text/javascript">
			function toEdit(id)
			{
				document.forms[0].action = document.forms[0].action + "?operate=toEdit&id="+id;
				document.forms[0].submit();
			}
		</script>
	</head>

	<body>
		<form action="engageinterview.do" method="post">
			<table width="100%">
				<tr>
					<td>
						<font color="#0000CC">您正在做的业务是：人力资源--招聘管理--面试管理--面试筛选 </font>
					</td>
				</tr>
				<tr>
					<td>
						当前等待筛选的面试总数：<%=((java.util.List)(request.getAttribute("list"))).size() %>例
					</td>
				</tr>
			</table>

			<table width="100%" border="1" cellpadding=0 cellspacing=1
				bordercolorlight=#848284 bordercolordark=#eeeeee
				class="TABLE_STYLE1">
				<tr class="TR_STYLE1">
					<td width="15%" class="TD_STYLE1">
						姓名
					</td>
					<td width="18%" class="TD_STYLE1">
						职位分类
					</td>
					<td width="18%" class="TD_STYLE1">
						职位名称
					</td>
					<td width="10%" class="TD_STYLE1">
						面试次数
					</td>
					<td width="22%" class="TD_STYLE1">
						面试时间
					</td>
					<td width="10%" class="TD_STYLE1">
						综合素质
					</td>
					<td width="7%" class="TD_STYLE1">
						筛选
					</td>
				</tr>
				<c:forEach items="${ list }" var="list"  >
				      <tr>
					<td class="TD_STYLE2">
						${list.human_name }
					</td>
					<td class="TD_STYLE2">
						${list.human_major_kind_name }
					</td>
					<td class="TD_STYLE2">
						${list.human_major_name }
					</td>
					<td class="TD_STYLE2">
						${list.interview_amount }
					</td>
					<td class="TD_STYLE2">
						${list.registe_time }
					</td>
					<td class="TD_STYLE2">
						${list.multi_quality_degree }
					</td>
					<td class="TD_STYLE2">
						<a href="javascript:toEdit('${list.resume_id}')">筛选</a>
					</td>
				</tr>
		     </c:forEach>
			 <tr>
				<td colspan="6">
					<!-- 分页功能 start -->
					<div align="center">
						<font size="2">共 ${page.totalPageCount} 页</font> <font size="2">第
							${page.pageNow} 页</font> <a
							href="${pageContext.request.contextPath}/engageinterview.do?operate=list&pageNow=1">首页</a>
						<c:choose>
							<c:when test="${page.pageNow - 1 > 0}">
								<a
									href="${pageContext.request.contextPath}/engageinterview.do?operate=list&pageNow=${page.pageNow - 1}">上一页</a>
							</c:when>
							<c:when test="${page.pageNow - 1 <= 0}">
								<a
									href="${pageContext.request.contextPath}/engageinterview.do?operate=list&pageNow=1">上一页</a>
							</c:when>
						</c:choose>
						<c:choose>
							<c:when test="${page.totalPageCount==0}">
								<a
									href="${pageContext.request.contextPath}/engageinterview.do?operate=list&pageNow=${page.pageNow}">下一页</a>
							</c:when>
							<c:when test="${page.pageNow + 1 < page.totalPageCount}">
								<a
									href="${pageContext.request.contextPath}/engageinterview.do?operate=list&pageNow=${page.pageNow + 1}">下一页</a>
							</c:when>
							<c:when test="${page.pageNow + 1 >= page.totalPageCount}">
								<a
									href="${pageContext.request.contextPath}/engageinterview.do?operate=list&pageNow=${page.totalPageCount}">下一页</a>
							</c:when>
						</c:choose>
						<c:choose>
							<c:when test="${page.totalPageCount==0}">
								<a
									href="${pageContext.request.contextPath}/engageinterview.do?operate=list&pageNow=${page.pageNow}">尾页</a>
							</c:when>
							<c:otherwise>
								<a
									href="${pageContext.request.contextPath}/engageinterview.do?operate=list&pageNow=${page.totalPageCount}">尾页</a>
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
