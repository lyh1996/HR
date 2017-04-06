<%@ page contentType="text/html; charset=UTF-8" language="java" import="java.util.*"
	errorPage=""%>
	<%@ page isELIgnored="false"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" href="css/table.css" type="text/css">
		<script type="text/javascript">
function totraining(id)
{
	document.forms[0].action = document.forms[0].action + "?operate=toTraining&id=" + id;
	document.forms[0].submit();
}
</script>
	</head>

	<body>
	<form action="training.do" method="post">
		<table width="100%">
			<tr>
				<td>
					<font color="#0000CC">您正在做的业务是：人力资源--培训管理--培训登记 </font>
				</td>
			</tr>
			<tr>
				<td>
					符合条件的人力资源总数：<%=((java.util.List)request.getAttribute("list")).size() %>例
				</td>
			</tr>
		</table>

		<table width="100%" border="1" cellpadding=0 cellspacing=1
			bordercolorlight=#848284 bordercolordark=#eeeeee class="TABLE_STYLE1">
			<tr class="TR_STYLE1">
				<td width="20%" class="TD_STYLE1">
					档案编号
				</td>
				<td width="7%" class="TD_STYLE1">
					姓名
				</td>
				<td width="8%" class="TD_STYLE1">
					性别
				</td>
				<td width="12%" class="TD_STYLE1">
					I级机构
				</td>
				<td width="12%" class="TD_STYLE1">
					II级机构
				</td>
				<td width="12%" class="TD_STYLE1">
					III级机构
				</td>
				<td width="14%" class="TD_STYLE1">
					职称
				</td>
				<td width="9%" class="TD_STYLE1">
					登记
				</td>
			</tr>
			<c:forEach items="${ list }" var="list"  >
				       <tr class="TR_STYLE1">
				<td class="TD_STYLE2">
					<a href="humanfile.do?operate=query&id=${list.huf_id}">${list.human_id}</a>
				</td>
				<td class="TD_STYLE2">
					${list.human_name}
				</td>
				<td class="TD_STYLE2">
					${list.human_sex}
				</td>
				<td class="TD_STYLE2">
					${list.first_kind_name}
				</td>
				<td class="TD_STYLE2">
					${list.second_kind_name}
				</td>
				<td class="TD_STYLE2">
					${list.third_kind_name}
				</td>
				<td class="TD_STYLE2">
					${list.human_pro_designation}
				</td>
				<td class="TD_STYLE2">
					<a href="javascript:totraining(${list.human_id })">登记</a>
				</td>
			</tr>
		     </c:forEach> 
			  <tr>
            <td colspan="11">
            <!-- 分页功能 start -->
            <div align="center">
                <font size="2" >共 ${page.totalPageCount} 页</font> <font size="2">第
                ${page.pageNow} 页</font> <a href="${pageContext.request.contextPath}/training.do?operate=list&pageNow=1">首页</a>
                <c:choose>
                    <c:when test="${page.pageNow - 1 > 0}">
                        <a href="${pageContext.request.contextPath}/training.do?operate=list&pageNow=${page.pageNow - 1}">上一页</a>
                    </c:when>
                    <c:when test="${page.pageNow - 1 <= 0}">
                        <a href="${pageContext.request.contextPath}/training.do?operate=list&pageNow=1">上一页</a>
                    </c:when>
                </c:choose>
                <c:choose>
                    <c:when test="${page.totalPageCount==0}">
                        <a href="${pageContext.request.contextPath}/training.do?operate=list&pageNow=${page.pageNow}">下一页</a>
                    </c:when>
                    <c:when test="${page.pageNow + 1 < page.totalPageCount}">
                        <a href="${pageContext.request.contextPath}/training.do?operate=list&pageNow=${page.pageNow + 1}">下一页</a>
                    </c:when>
                    <c:when test="${page.pageNow + 1 >= page.totalPageCount}">
                        <a href="${pageContext.request.contextPath}/training.do?operate=list&pageNow=${page.totalPageCount}">下一页</a>
                    </c:when>
                </c:choose>
                <c:choose>
                    <c:when test="${page.totalPageCount==0}">
                        <a href="${pageContext.request.contextPath}/training.do?operate=list&pageNow=${page.pageNow}">尾页</a>
                    </c:when>
                    <c:otherwise>
                        <a href="${pageContext.request.contextPath}/training.do?operate=list&pageNow=${page.totalPageCount}">尾页</a>
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
