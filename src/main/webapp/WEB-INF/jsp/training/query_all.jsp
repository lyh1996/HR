<%@ page contentType="text/html; charset=UTF-8" language="java" errorPage="" %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<%
	//添加基底网址(只使用.jsp页面)
	String path = request.getContextPath();//doubanTeacher
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<html>
<head>
	<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="javascript/comm/comm.js" charset="utf-8"></script>
<link rel="stylesheet" type="text/css" media="all"
			href="javascript/calendar/calendar-win2k-cold-1.css" >
		<script type="text/javascript" src="javascript/calendar/cal.js" charset="utf-8"></script>
<link rel="stylesheet" href="css/table.css" type="text/css" />
<script type="text/javascript">
function tolist()
{
	document.forms[0].action = document.forms[0].action + "?operate=queryAll&pageNow=1";
	document.forms[0].submit();
}
</script>

<title>无标题文档</title>
</head>

<body>
	<form name="form1" method="post" action="training.do">
		<table width="100%">
			<tr>
				<td width="100%"><font color="#0000CC">您正在做的业务是:人力资源管理--培训管理--培训查询</font></td>
			</tr>
			<tr>
				<td><div align="right">
						 <input type="button" value="返回" class="BUTTON_STYLE1" onclick="javascript:tolist();">
					</div></td>
			</tr>
		</table>
		<table width="100%" border="1" cellpadding=0 cellspacing=1
			bordercolorlight=#848284 bordercolordark=#eeeeee class="TABLE_STYLE1">
			<tr>
				<td width="11%" class="TD_STYLE1">档案编号</td>
				<td  class="TD_STYLE2">${list.human_id }</td>
					<td width="11%" class="TD_STYLE1">培训时间</td>
					<td width="13%" class="TD_STYLE2">
					${list.training_time }
					</td>
					 <c:choose>
							<c:when test="${list.checkstatus== 0}">
      							<td width="11%" class="TD_STYLE1">复核人</td>
							<td width="13%" class="TD_STYLE2">
								暂无
							</td>
								<td width="11%" class="TD_STYLE1">复核时间</td>
								<td width="13%" class="TD_STYLE2">
									暂无
								</td>
    						</c:when>
							<c:when test="${list.checkstatus ==1}">
       							<td width="11%" class="TD_STYLE1">复核人</td>
								<td width="13%" class="TD_STYLE2">
										${list.checker }
								</td>
								<td width="11%" class="TD_STYLE1">复核时间</td>
								<td width="13%" class="TD_STYLE2">
										${list.check_time }
								</td>
   							 </c:when>
   							 </c:choose>
			</tr>
			<tr>
				<td class="TD_STYLE1">姓名</td>
				<td width="11%" class="TD_STYLE2">
				${list.human_name }</td>
				<td width="12%" class="TD_STYLE1">职位分类</td>
				<td width="14%" class="TD_STYLE2">
				${list.major_kind_name}
				 </td>
				<td width="11%" class="TD_STYLE1">职位名称</td>
				<td width="11%" class="TD_STYLE2">
				${list.major_name }
				</td>
				<td width="11%" class="TD_STYLE1">培训项目</td>
				<td width="14%" class="TD_STYLE2">
					${list.training_item }
				 </td>
			</tr>
			<tr>
				<td height="20" class="TD_STYLE1">培训课时</td>
				<td class="TD_STYLE2">
				${list.training_hour }
				</td>
				<td class="TD_STYLE1">培训成绩</td>
				<td class="TD_STYLE2">
						${list.training_degree } 
				 </td>
				<td class="TD_STYLE1">登记人</td>
				<td class="TD_STYLE2">
				${list.register } 
				 </td>
				<td class="TD_STYLE1">登记时间</td>
				<td class="TD_STYLE2"> 
				${list.regist_time } 
				 </td>
			</tr>
			<tr>
				<td class="TD_STYLE1">备注</td>
				<td colspan="7" class="TD_STYLE2">
				${list.remark } 
			 
			</tr>
		</table>
	</form>
</body>
 
</html>
<iframe width=0 height=0></iframe>
