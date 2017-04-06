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
		<link rel="stylesheet" href="css/table.css" type="text/css" >
		<link rel="stylesheet" type="text/css" media="all"
			href="javascript/calendar/calendar-win2k-cold-1.css" >
		<script type="text/javascript" src="javascript/calendar/cal.js" charset="utf-8"></script>
		<script type="text/javascript" src="javascript/comm/comm.js" charset="utf-8"></script>
		<script type="text/javascript" src="javascript/comm/jquery-1.12.4.js"></script>
 
 
	</head>
	<body>
		<form method="post" action="majorchange.do">
			<table width="100%">
				<tr>
					<td>
						<font color="#0000CC">您正在做的业务是：人力资源--调动管理--调动查询</font>
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
					<td class="TD_STYLE1" width="11%">
						档案编号
					</td>
					<td colspan="7"  width="%" class="TD_STYLE1">
						  ${list.human_id} 
					</td>
				</tr>
				<tr>
					<td class="TD_STYLE1" width="11%">
						原I级机构
					</td>
					<td width="14%" class="TD_STYLE2">
		 				 ${list.first_kind_name } 
						
					</td>
					<td width="11%" class="TD_STYLE1">
						原II级机构
					</td>
					<td width="14%" class="TD_STYLE2">
					${list.second_kind_name }
						
					</td>
					<td width="11%" class="TD_STYLE1">
						原III级机构
					</td>
					<td width="14%" class="TD_STYLE2">
					${list.third_kind_name }
						  
						  
					</td>
					<td width="11%" class="TD_STYLE1">
						姓名
					</td>
					<td width="14%" class="TD_STYLE2">
					${list.human_name }
						  
					</td>
				</tr>
				<tr>
					<td class="TD_STYLE1">
						原职位分类
					</td>
					<td class="TD_STYLE2">
					${list.major_kind_name }
						 
					</td>
					<td class="TD_STYLE1">
						原职位名称
					</td>
					 <td class="TD_STYLE2">
					 ${list.major_name }
						 
					</td>
					 <td class="TD_STYLE1">
						原薪酬标准
					</td>
					 <td class="TD_STYLE2" >
					${list.salary_standard_name }
						 
					</td>
					<td class="TD_STYLE1">
						&nbsp;
					</td>
					<td class="TD_STYLE2">
						&nbsp;
					</td>
				</tr>
				<tr>
					 <td class="TD_STYLE1" width="11%">
						新I级机构
					</td>
					<td width="14%" class="TD_STYLE2">
						 ${list.new_first_kind_name }
					</td>
					<td width="11%" class="TD_STYLE1">
						新II级机构
					</td>
					<td width="14%" class="TD_STYLE2">
						  ${list.new_second_kind_name }
					</td>
					<td width="11%" class="TD_STYLE1">
						新III级机构
					</td>
					<td class="TD_STYLE2" >
						   ${list.new_third_kind_name }
					</td>
					<td class="TD_STYLE1">
						&nbsp;
					</td>
					<td class="TD_STYLE2">
						&nbsp;
					</td>
				</tr>
				<tr>
					 <td class="TD_STYLE1">
						新职位分类
					</td>
					<td class="TD_STYLE2">
						 ${list.new_major_kind_name }
					</td>
					<td class="TD_STYLE1">
						新职位名称
					</td>
					<td class="TD_STYLE2">
					 ${list.new_major_name }
						 
					</td>
					<td class="TD_STYLE1">
						新薪酬标准
					</td>
					<td class="TD_STYLE2">
						  ${list.salary_standard_name }
					</td>
					<td class="TD_STYLE1">
						&nbsp;
					</td>
					<td class="TD_STYLE2">
						&nbsp;
					</td>
				</tr>
				<tr>
				<td class="TD_STYLE1">
						登记人
					</td>
					<td class="TD_STYLE2">
						   ${list.register }
					</td>
					<td class="TD_STYLE1">
						登记时间
					</td>
					<td class="TD_STYLE2">
					  ${list.regist_time }
					</td>
					<td class="TD_STYLE1">
					审核人
					</td>
					<td class="TD_STYLE2">
						 ${list.checker }
					</td>
					<td class="TD_STYLE1">
						审核时间
					</td>
					<td class="TD_STYLE2">
						  ${list.check_time }
					</td>
				</tr>
				<tr>
					<td class="TD_STYLE1">
						调动原因
					</td>
					<td colspan="7" class="TD_STYLE2">
							   ${list.change_reason }
					</td>
				</tr>
				<tr>
					<td class="TD_STYLE1">
						审核意见
					</td>
					<td colspan="7" class="TD_STYLE2">
							 ${list.check_reason }
					</td>
				</tr>
			</table>
		</form>
	</body>
<script type="text/javascript">
Calendar.setup ({inputField : "date_start", ifFormat : "%Y-%m-%d", showsTime : false, button : "date_start", singleClick : true, step : 1});
Calendar.setup ({inputField : "date_end", ifFormat : "%Y-%m-%d", showsTime : false, button : "date_end", singleClick : true, step : 1});
</script>
</html>

<!-- <iframe  width=0 height=0></iframe> -->
