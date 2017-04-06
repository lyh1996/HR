<%@ page contentType="text/html; charset=utf-8" language="java"	errorPage=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<%@ page import="java.util.*"%> <!-- //获取系统时间必须导入的  -->
<%@ page import="java.text.*"%> <!-- //获取系统时间必须导入的  -->
<%
	//添加基底网址(只使用.jsp页面)
	String path = request.getContextPath();
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
		<script type="text/javascript" src="javascript/comm/time.js"></script>
		<script type="text/javascript">
			function doAdd(id)
			{
				document.forms[0].action=document.forms[0].action+"?operate=doAdd&id="+id;
				document.forms[0].submit();
			}
		</script>	
		<% 
			String datetime=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(Calendar.getInstance().getTime()); //获取系统时间 
			request.setAttribute("currentTime",datetime);
		%>	
	</head>

	<body>
		<form action="engageinterview.do" method="post">
			<table width="100%">
				<tr>
					<td>
						<font color="#0000CC">您正在做的业务是：人力资源--招聘管理--面试管理--面试结果登记 </font>
					</td>
				</tr>
				<tr>
					<td align="right">
						<input type="button" value="提交" class="BUTTON_STYLE1" onclick="javascript:doAdd('${resumes.res_id}');">
						<input type="button" value="返回" class="BUTTON_STYLE1" onclick="history.back();">
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
						<input type="text" class="INPUT_STYLE2" value="${resumes.human_major_kind_name }" name="human_major_kind_name" readonly="true" />
						<input type="hidden" value="${resumes.human_major_kind_id }" name="human_major_kind_id" readonly="readonly" />
					</td>
					<td width="9%" class="TD_STYLE1">
						职位名称
					</td>
					<td width="17%" class="TD_STYLE2">
						<input type="text" class="INPUT_STYLE2" value="${resumes.human_major_name }" name="human_major_name" readonly="readonly" />
						<input type="hidden" value="${resumes.human_major_id }" name="human_major_id" readonly="readonly" >
					</td>
					<td width="8%" nowrap class="TD_STYLE1">
						招聘类型
					</td>
					<td colspan="2" class="TD_STYLE2">
						<input type="text" class="INPUT_STYLE2" value="${resumes.engage_type }"  readonly="readonly" />
					</td>
					<td width="13%" rowspan="6">
						<img src="${resumes.human_picture}" style="width: 185px ;height: 145px" />
					</td>
				</tr>
				<tr>
					<td class="TD_STYLE1">
						姓名
					</td>
					<td class="TD_STYLE2">
						<input type="text" class="INPUT_STYLE2" value="${resumes.human_name }" name="human_name" readonly="readonly" />
					</td>
					<td class="TD_STYLE1">
						性别
					</td>
					<td class="TD_STYLE2">
						<input type="text" class="INPUT_STYLE2" value="${resumes.human_sex }"  readonly="readonly" />
					</td>
					<td class="TD_STYLE1">
						E-MAIL
					</td>
					<td class="TD_STYLE2" colspan="2">
						<input type="text" class="INPUT_STYLE2" value="${resumes.human_email }"  readonly="readonly" />
					</td>
				</tr>
				<tr>
					<td class="TD_STYLE1">
						电话
					</td>
					<td class="TD_STYLE2">
						<input type="text" class="INPUT_STYLE2" value="${resumes.human_telephone }" readonly="readonly" />
					</td>
					<td class="TD_STYLE1">
						家庭电话
					</td>
					<td class="TD_STYLE2">
						<input type="text" class="INPUT_STYLE2" value="${resumes.human_homephone }"  readonly="readonly" />
					</td>
					<td class="TD_STYLE1">
						手机
					</td>
					<td class="TD_STYLE2" colspan="2">
						<input type="text" class="INPUT_STYLE2" value="${resumes.human_mobilephone }"  readonly="readonly" />
					</td>
				</tr>
				<tr>
					<td class="TD_STYLE1">
						住址
					</td>
					<td colspan="3" class="TD_STYLE2">
						<input type="text" class="INPUT_STYLE2" value="${resumes.human_address }"  readonly="readonly"  />
					</td>
					<td class="TD_STYLE1">
						邮编
					</td>
					<td class="TD_STYLE2" colspan="2">
						<input type="text" class="INPUT_STYLE2" value="${resumes.human_postcode }" readonly="readonly" />
					</td>
				</tr>
				<tr>
					<td class="TD_STYLE1">
						国籍
					</td>
					<td class="TD_STYLE2">
						<input type="text" class="INPUT_STYLE2" value="${resumes.human_nationality }"  readonly="readonly" />
					</td>
					<td class="TD_STYLE1">
						出生地
					</td>
					<td class="TD_STYLE2">
						<input type="text" class="INPUT_STYLE2" value="${resumes.human_birthplace }"  readonly="readonly" />
					</td>
					<td class="TD_STYLE1">
						生日
					</td>
					<td class="TD_STYLE2" colspan="2">
						<input type="text" class="INPUT_STYLE2" value="${resumes.human_birthday }"  readonly="readonly" />
					</td>
				</tr>
				<tr>
					<td class="TD_STYLE1">
						民族
					</td>
					<td class="TD_STYLE2">
						<input type="text" class="INPUT_STYLE2" value="${resumes.human_race }"  readonly="readonly" />
					</td>
					<td class="TD_STYLE1">
						宗教信仰
					</td>
					<td class="TD_STYLE2">
						<input type="text" class="INPUT_STYLE2" value="${resumes.human_religion }"  readonly="readonly" />
					</td>
					<td class="TD_STYLE1">
						政治面貌
					</td>
					<td class="TD_STYLE2" colspan="2">
						<input type="text" class="INPUT_STYLE2" value="${resumes.human_party }"  readonly="readonly" />
					</td>
				</tr>
				<tr>
					<td class="TD_STYLE1">
						身份证号码
					</td>
					<td class="TD_STYLE2">
						<input type="text" class="INPUT_STYLE2" value="${resumes.human_idcard }"  readonly="readonly" />
					</td>
					<td class="TD_STYLE1">
						年龄
					</td>
					<td class="TD_STYLE2">
						<input type="text" class="INPUT_STYLE2" value="${resumes.human_age }"  readonly="readonly" />
					</td>
					<td class="TD_STYLE1" width="8%">
						毕业学校
					</td>
					<td width="13%" class="TD_STYLE2">
						<input type="text" class="INPUT_STYLE2" value="${resumes.human_college }"  readonly="readonly" />
					</td>
					<td width="11%" nowrap class="TD_STYLE1">
						学历
					</td>
					<td class="TD_STYLE2">
						<input type="text" class="INPUT_STYLE2" value="${resumes.human_educated_degree }"  readonly="readonly" />
					</td>
				</tr>
				<tr>
					<td class="TD_STYLE1">
						教育年限
					</td>
					<td class="TD_STYLE2">
						<input type="text" class="INPUT_STYLE2" value="${resumes.human_educated_years }"  readonly="readonly" />
					</td>
					<td class="TD_STYLE1">
						学历专业
					</td>
					<td class="TD_STYLE2">
						<input type="text" class="INPUT_STYLE2" value="${resumes.human_educated_major }"  readonly="readonly" />
					</td>
					<td class="TD_STYLE1">
						薪酬要求
					</td>
					<td class="TD_STYLE2">
						<input type="text" class="INPUT_STYLE2" value="${resumes.demand_salary_standard }"  readonly="readonly" />
					</td>
					<td class="TD_STYLE1">
						注册时间
					</td>
					<td class="TD_STYLE2">
						<input type="text" class="INPUT_STYLE2" value="${resumes.regist_time }"  readonly="readonly" />
					</td>
				</tr>
				<tr>
					<td class="TD_STYLE1">
						特长
					</td>
					<td class="TD_STYLE2">
						<input type="text" class="INPUT_STYLE2" value="${resumes.human_specility }"  readonly="readonly" />
					</td>
					<td class="TD_STYLE1">
						爱好
					</td>
					<td class="TD_STYLE2">
						<input type="text" class="INPUT_STYLE2" value="${resumes.human_hobby }" readonly="readonly" />
					</td>
					<td class="TD_STYLE1">
						推荐人
					</td>
					<td class="TD_STYLE2">
						<input type="text" class="INPUT_STYLE2" value="${resumes.checker }"  readonly="readonly" />
					</td>
					<td class="TD_STYLE1">
						推荐时间
					</td>
					<td class="TD_STYLE2">
						<input type="text" class="INPUT_STYLE2" value="${resumes.check_time }" readonly="readonly" />
					</td>
				</tr>
				<tr>
					<td class="TD_STYLE1" height="65">
						个人履历
					</td>
					<td class="TD_STYLE2" colspan="7">
					<textarea name="human_history_records" class="TEXTAREA_STYLE1"    readonly="true" rows="4" >${resumes.human_history_records }</textarea>
					</td>
				</tr>
				<tr>
					<td class="TD_STYLE1" height="65">
						备注
					</td>
					<td class="TD_STYLE2" colspan="7">
						<textarea name="remark" class="TEXTAREA_STYLE1"   readonly="true" rows="4" >${resumes.remark }</textarea>
					</td>
				</tr>
				<tr>
					<td class="TD_STYLE1" height="65">
						推荐意见
					</td>
					<td class="TD_STYLE2" colspan="7">
					<textarea name="recomandation" class="TEXTAREA_STYLE1"    readonly="true" rows="4" >${resumes.recomandation }</textarea>
				</td>
				</tr>
				<tr>
					<td class="TD_STYLE1">
						面试次数
					</td>
					<td class="TD_STYLE2">
						 
								${interviewCount}
								<input type="hidden" name="interview_amount"  value="${interviewCount}" />
							 
					</td>
					<td class="TD_STYLE1">
						形象评价
					</td>
					<td class="TD_STYLE2">
						<select name="image_degree" class="SELECT_STYLE1">
							<option value="A">A</option>
							<option value="B">B</option>
							<option value="C">C</option>
						</select>
					</td>
					<td class="TD_STYLE1">
						口才评价
					</td>
					<td class="TD_STYLE2">
						<select name="native_language_degree" class="SELECT_STYLE1">
							<option value="A">A</option>
							<option value="B">B</option>
							<option value="C">C</option>
						</select>
					</td>
					<td class="TD_STYLE1">
						外语口语能力
					</td>
					<td class="TD_STYLE1">
						<select name="foreign_language_degree" class="SELECT_STYLE1">
							<option value="A">A</option>
							<option value="B">B</option>
							<option value="C">C</option>
						</select>
					</td>
				</tr>
				<tr>
					<td class="TD_STYLE1">
						应变能力
					</td>
					<td class="TD_STYLE2">
						<select name="response_speed_degree" class="SELECT_STYLE1">
							<option value="A">A</option>
							<option value="B">B</option>
							<option value="C">C</option>
						</select>
					</td>
					<td class="TD_STYLE1">
						EQ
					</td>
					<td class="TD_STYLE2">
						<select name="EQ_degree" class="SELECT_STYLE1">
							<option value="A">A</option>
							<option value="B">B</option>
							<option value="C">C</option>
						</select>
					</td>
					<td class="TD_STYLE1">
						IQ
					</td>
					<td class="TD_STYLE2">
						<select name="IQ_degree" class="SELECT_STYLE1">
							<option value="A">A</option>
							<option value="B">B</option>
							<option value="C">C</option>
						</select>
					</td>
					<td class="TD_STYLE1">
						综合素质
					</td>
					<td class="TD_STYLE1">
						<select name="multi_quality_degree" class="SELECT_STYLE1">
							<option value="A">A</option>
							<option value="B">B</option>
							<option value="C">C</option>
						</select>
					</td>
				</tr>
				<tr>
					<td class="TD_STYLE1">
						面试人
					</td>
					<td class="TD_STYLE2">
						<input type="text" name="register" class="INPUT_STYLE2"
							value="${user}" readonly="true" />
					</td>
					<td class="TD_STYLE1">
						面试时间
					</td>
					<td class="TD_STYLE2">
						<input type="text" name="registe_time" readonly="true"  value="${currentTime}" class="INPUT_STYLE2">
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
					<td class="TD_STYLE2">
						&nbsp;
					</td>
				</tr>
				<tr>
					<td class="TD_STYLE1">
						面试评价
					</td>
					<td class="TD_STYLE2" colspan="7">
						<textarea name="interview_comment" class="TEXTAREA_STYLE1" rows="4" ></textarea>
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
