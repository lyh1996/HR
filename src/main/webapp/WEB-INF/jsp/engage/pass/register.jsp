<%@ page contentType="text/html; charset=utf-8" language="java"
	errorPage=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<link rel="stylesheet" href="css/table.css" type="text/css">
		<script type="text/javascript" src="javascript/comm/comm.js"></script>
		<script type="text/javascript" src="javascript/comm/time.js"></script>
		<script language="javascript" src="javascript/winopen/winopenm.js"></script>
		<script type="text/javascript">
			function doCheck(id)
			{
				document.forms[0].action = document.forms[0].action + "?operate=doCheck&id="+id;
				document.forms[0].submit();
			}
		</script>
	</head>

	<body>
		<form action="engageresume.do" method="post">
			<table width="100%">
				<tr>
					<td>
						<font color="#0000CC">您正在做的业务是：人力资源--招聘管理--录用管理--录用申请 </font>
					</td>
				</tr>
				<tr>
					<td align="right">
						<input type="button" value="确认" class="BUTTON_STYLE1"
							onclick="javascript:doCheck('${resumes.res_id }');">
						<input type="button" value="返回" class="BUTTON_STYLE1"
							onclick="history.back();">
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
						${resumes.human_major_kind_name }
						<input type="hidden" value="${resumes.human_major_kind_id }" name="human_major_kind_id" readonly="true" />
					</td>
					<td width="9%" class="TD_STYLE1">
						职位名称
					</td>
					<td width="17%" class="TD_STYLE2">
						${resumes.human_major_name }
						<input type="hidden" value="${resumes.human_major_id }" name="human_major_id" readonly="true">
					</td>
					<td width="8%" nowrap class="TD_STYLE1">
						招聘类型
					</td>
					<td colspan="2" class="TD_STYLE2">
						${resumes.engage_type }
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
						${resumes.human_name }
					</td>
					<td class="TD_STYLE1">
						性别
					</td>
					<td class="TD_STYLE2">
						${resumes.human_sex }
					</td>
					<td class="TD_STYLE1">
						E-MAIL
					</td>
					<td class="TD_STYLE2" colspan="2">
						${resumes.human_email }
					</td>
				</tr>
				<tr>
					<td class="TD_STYLE1">
						电话
					</td>
					<td class="TD_STYLE2">
						${resumes.human_telephone }
					</td>
					<td class="TD_STYLE1">
						家庭电话
					</td>
					<td class="TD_STYLE2">
						${resumes.human_homephone }
					</td>
					<td class="TD_STYLE1">
						手机
					</td>
					<td class="TD_STYLE2" colspan="2">
						${resumes.human_mobilephone }
					</td>
				</tr>
				<tr>
					<td class="TD_STYLE1">
						住址
					</td>
					<td colspan="3" class="TD_STYLE2">
						${resumes.human_address }
					</td>
					<td class="TD_STYLE1">
						邮编
					</td>
					<td class="TD_STYLE2" colspan="2">
						${resumes.human_postcode }
					</td>
				</tr>
				<tr>
					<td class="TD_STYLE1">
						国籍
					</td>
					<td class="TD_STYLE2">
						${resumes.human_nationality }
					</td>
					<td class="TD_STYLE1">
						出生地
					</td>
					<td class="TD_STYLE2">
						${resumes.human_birthplace }
					</td>
					<td class="TD_STYLE1">
						生日
					</td>
					<td class="TD_STYLE2" colspan="2">
						${resumes.human_birthday }
					</td>
				</tr>
				<tr>
					<td class="TD_STYLE1">
						民族
					</td>
					<td class="TD_STYLE2">
						${resumes.human_race }
					</td>
					<td class="TD_STYLE1">
						宗教信仰
					</td>
					<td class="TD_STYLE2">
						${resumes.human_religion }
					</td>
					<td class="TD_STYLE1">
						政治面貌
					</td>
					<td class="TD_STYLE2" colspan="2">
						${resumes.human_party }
					</td>
				</tr>
				<tr>
					<td class="TD_STYLE1">
						身份证号码
					</td>
					<td class="TD_STYLE2">
						${resumes.human_idcard }
					</td>
					<td class="TD_STYLE1">
						年龄
					</td>
					<td class="TD_STYLE2">
						${resumes.human_age }
					</td>
					<td class="TD_STYLE1" width="8%">
						毕业学校
					</td>
					<td width="13%" class="TD_STYLE2">
						${resumes.human_college }
					</td>
					<td width="11%" nowrap class="TD_STYLE1">
						学历
					</td>
					<td class="TD_STYLE2">
						${resumes.human_educated_degree }
					</td>
				</tr>
				<tr>
					<td class="TD_STYLE1">
						教育年限
					</td>
					<td class="TD_STYLE2">
						${resumes.human_educated_years }
					</td>
					<td class="TD_STYLE1">
						学历专业
					</td>
					<td class="TD_STYLE2">
						${resumes.human_educated_major }
					</td>
					<td class="TD_STYLE1">
						薪酬要求
					</td>
					<td class="TD_STYLE2">
						${resumes.demand_salary_standard }
					</td>
					<td class="TD_STYLE1">
						注册时间
					</td>
					<td class="TD_STYLE2">
						${resumes.regist_time }
					</td>
				</tr>
				<tr>
					<td class="TD_STYLE1">
						特长
					</td>
					<td class="TD_STYLE2">
						${resumes.human_specility }
					</td>
					<td class="TD_STYLE1">
						爱好
					</td>
					<td class="TD_STYLE2">
						${resumes.human_hobby }
					</td>
					<td class="TD_STYLE1">
						推荐人
					</td>
					<td class="TD_STYLE2">
						${resumes.checker }
					</td>
					<td class="TD_STYLE1">
						推荐时间
					</td>
					<td class="TD_STYLE2">
						${resumes.check_time }
					</td>
				</tr>
				<tr class="TR_STYLE1">
					<td class="TD_STYLE1">
						档案附件
					</td>
					<td colspan="7" class="TD_STYLE2">
					<c:choose>
	                    <c:when test="${resumes.attachment_name==null}">
	                      <a href="javascript:void(0)">暂无附件</a>
	                    </c:when>
	                   <c:otherwise>
	                   	<a href="${resumes.attachment_name }">下载附件</a>
	                    </c:otherwise>
	                </c:choose>
					
					</td>
				</tr>
				<tr>
					<td class="TD_STYLE1" height="65">
						个人履历
					</td>
					<td class="TD_STYLE2" colspan="7">
					<textarea  class="TEXTAREA_STYLE1" rows="4" value="${resumes.human_history_records }"  readonly="true" >${resumes.human_history_records }</textarea>
					</td>
				</tr>
				<tr>
					<td class="TD_STYLE1" height="65">
						备注
					</td>
					<td class="TD_STYLE2" colspan="7">
						<textarea  class="TEXTAREA_STYLE1" rows="4" value="${resumes.remark }"  readonly="true" >${resumes.remark }</textarea>
					</td>
				</tr>
				<tr>
					<td class="TD_STYLE1" height="65">
						筛选推荐意见
					</td>
					<td class="TD_STYLE2" colspan="7">
						<textarea  class="TEXTAREA_STYLE1" rows="4" value="${resumes.recomandation }"  readonly="true" >${resumes.recomandation }</textarea>
					</td>
				</tr>
				<tr>
					<td class="TD_STYLE1">
						面试次数
					</td>
					<td class="TD_STYLE2">
						<input type="text" class="INPUT_STYLE2" value="${list.interview_amount }"  readonly="true" />
					</td>
					<td class="TD_STYLE1">
						形象评价
					</td>
					<td class="TD_STYLE2">
						<input type="text" class="INPUT_STYLE2" value="${list.image_degree }"  readonly="true" />
					</td>
					<td class="TD_STYLE1">
						口才评价
					</td>
					<td class="TD_STYLE2">
						<input type="text" class="INPUT_STYLE2" value="${list.native_language_degree }"  readonly="true" />
					</td>
					<td class="TD_STYLE1">
						外语口语能力
					</td>
					<td class="TD_STYLE2">
						<input type="text" class="INPUT_STYLE2" value="${list.foreign_language_degree }"  readonly="true" />
					</td>
				</tr>
				<tr>
					<td class="TD_STYLE1">
						应变能力
					</td>
					<td class="TD_STYLE2">
						<input type="text" class="INPUT_STYLE2" value="${list.response_speed_degree }"  readonly="true" />
					</td>
					<td class="TD_STYLE1">
						EQ
					</td>
					<td class="TD_STYLE2">
						<input type="text" class="INPUT_STYLE2" value="${list.EQ_degree }"  readonly="true" />
					</td>
					<td class="TD_STYLE1">
						IQ
					</td>
					<td class="TD_STYLE2">
						<input type="text" class="INPUT_STYLE2" value="${list.IQ_degree }"  readonly="true" />
					</td>
					<td class="TD_STYLE1">
						综合素质
					</td>
					<td class="TD_STYLE2">
						<input type="text" class="INPUT_STYLE2" value="${list.multi_quality_degree }"  readonly="true" />
					</td>
				</tr>
				<tr>
					<td class="TD_STYLE1">
						面试人
					</td>
					<td class="TD_STYLE2">
						<input type="text" class="INPUT_STYLE2" value="${list.register }"  readonly="true" />
					</td>
					<td class="TD_STYLE1">
						面试时间
					</td>
					<td class="TD_STYLE2">
						<input type="text" class="INPUT_STYLE2" value="${list.registe_time }"  readonly="true" />
					</td>
					<td class="TD_STYLE1">
						筛选人
					</td>
					<td class="TD_STYLE2">
						<input type="text"  name="checker" class="INPUT_STYLE2" value="${list.checker}" readonly="true" />
					</td>
					<td class="TD_STYLE1">
						筛选时间
					</td>
					<td class="TD_STYLE2">
						<input type="text" name="check_time" readonly="true"  value="${checker.check_time}" class="INPUT_STYLE2" readonly="true">
					</td>
				</tr>
				<tr>
					<td class="TD_STYLE1">
						面试评价
					</td>
					<td class="TD_STYLE2" colspan="7">
						<textarea name="interview_comment" class="TEXTAREA_STYLE1" rows="4" value="${list.interview_comment }"  readonly="true"  >${list.interview_comment }</textarea>
					</td>
				</tr>
				<tr>
					<td class="TD_STYLE1">
						筛选推荐意见
					</td>
					<td class="TD_STYLE2" colspan="7">
						<textarea name="pass_check_comment" class="TEXTAREA_STYLE1" rows="4" ></textarea>
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>
