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
		<link rel="stylesheet" href="css/table.css" type="text/css" />
		<title>无标题文档</title>
		<style type="text/css">
<!--
.style3 {color: #0000CC}
-->
</style>
	</head>

	<body>
		<form method="post" action="salarygrant.do">
			<table width="100%">
				<tr>
					<td>
						<font color="#0000CC">您正在做的业务是:人力资源管理--薪酬发放管理--薪酬发放登记审核</font>					
						<br/><br/><br/>
					</td>
				</tr>
				<tr>
					<td colspan="2">
					薪酬单编号：HS10000000003
					</td>					
				</tr>
				<tr>
					<td>
                     总人数:${sum2}，基本薪酬总数:${money2 }，实发薪酬总数:${paymoney }
					</td>
				</tr>
			</table>
									
			<table width="100%" border="1" cellpadding=0 cellspacing=1
				bordercolorlight=#848284 bordercolordark=#eeeeee
				class="TABLE_STYLE1">
				<tr>
					<td width="10%" class="TD_STYLE1">
						<span>序号</span>
					</td>
					<td width="12%" class="TD_STYLE1">
						<span>I级机构名称</span>
					</td>
					<td width="12%" class="TD_STYLE1">
						<span>II级机构名称</span>
					</td>
						<td width="12%" class="TD_STYLE1">
						<span>III级机构名称</span>
					</td>
					<td width="12%" class="TD_STYLE1">
						<span>人数</span>
					</td>
					<td width="12%" class="TD_STYLE1">
						基本薪酬总额(元)
					</td>
					<td width="12%" class="TD_STYLE1">
						实发薪酬总额(元)
					</td>
					<td width="10%" class="TD_STYLE1">
						复核
					</td>
				</tr>
				<c:forEach items="${selectSg }"  varStatus="status" var="list">
					<tr class="TD_STYLE2">
						<td>
							${status.count}
						</td>
						<td>
							${list.first_kind_name}
						</td>
						<td>
							${list.second_kind_name}
						</td>
						<td>
							${list.third_kind_name}
						</td>
						<td>
							${list.totalCount}
						</td>
						<td>
							${list.totalstandardsum}
						</td>
						<td>
							${list.totalpaysum}
						</td>
						 <td>
						 <a href="salarygrant.do?operate=docheck&salaryGrantId=${list.salary_grant_id}">复核</a>
						 </td>
				    </tr>
				    </c:forEach>
			</table>
			
				
		</form>
	</body>
</html>