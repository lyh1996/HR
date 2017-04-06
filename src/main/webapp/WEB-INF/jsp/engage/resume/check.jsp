<%@ page contentType="text/html; charset=UTF-8" language="java" errorPage="" %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<%@ page import="java.util.*"%> <!-- //获取系统时间必须导入的  -->
<%@ page import="java.text.*"%> <!-- //获取系统时间必须导入的  -->
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" href="css/table.css" type="text/css" >
		<link rel="stylesheet" type="text/css" media="all"
			href="javascript/calendar/calendar-win2k-cold-1.css">
		<script type="text/javascript" src="javascript/calendar/cal.js"></script>
		<script type="text/javascript" src="javascript/comm/comm.js"></script>
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
					<font color="#0000CC">您正在做的业务是：人力资源--招聘管理--简历管理--简历筛选 </font>
				</td>
			</tr>
			<tr>
				<td align="right">
					<input type="button" class="SUBMIT_STYLE1" value="推荐面试" onclick="javascript:doEdit('${list.res_id }');">
					<input type="button" class="BUTTON_STYLE1" value="返回" onclick="history.back()">
				</td>
			</tr>
		</table>
			<table class="TABLE_STYLE1" border="1" width="100%" cellpadding=0
				cellspacing=1 bordercolorlight=#848284 bordercolordark=#eeeeee>
				<tr class="TR_STYLE1">
					<td width="8%" class="TD_STYLE1">
						职位分类
					</td>
					<td width="17%" class="TD_STYLE2">
						${list.human_major_kind_name}
					</td>
					<td width="9%" class="TD_STYLE1">
						职位名称
					</td>
					<td width="17%" class="TD_STYLE2">
						${list.human_major_name}
					</td>
					<td width="8%" class="TD_STYLE1">
						招聘类型
					</td>
					<td colspan="2" class="TD_STYLE2">
						${list.engage_type}
					</td>
					<td width="13%" rowspan="6">
						<img src="${list.human_picture}" style="width: 185px ;height: 143px"></img>
					</td>
				</tr>
				<tr>
					<td class="TD_STYLE1">
						姓名
					</td>
					<td class="TD_STYLE2">
						<input type="text" name="human_name" class="INPUT_STYLE2" value="${list.human_name }">
					</td>
					<td class="TD_STYLE1">
						性别
					</td>
					<td class="TD_STYLE2">
						<select Class="SELECT_STYLE1" name="human_sex" ">
							<option value="男"  <c:if test="${list.human_sex == '男' }">selected="selected"</c:if>>男</option>
							<option value="女"  <c:if test="${list.human_sex == '女' }">selected="selected"</c:if>>女</option>
						</select>
					</td>
					<td class="TD_STYLE1">
						E-MAIL
					</td>
					<td class="TD_STYLE2" colspan="2">
						<input type="text" name="human_email" class="INPUT_STYLE2" value="${list.human_email }">
					</td>
				</tr>
				<tr>
					<td class="TD_STYLE1">
						电话
					</td>
					<td class="TD_STYLE2">
						<input type="text" name="human_telephone" class="INPUT_STYLE2" value="${list.human_telephone}">
					</td>
					<td class="TD_STYLE1">
						家庭电话
					</td>
					<td class="TD_STYLE2">
						<input type="text" name="human_homephone" class="INPUT_STYLE2" value="${list.human_homephone}">
					</td>
					<td class="TD_STYLE1">
						手机
					</td>
					<td class="TD_STYLE2" colspan="2">
						<input type="text" name="human_mobilephone" class="INPUT_STYLE2" value="${list.human_mobilephone}">
					</td>
				</tr>
				<tr>
					<td class="TD_STYLE1">
						住址
					</td>
					<td colspan="3" class="TD_STYLE2">
						<input type="text" name="human_address" class="INPUT_STYLE2" value="${list.human_address}">
					</td>
					<td class="TD_STYLE1">
						邮编
					</td>
					<td class="TD_STYLE2" colspan="2">
						<input type="text" name="human_postcode" class="INPUT_STYLE2" value="${list.human_postcode}">
					</td>
				</tr>
				<tr>
					<td class="TD_STYLE1">
						国籍
					</td>
					<td class="TD_STYLE2">
						<select Class="SELECT_STYLE1"
							name="human_nationality">
							<c:forEach items="${ nationality }" var="country">
								<option value="${country.attribute_name }" <c:if test="${list.human_nationality == country.attribute_name }">selected="selected"</c:if>>${country.attribute_name }</option>
							</c:forEach>
						</select>
					</td>
					<td class="TD_STYLE1">
						出生地
					</td>
					<td class="TD_STYLE2">
						<input type="text" name="human_birthplace" class="INPUT_STYLE2" value="${list.human_birthplace }">
					</td>
					<td class="TD_STYLE1">
						生日
					</td>
					<td class="TD_STYLE2" colspan="2">
						<input type="text" name="human_birthday" class="INPUT_STYLE2" id="date_start" value="${list.human_birthday }"/>
					</td>
				</tr>
				<tr>
					<td class="TD_STYLE1">
						民族
					</td>
					<td class="TD_STYLE2">
						<select Class="SELECT_STYLE1" name="human_race">
							<c:forEach items="${ races }" var="race">
								<option value="${race.attribute_name }" <c:if test="${list.human_race == race.attribute_name }">selected="selected"</c:if>>${race.attribute_name }</option>
							</c:forEach>
						</select>
					</td>
					<td class="TD_STYLE1">
						宗教信仰
					</td>
					<td class="TD_STYLE2">
						<select Class="SELECT_STYLE1"
							name="human_religion">
							<c:forEach items="${ religions }" var="religion">
								<option value="${religion.attribute_name }" <c:if test="${list.human_religion == religion.attribute_name }">selected="selected"</c:if>>${religion.attribute_name }</option>
							</c:forEach>
						</select>
					</td>
					<td class="TD_STYLE1">
						政治面貌
					</td>
					<td class="TD_STYLE2" colspan="2">
						<select Class="SELECT_STYLE1" name="human_party">
							<c:forEach items="${ parties }" var="party">
								<option value="${party.attribute_name }" <c:if test="${list.human_party == party.attribute_name }">selected="selected"</c:if>>${party.attribute_name }</option>
							</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<td class="TD_STYLE1">
						身份证号码
					</td>
					<td class="TD_STYLE2">
						<input type="text" name="human_idcard" class="INPUT_STYLE2" value="${list.human_idcard }">
					</td>
					<td class="TD_STYLE1">
						年龄
					</td>
					<td class="TD_STYLE2">
						<input type="text" name="human_age" class="INPUT_STYLE2" value="${list.human_age }">
					</td>
					<td class="TD_STYLE1" width="8%">
						毕业学校
					</td>
					<td width="13%" class="TD_STYLE2">
						<input type="text" name="human_college" class="INPUT_STYLE2" value="${list.human_college }">
					</td>
					<td width="11%" nowrap class="TD_STYLE1">
						学历
					</td>
					<td>
						<select Class="SELECT_STYLE1" name="human_educated_degree">
							<c:forEach items="${ degrees }" var="degree">
								<option value="${degree.attribute_name }" <c:if test="${list.human_educated_degree == degree.attribute_name }">selected="selected"</c:if>>${degree.attribute_name }</option>
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
							<c:forEach items="${ years }" var="educatedyears">
								<option value="${educatedyears.attribute_name }" <c:if test="${list.human_educated_years == educatedyears.attribute_name }">selected="selected"</c:if>>${educatedyears.attribute_name }</option>
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
								<option value="${educatedmajor.attribute_name }" <c:if test="${list.human_educated_major == educatedmajor.attribute_name }">selected="selected"</c:if>>${educatedmajor.attribute_name }</option>
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
								<option value="${standards.standard_id}/${standards.standard_name }" <c:if test="${list.demand_salary_standard == standards.standard_name} ">selected="selected"</c:if>>${standards.standard_id }/${standards.standard_name }</option>
							</c:forEach>
						</select>
					</td>
					<td class="TD_STYLE1">
						注册时间
					</td>
					<td class="TD_STYLE2">
						<input type="text" name="regist_time" class="INPUT_STYLE2" value="${list.regist_time }">
					</td>
				</tr>
				<tr>
					<td class="TD_STYLE1">
						特长
					</td>
					<td class="TD_STYLE2">
						<select Class="SELECT_STYLE1"
							name="human_specility">
							<c:forEach items="${ specility }" var="specility">
								<option value="${specility.attribute_name }" <c:if test="${list.human_specility == specility.attribute_name }">selected="selected"</c:if>>${specility.attribute_name }</option>
							</c:forEach>
						</select>
					</td>
					<td class="TD_STYLE1">
						爱好
					</td>
					<td class="TD_STYLE2">
						<select Class="SELECT_STYLE1" name="human_hobby">
							<c:forEach items="${ hobby }" var="hobby">
								<option value="${hobby.attribute_name }" <c:if test="${list.human_hobby == hobby.attribute_name }">selected="selected"</c:if>>${hobby.attribute_name }</option>
							</c:forEach>
						</select>
					</td>
					<td class="TD_STYLE1">
						推荐人
					</td>
					<td class="TD_STYLE2">
						<input type="text" name="checker" class="INPUT_STYLE2"  readonly="true" value="${user}" />
					</td>
					<td class="TD_STYLE1">
						推荐时间
					</td>
					<td class="TD_STYLE2">
						<input type="text" name="check_time" readonly="true"  value="${currentTime}" class="INPUT_STYLE2"/>
					</td>
				</tr>
				<tr class="TR_STYLE1">
					<td class="TD_STYLE1">
						档案附件
					</td>
					<td colspan="7" class="TD_STYLE2">
					<c:choose>
	                    <c:when test="${list.attachment_name==null}">
	                      <a href="javascript:void(0)">暂无附件</a>
	                    </c:when>
	                   <c:otherwise>
	                   	<a href="${list.attachment_name }">下载附件</a>
	                    </c:otherwise>
	                </c:choose>
					
					</td>
				</tr>
				<tr>
					<td class="TD_STYLE1">
						个人履历
					</td>
					<td class="TD_STYLE2" colspan="7">
						<textarea name="human_history_records"
						class="TEXTAREA_STYLE1" rows="4">${list.human_history_records}</textarea>
					</td>
				</tr>
				<tr>
					<td class="TD_STYLE1">
						备注
					</td>
					<td class="TD_STYLE2" colspan="7">
						<textarea name="remark" class="TEXTAREA_STYLE1" rows="4">${list.remark}</textarea>
					</td>
				</tr>
				<tr>
					<td class="TD_STYLE1">
						筛选推荐意见
					</td>
					<td class="TD_STYLE2" colspan="7">
						<textarea name="recomandation" class="TEXTAREA_STYLE1" rows="4"></textarea>
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

