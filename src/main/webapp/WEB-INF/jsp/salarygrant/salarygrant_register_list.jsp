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
	</head>
	<body>
		<form method="post" action="salarygrant.do">
			<table width="100%">
				<tr>
					<td colspan="2">
						<font color="#0000CC">您正在做的业务是：人力资源--薪酬标准管理--薪酬发放登记(负责人控制)
						</font>
						<br/><br/> 
					</td>
				</tr>
				<tr>
					<td colspan="2">
					薪酬单编号：${myId }
					<input type="hidden"  name="salary_grant_id" value=" ${myId }" readonly="readonly"  >
					</td>					
				</tr>
				<tr>
					<td>
			    	总人数:${sum }
			    	<input type="hidden"  name="human_amount" value="${sum }">
			    	，基本薪酬总数:${money }
			    	<input type="hidden"  name="salary_standard_sum"  value="${money }">
					</td>
					<td  align="right">
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
					<td width="15%" class="TD_STYLE1">
						<span>I级机构名称</span>
					</td>
					<td width="15%" class="TD_STYLE1">
						<span>II级机构名称</span>
					</td>
					<td width="15%" class="TD_STYLE1">
						<span>III级机构名称</span>
					</td>	
					<td width="10%" class="TD_STYLE1">
						<span>人数</span>

					</td>
					<td width="20%" class="TD_STYLE1">
						基本薪酬总额(元)
						
					</td>					
					<td width="15%" class="TD_STYLE1">
						登记
					</td>
				</tr>
				<c:forEach  items="${ HF }" var="list"  varStatus="status" >
					<tr class="TD_STYLE2">
						<td>
							${status.count}
						</td>
						<td>
						<input type="text"
					name="first_kind_name" class="INPUT_STYLE2" value="${list.first_kind_name }" readonly="true" />
							<input type="hidden"  name="first_kind_id"  value="${list.first_kind_id }">
						</td>
						<c:choose>
						<c:when test="${ FFFS==1}">
						   <td></td>
						   <td></td>
						</c:when><c:when test="${ FFFS==2}">
						  <td>
						<input type="text"
					name="second_kind_name" class="INPUT_STYLE2" value="${list.second_kind_name }" readonly="true" />
							<input type="hidden"  name="second_kind_id"  value="${list.second_kind_id }">
						</td>
						   <td></td>
						</c:when>
						<c:otherwise>
						 <td> 
						  <input type="text"
					      name="second_kind_name" class="INPUT_STYLE2" value=" ${list.second_kind_name}" readonly="true" />
							<input type="hidden"  name="second_kind_id"  value=" ${list.second_kind_id}">
						 </td>
						<td>
						<input type="text"
					name="third_kind_name" class="INPUT_STYLE2" value="${list.third_kind_name }" readonly="true" />
							<input type="hidden"  name="third_kind_id"  value="${list.third_kind_id }">
						</td>
						</c:otherwise>	
						</c:choose>									
						<td>
							${list.humanCount}
						</td>
						<td>
							${list.salarySum}
						</td>
						<c:choose>
						<c:when  test="${ FFFS==1}">
						   <td>	<a href="salarygrant.do?operate=toAdd&firstkindID=${list.first_kind_id }&type=1">登记</a></td>
						</c:when>
						<c:when test="${ FFFS==2}">
						   <td>	<a href="salarygrant.do?operate=toAdd&firstkindID=${list.first_kind_id }&secondkindID=${list.second_kind_id }&type=2">登记</a>
						   </td>
						</c:when>
						<c:otherwise>
						 <td>
						 	<a href="salarygrant.do?operate=toAdd&firstkindID=${list.first_kind_id }&secondkindID=${list.second_kind_id }&thirdkindID=${list.third_kind_id }&type=3">登记</a>
						 </td>
						</c:otherwise>	
						</c:choose>	
					</tr>
					</c:forEach>
				</table>
			<p>
				&nbsp;
			</p>
		</form>
	</body>
</html>
