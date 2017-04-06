<%@ page contentType="text/html; charset=utf-8" language="java" errorPage=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<%@ page import="java.util.*"%> <!-- //获取系统时间必须导入的  -->
<%@ page import="java.text.*"%> <!-- //获取系统时间必须导入的  -->
<%
	//添加基底网址(只使用.jsp页面)
	String path = request.getContextPath();//doubanTeacher
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<html>
	<head>
		<base href="<%=basePath%>">
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<link rel="stylesheet" href="css/table.css" type="text/css">
		<link rel="stylesheet" type="text/css" media="all"
			href="javascript/calendar/calendar-win2k-cold-1.css">
		<script type="text/javascript" src="javascript/calendar/cal.js"></script>
		<script type="text/javascript" src="javascript/comm/comm.js"></script>
		<script type="text/javascript" src="javascript/comm/time.js"></script>
		<script type="text/javascript" src="javascript/comm/jquery-1.12.4.js"></script>
		<% 
			String datetime=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(Calendar.getInstance().getTime()); //获取系统时间 
			request.setAttribute("currentTime",datetime);
		%>
	</head>

	<body>
	<form action="engageresume.do" method="post">
		<table width="100%">
			<tr>
				<td>
					<font color="#0000CC">您正在做的业务是：人力资源--招聘管理--简历管理--简历登记 </font>
				</td>
			</tr>
			<tr>
				<td align="right">
					<input type="button" value="提交" class="BUTTON_STYLE1"
						onclick="javascript:toSubmit();">
					<input type="button" value="返回" class="BUTTON_STYLE1" onclick="history.back()">
				</td>
			</tr>
		</table>
		
			<table class="TABLE_STYLE1" border="1" width="100%" cellpadding=0
				cellspacing=1 bordercolorlight=#848284 bordercolordark=#eeeeee>
				<tr class="TR_STYLE1">
					<td width="8%" nowrap class="TD_STYLE1">
						职位分类
					</td>
					<td class="TD_STYLE2" >
							<input type="text" class="INPUT_STYLE2" value="${releases.major_kind_name }" name="human_major_kind_name" readonly="true" />
						<input type="hidden" value="${releases.major_kind_id }" name="human_major_kind_id" readonly="true" />
					</td>
					<td width="9%" class="TD_STYLE1">
						职位名称
					</td>
					<td class="TD_STYLE2">
						<input type="text" class="INPUT_STYLE2" value="${releases.major_name }" name="human_major_name" readonly="true" />
						<input type="hidden" value="${releases.major_id }" name="human_major_id" readonly="true">
					</td>
					<td width="8%"  class="TD_STYLE1">
						招聘类型
					</td>
					<td class="TD_STYLE2" colspan="2">
					<input type="text" class="INPUT_STYLE2" value="${releases.engage_type }" name="engage_type" readonly="true" />							
					</td>
				</tr>
				<tr>
					<td class="TD_STYLE1">
						姓名
					</td>
					<td class="TD_STYLE2">
						<input type="text" name="human_name" class="INPUT_STYLE2">
					</td>
					<td class="TD_STYLE1">
						性别
					</td>
					<td class="TD_STYLE2">
						<select Class="SELECT_STYLE1" name="human_sex">
							<option value="男">男</option>
							<option value="女">女</option>
						</select>
					</td>
					<td class="TD_STYLE1">
						E-MAIL
					</td>
					<td class="TD_STYLE2" colspan="2">
						<input type="text" name="human_email" class="INPUT_STYLE2">
					</td>
				</tr>
				<tr>
					<td class="TD_STYLE1">
						电话
					</td>
					<td class="TD_STYLE2">
						<input type="text" name="human_telephone" class="INPUT_STYLE2">
					</td>
					<td class="TD_STYLE1">
						家庭电话
					</td>
					<td class="TD_STYLE2">
						<input type="text" name="human_homephone" class="INPUT_STYLE2">
					</td>
					<td class="TD_STYLE1">
						手机
					</td>
					<td class="TD_STYLE2" colspan="2">
						<input type="text" name="human_mobilephone" class="INPUT_STYLE2">
					</td>
				</tr>
				<tr>
					<td class="TD_STYLE1">
						住址
					</td>
					<td colspan="3" class="TD_STYLE2">
						<input type="text" name="human_address" class="INPUT_STYLE2">
					</td>
					<td class="TD_STYLE1">
						邮编
					</td>
					<td class="TD_STYLE2" colspan="2">
						<input type="text" name="human_postcode" class="INPUT_STYLE2">
					</td>
				</tr>
				<tr>
					<td class="TD_STYLE1">
						国籍
					</td>
					<td class="TD_STYLE2">
						<select class="SELECT_STYLE1" name="human_nationality">
							<c:forEach items="${nationality }" var="country">
								<option value="${country.attribute_name }">${country.attribute_name }</option>
							</c:forEach>
						</select>
					</td>
					<td class="TD_STYLE1">
						出生地
					</td>
					<td class="TD_STYLE2">
						<input type="text" name="human_birthplace" class="INPUT_STYLE2">
					</td>
					<td class="TD_STYLE1">
						生日
					</td>
					<td class="TD_STYLE2" colspan="2">
						<input type="text" name="human_birthday" class="INPUT_STYLE2" id="date_start" >
					</td>
				</tr>
				<tr>
				<td class="TD_STYLE1">
						民族
				</td>
				<td class="TD_STYLE2">
						<select Class="SELECT_STYLE1" name="human_race">
							<c:forEach items="${races }" var="race">
								<option value="${race.attribute_name }">${race.attribute_name }</option>
							</c:forEach>
						</select>
				</td>
				<td class="TD_STYLE1">
						宗教信仰
				</td>
				<td class="TD_STYLE2">
					<select Class="SELECT_STYLE1"
							name="human_religion">
							<c:forEach items="${religions }" var="religion">
								<option value="${religion.attribute_name }">${religion.attribute_name }</option>
							</c:forEach>
						</select>
					</td>
					<td class="TD_STYLE1">
						政治面貌
					</td>
					<td class="TD_STYLE2" colspan="2">
						<select Class="SELECT_STYLE1" name="human_party">
						<c:forEach items="${ parties }" var="party">
							<option value="${party.attribute_name }">${party.attribute_name }</option>
						</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<td class="TD_STYLE1">
						身份证号码
					</td>
					<td class="TD_STYLE2">
						<input type="text" name="human_idcard" class="INPUT_STYLE2">
					</td>
					<td class="TD_STYLE1">
						年龄
					</td>
					<td class="TD_STYLE2">
						<input type="text" name="human_age" class="INPUT_STYLE2">
					</td>
					<td class="TD_STYLE1" width="8%">
						毕业学校
					</td>
					<td width="13%" class="TD_STYLE2">
						<input type="text" name="human_college" class="INPUT_STYLE2">
					</td>
					<td width="11%" nowrap class="TD_STYLE1">
						学历
					</td>
					<td>
						<select Class="SELECT_STYLE1" name="human_educated_degree">
						<c:forEach items="${degrees}" var="degree">
							<option value="${degree.attribute_name }">${degree.attribute_name }</option>
						</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<td class="TD_STYLE1">
						教育年限
					</td>
					<td class="TD_STYLE2">
						<select  Class="SELECT_STYLE1"
							name="human_educated_years">
							<c:forEach items="${years }" var="educatedyears">
								<option value="${educatedyears.attribute_name }">${educatedyears.attribute_name }</option>
							</c:forEach>
						</select>
					</td>
					<td class="TD_STYLE1">
						学历专业
					</td>
					<td class="TD_STYLE2">
						<select Class="SELECT_STYLE1"
							name="human_educated_major">
							<c:forEach items="${ majors }" var="educatedmajor">
							<option value="${educatedmajor.attribute_name }">${educatedmajor.attribute_name }</option>
						</c:forEach>
						</select>
					</td>
					<td class="TD_STYLE1">
						薪酬要求
					</td>
					<td class="TD_STYLE2">
						<select Class="SELECT_STYLE1"
							name="demand_salary_standard">
								<option value="0/未定义">0/未定义</option>
								<c:forEach items="${ standards }" var="standards">
									<option value="${standards.standard_id}/${standards.standard_name }">${standards.standard_id }/${standards.standard_name }</option>
								</c:forEach>
						</select>
					</td>
					<td class="TD_STYLE1">
						注册时间
					</td>
					<td class="TD_STYLE1">
						<input type="text" name="regist_time" readonly="true"  value="${currentTime}" class="INPUT_STYLE2">
					</td>
				</tr>
				<tr>
					<td class="TD_STYLE1">
						特长
					</td>
					<td class="TD_STYLE2">
						<select Class="SELECT_STYLE1"
							name="human_specility">
							<c:forEach items="${specility }" var="speciality">
								<option value="${speciality.attribute_name }">${speciality.attribute_name }</option>
							</c:forEach>
						</select>
					</td>
					<td class="TD_STYLE1">
						爱好
					</td>
					<td class="TD_STYLE2">
						<select class="SELECT_STYLE1" name="human_hobby">
							<c:forEach items="${hobby }" var="hobby">
							<option value="${hobby.attribute_name }">${hobby.attribute_name }</option>
						</c:forEach>
						</select>
					</td>
					<td class="TD_STYLE1">
						&nbsp;
					</td>
					<td class="TD_STYLE2">
						&nbsp;
					</td>
					<td class="TD_STYLE1">
						&nbsp;
					</td>
					<td class="TD_STYLE1">
						&nbsp;
					</td>
				</tr>
				<tr>
					<td class="TD_STYLE1">
						个人履历
					</td>
					<td class="TD_STYLE2" colspan="7">
						<textarea name="human_history_records" class="TEXTAREA_STYLE1" rows="4" ></textarea>
					</td>
				</tr>
				<tr>
					<td class="TD_STYLE1">
						 备注
					</td>
					<td class="TD_STYLE2" colspan="7">
						<textarea name="remark" class="TEXTAREA_STYLE1" rows="4"></textarea>
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>
<script type="text/javascript">
Calendar.setup ({inputField : "date_start", ifFormat : "%Y-%m-%d", showsTime : false, button : "date_start", singleClick : true, step : 1});
Calendar.setup ({inputField : "date_end", ifFormat : "%Y-%m-%d", showsTime : false, button : "date_end", singleClick : true, step : 1});
</script>
