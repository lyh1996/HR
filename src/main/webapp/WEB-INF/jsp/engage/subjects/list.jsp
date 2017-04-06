<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<link rel="stylesheet" href="css/table.css" type="text/css">
		<link rel="stylesheet" type="text/css" media="all"
			href="javascript/calendar/calendar-win2k-cold-1.css">
		<script type="text/javascript" src="javascript/calendar/cal.js"></script>
		<script type="text/javascript" src="javascript/comm/comm.js"></script>
		<script type="text/javascript" src="javascript/comm/time.js"></script>
		<script type="text/javascript">
			function toDetail(id)
			{
				document.forms[0].action = document.forms[0].action + "?operate=toDetail&id=" + id;
				document.forms[0].submit();
			}
</script>
	</head>

	<body>
		<form action="engagesubjects.do" method="post">
			<table width="100%">
				<tr>
					<td>
						<font color="#0000CC">您正在做的业务是：人力资源--招聘管理--招聘考试题库管理--试题查询 </font>
					</td>
				</tr>
				<tr>
					<td>
						符合条件的试题总数：<%=((List)(request.getAttribute("list"))).size() %>例
					</td>
				</tr>
			</table>

			<table width="100%" border="1" cellpadding=0 cellspacing=1
				bordercolorlight=#848284 bordercolordark=#eeeeee
				class="TABLE_STYLE1">
				<tr class="TR_STYLE1">
					<td class="TD_STYLE1">
						题干
					</td>
					<td class="TD_STYLE1">
						试题I级分类
					</td>
					<td class="TD_STYLE1">
						试题II级分类
					</td>
					<td class="TD_STYLE1">
						登记人
					</td>
					<td class="TD_STYLE1">
						登记日期
					</td>
					<td class="TD_STYLE1">
						出处
					</td>
					<td class="TD_STYLE1">
						正确答案
					</td>
					<td class="TD_STYLE1">
						变更
					</td>
					<td class="TD_STYLE1">
						查看详情
					</td>
					<td class="TD_STYLE1">
						删除
					</td>
				</tr>
					<c:forEach items="${ list }" var="list"  >
				       <tr class="TR_STYLE1">
						<td class="TD_STYLE2">
							${list.content}
						</td>
						<td class="TD_STYLE2">
							${list.first_kind_name }
						</td>
						<td class="TD_STYLE2">
							${list.second_kind_name }
						</td>
						<td class="TD_STYLE2">
							${list.register }
						</td>
						<td class="TD_STYLE2">
							${list.regist_time }
						</td>
						<td class="TD_STYLE2">
							${list.derivation }
						</td>
						<td class="TD_STYLE2">
							${list.correct_key }
						</td>
						 <td class="TD_STYLE2">
							<a href="javascript:toEdit(${list.sub_id})">变更</a>
						</td>
						<td class="TD_STYLE2">
							<a href="javascript:toDetail(${list.sub_id})">查看详情</a>
						</td>
						<td class="TD_STYLE2">
							<a href="javascript:toDel(${list.sub_id})">删除</a>
						</td>
					</tr>
		     </c:forEach> 
			</table>
		</form>
	</body>
</html>
