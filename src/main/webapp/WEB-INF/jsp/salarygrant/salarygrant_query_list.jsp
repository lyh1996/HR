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
	<base href="<%=basePath %>">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<script type="text/javascript" src="javascript/comm/comm.js" charset="utf-8"></script>
		<link rel="stylesheet" href="css/table.css" type="text/css" />
		<title>无标题文档</title>
		<style type="text/css">
<!--
.style3 {color: #0000CC}
-->
</style>
<script type="text/javascript">
	function toQueryAll(id) {
		document.forms[0].action = document.forms[0].action
				+ "?operate=toQueryAll&id=" + id;
		document.forms[0].submit();
	}
</script>
	</head>

	<body>
		<form method="post"  action="salarygrant.do">
			<table width="100%">
				<tr>
					<td>
						<font color="#0000CC">您正在做的业务是:人力资源管理--薪酬发放管理--薪酬发放查询</font>
					</td>
				</tr>
				<tr>
					<td>
						&nbsp;
					</td>
				</tr>
				<tr>
					<td>
					</td>
				</tr>
			</table>
			<table width="100%" border="1" cellpadding=0 cellspacing=1
				bordercolorlight=#848284 bordercolordark=#eeeeee
				class="TABLE_STYLE1">
				<tr>
					<td width="10%" class="TD_STYLE1">
						<span>薪酬编号</span>
					</td>
					<td  class="TD_STYLE1">
						<span>I级机构名称</span>
					</td>
					<td  class="TD_STYLE1">
						<span>II级机构名称</span>
					</td>
					<td  class="TD_STYLE1">
						<span>III级机构名称</span>
					</td>
					<td  class="TD_STYLE1">
						<span>总人数</span>
					</td>
					<td  class="TD_STYLE1">
						基本薪酬总额(元)
					</td>
					<td  class="TD_STYLE1">
						实发薪酬总额(元)
					</td>
					<td  class="TD_STYLE1">
						复核状态
					</td>
					<td  class="TD_STYLE1">
						查看
					</td>
					<td  class="TD_STYLE1">
						删除
					</td>
				
				</tr>
                   <c:forEach  items="${list }" var="a">
					<tr class="TD_STYLE2">
						<td align="center">
							  ${a.salary_grant_id}
						</td>
						<td>
							${a.first_kind_name}
						</td>
						<td>
					    	${a.second_kind_name}
						</td>
						<td>
					    	${a.third_kind_name}
						</td>
						<td>
						${a.human_amount}
						</td>
						<td>
								${a.salary_standard_sum}
						</td>	
						<td>
								${a.salary_paid_sum}
						</td>
						<td class="TD_STYLE2"> 
						  <c:choose>
							<c:when test="${a.check_status== 0}">
      								未复核
    						</c:when>
							<c:when test="${a.check_status ==1}">
       								复核
   							 </c:when>
   							 </c:choose>
							 </td>
						<td class="TD_STYLE2"><a
						href="javascript:toQueryAll('${a.salary_grant_id}')">查看详情</a></td>
					<td class="TD_STYLE2"><a
						href="javascript:toDel('${a.salary_grant_id}')">删除</a></td>				
					</tr>	
				</c:forEach>		
			</table>
					</form>
	</body>
</html>
