<%@ page contentType="text/html; charset=UTF-8" language="java"
	errorPage=""%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" href="css/table.css" type="text/css">
		<script type="text/javascript" src="javascript/comm/comm.js"></script>
	</head>

	<body>
		<form method="post" action="configpublicchar.do">
			<table width="100%">
				<tr>
					<td>
						<font color="#0000CC">您正在做的业务是：人力资源--客户化设置--人力资源档案管理设置--公共属性设置
						</font>
					</td>
				</tr>
				<tr>
					<td align="right">
						<input type="button" value="添加" class="BUTTON_STYLE1"
							onclick="javascript:toAdd();">
					</td>
				</tr>
			</table>
			<table width="100%" border="1" cellpadding=0 cellspacing=1
				bordercolorlight=#848284 bordercolordark=#eeeeee
				class="TABLE_STYLE1">
				<tr>
					<td width="49%" class="TD_STYLE1">
						属性种类
					</td>
					<td width="44%" class="TD_STYLE1">
						属性名称
					</td>
					<td width="7%" class="TD_STYLE1" align="center">
						删除
					</td>
				</tr>
				<c:forEach items="${ list }" var="configChars"  >
				       <tr>
						 <td class="TD_STYLE2">
							${configChars.attribute_kind}
						</td>
						<td class="TD_STYLE2">
							${configChars.attribute_name }
						</td>
						<td class="TD_STYLE2" align="center">
							<a href="javascript:toDel( ${configChars.pbc_id} )">删除</a>
						</td>
					</tr>
		     </c:forEach> 
		     <tr>
            <td colspan="6">
            <!-- 分页功能 start -->
            <div align="center">
                <font size="2" >共 ${page.totalPageCount} 页</font> <font size="2">第
                ${page.pageNow} 页</font> <a href="${pageContext.request.contextPath}/configpublicchar.do?operate=list&pageNow=1">首页</a>
                <c:choose>
                    <c:when test="${page.pageNow - 1 > 0}">
                        <a href="${pageContext.request.contextPath}/configpublicchar.do?operate=list&pageNow=${page.pageNow - 1}">上一页</a>
                    </c:when>
                    <c:when test="${page.pageNow - 1 <= 0}">
                        <a href="${pageContext.request.contextPath}/configpublicchar.do?operate=list&pageNow=1">上一页</a>
                    </c:when>
                </c:choose>
                <c:choose>
                    <c:when test="${page.totalPageCount==0}">
                        <a href="${pageContext.request.contextPath}/configpublicchar.do?operate=list&pageNow=${page.pageNow}">下一页</a>
                    </c:when>
                    <c:when test="${page.pageNow + 1 < page.totalPageCount}">
                        <a href="${pageContext.request.contextPath}/configpublicchar.do?operate=list&pageNow=${page.pageNow + 1}">下一页</a>
                    </c:when>
                    <c:when test="${page.pageNow + 1 >= page.totalPageCount}">
                        <a href="${pageContext.request.contextPath}/configpublicchar.do?operate=list&pageNow=${page.totalPageCount}">下一页</a>
                    </c:when>
                </c:choose>
                <c:choose>
                    <c:when test="${page.totalPageCount==0}">
                        <a href="${pageContext.request.contextPath}/configpublicchar.do?operate=list&pageNow=${page.pageNow}">尾页</a>
                    </c:when>
                    <c:otherwise>
                        <a href="${pageContext.request.contextPath}/configpublicchar.do?operate=list&pageNow=${page.totalPageCount}">尾页</a>
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
