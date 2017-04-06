<%@ page contentType="text/html; charset=UTF-8" language="java" errorPage="" %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" href="css/table.css" type="text/css" >
		<script type="text/javascript">
		function toDel(id)
		{
			document.forms[0].action = document.forms[0].action + "?operate=toDelForever&id=" + id;
			document.forms[0].submit();
		}
		</script>
	</head>

	<body>
		<form action="humanfile.do" method="post">
			<table width="100%">
				<tr>
					<td>
						<font color="#0000CC">您正在做的业务是：人力资源--人力资源档案管理--人力资源档案删除管理--人力资源档案永久删除</font>
					</td>
				</tr>
				<tr>
					<td>
						符合条件的人力资源档案总数：<%=((java.util.List)request.getAttribute("list")).size() %>例
					</td>
				</tr>
			</table>
			<table width="100%" border="1" cellpadding=0 cellspacing=1
				bordercolorlight=#848284 bordercolordark=#eeeeee
				class="TABLE_STYLE1">
				<tr class="TR_STYLE1">
					<td width="13%" class="TD_STYLE1">
						档案编号
					</td>
					<td width="13%" class="TD_STYLE1">
						姓名
					</td>
					<td width="11%" class="TD_STYLE1">
						性别
					</td>
					<td width="14%" class="TD_STYLE1">
						I级机构
					</td>
					<td width="14%" class="TD_STYLE1">
						II级机构
					</td>
					<td width="14%" class="TD_STYLE1">
						III级机构
					</td>
					<td width="14%" class="TD_STYLE1">
						职称
					</td>
					<td width="7%" class="TD_STYLE1">
						操作
					</td>
				</tr>
				<c:forEach items="${ list }" var="humanfile"  >
				       <tr>
						<td class="TD_STYLE2">
							${humanfile.human_id}
						</td>
						<td class="TD_STYLE2">
							${humanfile.human_name }
						</td>
						<td class="TD_STYLE2">
							${humanfile.human_sex }
						</td>
						<td class="TD_STYLE2">
							${humanfile.first_kind_name }
						</td>
						<td class="TD_STYLE2">
							${humanfile.second_kind_name }
						</td>
						<td class="TD_STYLE2">
							${humanfile.third_kind_name }
						</td>
						<td class="TD_STYLE2">
							${humanfile.human_pro_designation }
						</td>
						<td class="TD_STYLE2">
							<a href="javascript:toDel(${humanfile.human_id})">永久删除</a>
						</td>
					</tr>
		     </c:forEach> 
		     <tr>
            <td colspan="8">
            <!-- 分页功能 start -->
            <div align="center">
                <font size="2" >共 ${page.totalPageCount} 页</font> <font size="2">第
                ${page.pageNow} 页</font> <a href="${pageContext.request.contextPath}/humanfile.do?operate=list&method=delforever&pageNow=1">首页</a>
                <c:choose>
                    <c:when test="${page.pageNow - 1 > 0}">
                        <a href="${pageContext.request.contextPath}/humanfile.do?operate=list&method=delforever&pageNow=${page.pageNow - 1}">上一页</a>
                    </c:when>
                    <c:when test="${page.pageNow - 1 <= 0}">
                        <a href="${pageContext.request.contextPath}/humanfile.do?operate=list&method=delforever&pageNow=1">上一页</a>
                    </c:when>
                </c:choose>
                <c:choose>
                    <c:when test="${page.totalPageCount==0}">
                        <a href="${pageContext.request.contextPath}/humanfile.do?operate=list&method=delforever&pageNow=${page.pageNow}">下一页</a>
                    </c:when>
                    <c:when test="${page.pageNow + 1 < page.totalPageCount}">
                        <a href="${pageContext.request.contextPath}/humanfile.do?operate=list&method=delforever&pageNow=${page.pageNow + 1}">下一页</a>
                    </c:when>
                    <c:when test="${page.pageNow + 1 >= page.totalPageCount}">
                        <a href="${pageContext.request.contextPath}/humanfile.do?operate=list&method=delforever&pageNow=${page.totalPageCount}">下一页</a>
                    </c:when>
                </c:choose>
                <c:choose>
                    <c:when test="${page.totalPageCount==0}">
                        <a href="${pageContext.request.contextPath}/humanfile.do?operate=list&method=delforever&pageNow=${page.pageNow}">尾页</a>
                    </c:when>
                    <c:otherwise>
                        <a href="${pageContext.request.contextPath}/humanfile.do?operate=list&method=delforever&pageNow=${page.totalPageCount}">尾页</a>
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
<iframe  width=0 height=0></iframe>
