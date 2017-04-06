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
		<script type="text/javascript" src="javascript/comm/comm.js" charset="utf-8"></script>
		<title>无标题文档</title>
		<style type="text/css">

.style3 {color: #0000CC}

</style>
	</head>

	<body>
		<form method="post" action="salarygrant.do">
			<table width="100%">
				<tr>
					<td>
						<font color="#0000CC">您正在做的业务是:人力资源管理--薪酬发放管理--薪酬发放查询</font>
					</td>
				</tr>
				<tr>
					<td colspan="2" align="right">
					<input type="button" value="返回" onclick="history.back();" class="BUTTON_STYLE1">
					</td>
				</tr>
				<tr>
					<td colspan="2">
					薪酬单编号：${salary_grant_id }
					</td>					
				</tr>
				<tr>
					<td colspan="2">
					 机构：${firstKindName  }/${secondKindName  }/ ${ thirdKindName}

					</td>					
				</tr>
				<tr>
					<td>
					本机构总人数:<%=((java.util.List)request.getAttribute("list1")).size() %>，基本薪酬总数:${BaseSalaryTotal}，实发薪酬总数:${PaySalaryTotal}
					</td>
					<td align="right">
						 <c:choose>
							<c:when test="${list2.check_status ==0}">
      							 复核人: 暂无
								 复核时间 :暂无
    						</c:when>
							<c:when test="${list2.check_status ==1}">
       							 复核人 :${list2.checker }
								 复核时间 :${list2.check_time }
   							 </c:when>
   							 </c:choose>
				</tr>
			</table>
			<table width="100%" border="1" cellpadding=0 cellspacing=1
				bordercolorlight=#848284 bordercolordark=#eeeeee
				class="TABLE_STYLE1">
				<tr>
					<td class="TD_STYLE1">
						<span>序号</span>
					</td>
					<td class="TD_STYLE1">
						<span>档案编号</span>
					</td>
					<td class="TD_STYLE1">
						<span>姓名</span>
					</td>
						<c:forEach items="${list3 }" varStatus="status" var="standard">
								<td class="TD_STYLE1">							
									${standard.item_name}
								</td>				
						</c:forEach>
					<td class="TD_STYLE1">
						奖励金额
					</td>
					<td class="TD_STYLE1">
						销售绩效总额
					</td>
					<td class="TD_STYLE1">
						应扣金额
					</td>
				</tr>
				<c:forEach  items="${list1}" varStatus="status" var="a">
				
						<tr class="TD_STYLE2">
						
						<td>
							${status.count}
						</td>
						<td>
							${a.human_id}			
						</td>
						<td>
							${a.human_name}
						</td>
						<c:forEach items="${list3 }" varStatus="status" var="standard2" >
								<td class="TD_STYLE1">							
									${standard2.salary}
								</td>				
						</c:forEach>
										<td> 
											 ${a.bouns_sum } 
										</td>
										<td>
											 ${a.sale_sum } 
										</td>
										<td>
										 ${a.deduct_sum } 
										</td>
					</tr>
					</c:forEach>
			</table>		
		</form>
	</body>
</html>
