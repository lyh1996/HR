<%@ page contentType="text/html; charset=UTF-8" language="java" errorPage="" %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" href="css/table.css" type="text/css" >
		<link rel="stylesheet" type="text/css" media="all"
			href="javascript/calendar/calendar-win2k-cold-1.css">
		<script type="text/javascript" src="javascript/calendar/cal.js"></script>
		<script type="text/javascript" src="javascript/comm/comm.js"></script>
	</head>
	<body>
		<table width="100%">
			<tr>
				<td>
					<font color="#0000CC">您正在做的业务是：人力资源--招聘管理--简历管理--有效简历查询 </font>
				</td>
			</tr>
			<tr>
				<td align="right">
					<input type="button" class="SUBMIT_STYLE1" value="打印" name="B1">
					<input type="button" class="BUTTON_STYLE1" value="返回" onclick="history.back();">
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
					<img src="${list.human_picture}" style="width: 185px ;height: 143px"><img>
				</td>
			</tr>
			<tr>
				<td class="TD_STYLE1">
					姓名
				</td>
				<td class="TD_STYLE2">
					${list.human_name }
				</td>
				<td class="TD_STYLE1">
					性别
				</td>
				<td class="TD_STYLE2">
					${list.human_sex }
				</td>
				<td class="TD_STYLE1">
					E-MAIL
				</td>
				<td class="TD_STYLE2" colspan="2">
					${list.human_email }
				</td>
			</tr>
			<tr>
				<td class="TD_STYLE1">
					电话
				</td>
				<td class="TD_STYLE2">
					${list.human_telephone}
				</td>
				<td class="TD_STYLE1">
					家庭电话
				</td>
				<td class="TD_STYLE2">
					${list.human_homephone}
				</td>
				<td class="TD_STYLE1">
					手机
				</td>
				<td class="TD_STYLE2" colspan="2">
					${list.human_mobilephone}
				</td>
			</tr>
			<tr>
				<td class="TD_STYLE1">
					住址
				</td>
				<td colspan="3" class="TD_STYLE2">
					${list.human_address}
				</td>
				<td class="TD_STYLE1">
					邮编
				</td>
				<td class="TD_STYLE2" colspan="2">
					${list.human_postcode}
				</td>
			</tr>
			<tr>
				<td class="TD_STYLE1">
					国籍
				</td>
				<td class="TD_STYLE2">
					${list.human_nationality }
				</td>
				<td class="TD_STYLE1">
					出生地
				</td>
				<td class="TD_STYLE2">
					${list.human_birthplace }
				</td>
				<td class="TD_STYLE1">
					生日
				</td>
				<td class="TD_STYLE2" colspan="2">
					${list.human_birthday }
				</td>
			</tr>
			<tr>
				<td class="TD_STYLE1">
					民族
				</td>
				<td class="TD_STYLE2">
					${list.human_race }
				</td>
				<td class="TD_STYLE1">
					宗教信仰
				</td>
				<td class="TD_STYLE2">
					${list.human_religion }
				</td>
				<td class="TD_STYLE1">
					政治面貌
				</td>
				<td class="TD_STYLE2" colspan="2">
					${list.human_party }
				</td>
			</tr>
			<tr>
				<td class="TD_STYLE1">
					身份证号码
				</td>
				<td class="TD_STYLE2">
					${list.human_idcard }
				</td>
				<td class="TD_STYLE1">
					年龄
				</td>
				<td class="TD_STYLE2">
					${list.human_age }
				</td>
				<td class="TD_STYLE1" width="8%">
					毕业学校
				</td>
				<td width="13%" class="TD_STYLE2">
					${list.human_college }
				</td>
				<td width="11%" class="TD_STYLE1">
					学历
				</td>
				<td class="TD_STYLE2">
					${list.human_educated_degree }
				</td>
			</tr>
			<tr>
				<td class="TD_STYLE1">
					教育年限
				</td>
				<td class="TD_STYLE2">
					${list.human_educated_years }
				</td>
				<td class="TD_STYLE1">
					学历专业
				</td>
				<td class="TD_STYLE2">
					${list.human_educated_major }
				</td>
				<td class="TD_STYLE1">
					薪酬要求
				</td>
				<td class="TD_STYLE2">
					${list.demand_salary_standard }
				</td>
				<td class="TD_STYLE1">
					注册时间
				</td>
				<td class="TD_STYLE2">
					${list.regist_time }
				</td>
			</tr>
			<tr>
				<td class="TD_STYLE1">
					特长
				</td>
				<td class="TD_STYLE2">
					${list.human_specility }
				</td>
				<td class="TD_STYLE1">
					爱好
				</td>
				<td class="TD_STYLE2">
					${list.human_hobby }
				</td>
				<td class="TD_STYLE1">
					推荐人
				</td>
				<td class="TD_STYLE2">
					${list.checker }
				</td>
				<td class="TD_STYLE1">
					推荐时间
				</td>
				<td class="TD_STYLE2">
					${list.check_time }
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
				<td class="TD_STYLE1" height="65">
					个人履历
				</td>
				<td class="TD_STYLE2" colspan="7">
					${list.human_history_records }
				</td>
			</tr>
			<tr>
				<td class="TD_STYLE1" height="65">
					备注
				</td>
				<td class="TD_STYLE2" colspan="7">
					${list.remark }
				</td>
			</tr>
			<tr>
				<td class="TD_STYLE1" height="65">
					筛选推荐意见
				</td>
				<td class="TD_STYLE2" colspan="7">
					${list.recomandation }
				</td>
			</tr>
		</table>
	</body>
</html>
