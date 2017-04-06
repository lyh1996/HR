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
		<link rel="stylesheet" href="css/table.css"
			type="text/css"></link>
	</head>

	<body>
		<form   method="post" action="engageAnswer.do">
			<table width="100%">
				<tr>
					<td>
						<font color="#0000CC">您正在做的业务是：人力资源--招聘管理--招聘考试管理--考试成绩筛选 </font>
					</td>
				</tr>

				<tr>
					<td align="right">
						<input type="button" value="返回" class="BUTTON_STYLE1" onclick="history.back();">
					</td>
				</tr>
			</table>
			<table width="100%" border="1" cellpadding=0 cellspacing=1
				bordercolorlight=#848284 bordercolordark=#eeeeee
				class="TABLE_STYLE1">				
				<tr>
					<td class="TD_STYLE1"  width="10%">
						姓名
					</td>
					<td class="TD_STYLE2" width="30%">
						${list.human_name }
					</td>
					<td  width="10%" class="TD_STYLE1">
						身份证号码
					</td>
					<td  class="TD_STYLE2">
						${list.human_idcard }
					</td>
				</tr>
				<tr>
					<td class="TD_STYLE1" width="14%">
						试卷编号
					</td>
					<td  class="TD_STYLE2">
					${list.exam_number }
					</td>
					<td width="14%"  class="TD_STYLE1">
						答题用时
					</td>
					<td  class="TD_STYLE2">
						${list.use_time }
					</td>
				</tr>
				</table>
				<c:forEach items="${list2 }" var="list2" varStatus="s">
				<table width="100%" border="1" cellpadding=0 cellspacing=1
				bordercolorlight=#848284 bordercolordark=#eeeeee
				class="TABLE_STYLE1">
				<tr>
					<td class="TD_STYLE1" colspan="4">
						${list2.eSubjects.first_kind_name }/${list2.eSubjects.second_kind_name }
					</td>
				</tr>
				<tr>
					<td class="TD_STYLE2" colspan="4">
						${s.count}.${list2.eSubjects.content }<br>
						A.${list2.eSubjects.key_a } &nbsp;
						B.${list2.eSubjects.key_b }&nbsp;
						C.${list2.eSubjects.key_c }&nbsp;
						D.${list2.eSubjects.key_d }&nbsp;
						E.${list2.eSubjects.key_e }&nbsp;<br>
						正确答案: ${list2.eSubjects.correct_key } 
						<c:choose>
							<c:when test="${list2.answer!=null&&list2.answer!='' }">
							<c:choose>
								<c:when test="${list2.answer.toLowerCase() eq list2.eSubjects.correct_key.toLowerCase()}">
									应试者答案： ${list2.answer } 
								</c:when>
								<c:otherwise>
									应试者答案：<font color="red" size="3">${list2.answer }</font>
								</c:otherwise>
							</c:choose>
							</c:when>
							<c:otherwise>
							应试者答案：<font color="red" size="3">没有选择</font>
						</c:otherwise>
						</c:choose>
					</td>
				</tr>
			</table>
			</c:forEach>
		</form>
	</body>
</html>

