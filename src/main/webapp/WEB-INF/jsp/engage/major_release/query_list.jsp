<%@ page contentType="text/html; charset=utf-8" language="java"
	errorPage=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<link rel="stylesheet" href="css/table.css" type="text/css">
		<script type="text/javascript">
			function toApply(id)
			{
				document.forms[0].action = "engageresume.do?operate=toApply&id="+id;
				document.forms[0].submit();
			}
			function toCheck(id)
			{	
				document.forms[0].action = document.forms[0].action + "?operate=toCheck&id="+id;
				document.forms[0].submit();
			}
		</script>
	</head>

	<body>
		<form action="engagemajorrelease.do" method="post">
		<table width="100%">
			<tr>
				<td>
					<font color="#0000CC">您正在做的业务是：人力资源--招聘管理--职位发布管理--职位发布查询 </font>
				</td>
			</tr>
			<tr>
				<td>
					符合条件的职位发布总数：<%=((java.util.List)request.getAttribute("list")).size() %>例
				</td>
			</tr>
		</table>
		<table width="100%" border="1" cellpadding=0 cellspacing=1
			bordercolorlight=#848284 bordercolordark=#eeeeee class="TABLE_STYLE1">
			<tr class="TR_STYLE1">
				<td width="15%" class="TD_STYLE1">
					职位名称
				</td>
				<td width="10%" class="TD_STYLE1">
					机构名称
				</td>
				<td width="10%" class="TD_STYLE1">
					招聘人数
				</td>
				<td width="20%" class="TD_STYLE1">
					发布时间
				</td>
				<td width="20%" class="TD_STYLE1">
					截止时间
				</td>
				<td width="15%" class="TD_STYLE1">
					申请该职位
				</td>
				<td width="10%" class="TD_STYLE1">
					查看详情
				</td>
			</tr>
			<c:forEach items="${ list }" var="list"  >
				  <tr>
					<td class="TD_STYLE2">
						${list.major_kind_name}/${list.major_name}
					</td>
					<td class="TD_STYLE2">
						${list.second_kind_name }
					</td>
					<td class="TD_STYLE2">
						${list.human_amount }
					</td>
					<td class="TD_STYLE2">
						${list.regist_time }
					</td>
					<td class="TD_STYLE2">
						<font color="red">${list.deadline }</font>
					</td>
					<td class="TD_STYLE2">
						<a href="javascript:toApply('${list.mre_id}')">申请该职位</a>
					</td>
					<td class="TD_STYLE2">
						<a href="javascript:toCheck('${list.mre_id}')">查看详情</a>
					</td>
				</tr>
		     </c:forEach>
		      <tr>
            <td colspan="6">
            <!-- 分页功能 start -->
            <div align="center">
                <font size="2" >共 ${page.totalPageCount} 页</font> <font size="2">第
                ${page.pageNow} 页</font> <a href="${pageContext.request.contextPath}/engagemajorrelease.do?operate=list&pageNow=1">首页</a>
                <c:choose>
                    <c:when test="${page.pageNow - 1 > 0}">
                        <a href="${pageContext.request.contextPath}/engagemajorrelease.do?operate=list&pageNow=${page.pageNow - 1}">上一页</a>
                    </c:when>
                    <c:when test="${page.pageNow - 1 <= 0}">
                        <a href="${pageContext.request.contextPath}/engagemajorrelease.do?operate=list&pageNow=1">上一页</a>
                    </c:when>
                </c:choose>
                <c:choose>
                    <c:when test="${page.totalPageCount==0}">
                        <a href="${pageContext.request.contextPath}/engagemajorrelease.do?operate=list&pageNow=${page.pageNow}">下一页</a>
                    </c:when>
                    <c:when test="${page.pageNow + 1 < page.totalPageCount}">
                        <a href="${pageContext.request.contextPath}/engagemajorrelease.do?operate=list&pageNow=${page.pageNow + 1}">下一页</a>
                    </c:when>
                    <c:when test="${page.pageNow + 1 >= page.totalPageCount}">
                        <a href="${pageContext.request.contextPath}/engagemajorrelease.do?operate=list&pageNow=${page.totalPageCount}">下一页</a>
                    </c:when>
                </c:choose>
                <c:choose>
                    <c:when test="${page.totalPageCount==0}">
                        <a href="${pageContext.request.contextPath}/engagemajorrelease.do?operate=list&pageNow=${page.pageNow}">尾页</a>
                    </c:when>
                    <c:otherwise>
                        <a href="${pageContext.request.contextPath}/engagemajorrelease.do?operate=list&pageNow=${page.totalPageCount}">尾页</a>
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
