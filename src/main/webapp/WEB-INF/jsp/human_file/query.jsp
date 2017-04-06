<%@ page contentType="text/html; charset=UTF-8" language="java" import="java.util.*"
	errorPage=""%>
	<%@ page isELIgnored="false"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
	<head>
	 <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" href="css/table.css" type="text/css" >
		<script type="text/javascript" src="javascript/comm/comm.js"></script>
		<script language="javascript" src="javascript/winopen/winopenm.js"></script>
		<script type="text/javascript">
	function doExports()
	{
		document.forms[0].action = document.forms[0].action + "?operate=doexport&method=excel";
		document.forms[0].submit();
	}
</script>
	</head>

	<body>
		<form name="form1" method="post" action="exportfile.do">
			<table width="100%">
				<tr>
					<td>
						<font color="#0000CC">您正在做的业务是：人力资源--人力资源档案管理--人力资源档案查询 </font>
					</td>
				</tr>
				<tr>
					<td align="right">
						<input type="button" name="insert" value="打印" class="BUTTON_STYLE1" onclick="javascript:doExports();">
						<input type="button" name="delete" value="返回"
							class="BUTTON_STYLE1" onclick="history.back();">
							<input type="hidden"  name="primary_key_table" value="human_file"/>
							<input type="hidden"  name="entity" value="human_id"/>
							<input type="hidden"  name="entityName" value="${list.human_id}"/>
					</td>
				</tr>
			</table>
			<table width="100%" border="1" cellpadding=0 cellspacing=1
				bordercolorlight=#848284 bordercolordark=#eeeeee
				class="TABLE_STYLE1">
				<tr>
					<td class="TD_STYLE1" width="10%">
						档案编号
					</td>
					<td colspan="6" class="TD_STYLE2">
						${list.human_id}
					</td>
					<td rowspan="6" width="17%">
						<img src="${list.human_picture}"  style="width: 185px ;height: 143px" />
					</td>
				</tr>
				<tr>
					<td class="TD_STYLE1" width="10%">
						I级机构
					</td>
					<td width="14%" class="TD_STYLE2">
						${list.first_kind_name}
					</td>
					<td width="11%" class="TD_STYLE1">
						II级机构
					</td>
					<td width="14%" class="TD_STYLE2">
						${list.second_kind_name}
					</td>
					<td width="11%" class="TD_STYLE1">
						III级机构
					</td>
					<td class="TD_STYLE2" colspan="2">
						${list.third_kind_name}
					</td>
				</tr>
				<tr>
					<td class="TD_STYLE1">
						职位分类
					</td>
					<td class="TD_STYLE2">
						${list.human_major_kind_name}
					</td>
					<td class="TD_STYLE1">
						职位名称
					</td>
					<td class="TD_STYLE2">
						${list.human_major_name}
					</td>
					<td class="TD_STYLE1">
						职称
					</td>
					<td colspan="2" class="TD_STYLE2">
						${list.human_pro_designation}
					</td>
				</tr>
				<tr>
					<td class="TD_STYLE1">
						姓名
					</td>
					<td class="TD_STYLE2">
						${list.human_name}
					</td>
					<td class="TD_STYLE1">
						性别
					</td>
					<td class="TD_STYLE2">
						${list.human_sex}
					</td>
					<td class="TD_STYLE1">
						EMAIL
					</td>
					<td colspan="2" class="TD_STYLE2">
						${list.human_email}
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
						QQ
					</td>
					<td class="TD_STYLE2">
						${list.human_qq}
					</td>
					<td class="TD_STYLE1">
						手机
					</td>
					<td colspan="2" class="TD_STYLE2">
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
					<td colspan="2" class="TD_STYLE2">
					${list.human_postcode}
					</td>
				</tr>
				<tr>
					<td class="TD_STYLE1">
						国籍
					</td>
					<td class="TD_STYLE2">
						${list.human_nationality}
					</td>
					<td class="TD_STYLE1">
						出生地
					</td>
					<td class="TD_STYLE2">
						${list.human_birthplace}
					</td>
					<td class="TD_STYLE1">
						生日
					</td>
					<td width="13%" class="TD_STYLE2">
					${list.human_birthday}
					</td>
					<td width="10%" class="TD_STYLE1">
						民族
					</td>
					<td class="TD_STYLE2">
						${list.human_race}
					</td>
				</tr>
				<tr>
					<td class="TD_STYLE1">
						宗教信仰
					</td>
					<td class="TD_STYLE2">
					${list.human_religion}
					</td>
					<td class="TD_STYLE1">
						政治面貌
					</td>
					<td class="TD_STYLE2">
						${list.human_party}
					</td>
					<td class="TD_STYLE1">
						身份证号码
					</td>
					<td class="TD_STYLE2">
					${list.human_id_card}
					</td>
					<td class="TD_STYLE1">
						社会保障号码
					</td>
					<td class="TD_STYLE2">
						${list.human_society_security_id}
					</td>
				</tr>
				<tr>
					<td class="TD_STYLE1">
						年龄
					</td>
					<td class="TD_STYLE2">
						${list.human_age}
					</td>
					<td class="TD_STYLE1">
						学历
					</td>
					<td class="TD_STYLE2">
					${list.human_educated_degree}
					</td>
					<td class="TD_STYLE1">
						教育年限
					</td>
					<td class="TD_STYLE2">
						${list.human_educated_years}
					</td>
					<td class="TD_STYLE1">
						学历专业
					</td>
					<td class="TD_STYLE2">
						${list.human_educated_major}
					</td>
				</tr>
				<tr>
					<td class="TD_STYLE1">
						薪酬标准
					</td>
					<td class="TD_STYLE2">
						${list.salary_standard_name}
					</td>
					<td class="TD_STYLE1">
						开户行
					</td>
					<td class="TD_STYLE2">
					${list.human_bank}
					</td>
					<td class="TD_STYLE1">
						帐号
					</td>
					<td class="TD_STYLE2">
						${list.human_account}
					</td>
					<td class="TD_STYLE1">
						复核人
					</td>
					<td class="TD_STYLE2">
						${list.checker}
					</td>
				</tr>
				<tr>
					<td class="TD_STYLE1">
						复核时间
					</td>
					<td class="TD_STYLE2">
					${list.check_time}
					</td>
					<td class="TD_STYLE1">
						特长
					</td>
					<td class="TD_STYLE2">
						${list.human_speciality}
					</td>
					<td class="TD_STYLE1">
						爱好
					</td>
					<td class="TD_STYLE2">
						${list.human_hobby}
					</td>
					<td class="TD_STYLE1">
						登记人
					</td>
					<td class="TD_STYLE2">
						${list.register}
					</td>
				</tr>
				<tr>
					<td class="TD_STYLE1">
						基本薪酬总额
					</td>
					<td class="TD_STYLE2">
						${list.salary_sum}
					</td>
					<td class="TD_STYLE1">
						实发薪酬总额
					</td>
					<td class="TD_STYLE2">
						${list.paid_salary_sum}
					</td>
					<td class="TD_STYLE1">
						培训次数累计
					</td>
					<td class="TD_STYLE2">
						<a href="">${list.training_amount}</a>
					</td>
					<td class="TD_STYLE1">
						激励次数累计
					</td>
					<td class="TD_STYLE2">
						<a href="">${list.bonus_amount}</a>
					</td>
				</tr>
				<tr>
					<td class="TD_STYLE1">
						调动次数
					</td>
					<td class="TD_STYLE2">
						<a href="">${list.major_change_amount}</a>
					</td>
					<td class="TD_STYLE1">
						档案变更累计
					</td>
					<td class="TD_STYLE2">
						<a href="">${list.file_chang_amount}</a>
					</td>
					<td class="TD_STYLE1">
						最近变更时间
					</td>
					<td class="TD_STYLE2">
						<a href="">
						${list.lastly_change_time}
						</a>
					</td>
					<td class="TD_STYLE1">
						登记时间
					</td>
					<td class="TD_STYLE2">
						<a href="">
						${list.regist_time}
						</a>
					</td>
				</tr>
				<tr>
					<td class="TD_STYLE1">
						档案附件
					</td>
					<td colspan="7" class="TD_STYLE2">
						<c:choose>
                    <c:when test="${list.attachment_name==null}">
                      <a href="javascript:void(0)">暂无附件</a>
                    </c:when>
                   <c:otherwise>
                   	<a href="${list.attachment_name }">查看附件</a>
                    </c:otherwise>
                </c:choose>
					</td>
				</tr>
				<tr>
					<td class="TD_STYLE1" height="68">
						个人履历
					</td>
					<td colspan="7" class="TD_STYLE2">
					${list.human_histroy_records}
					</td>
				</tr>
				<tr>
					<td class="TD_STYLE1" height="68">
						家庭关系信息
					</td>
					<td colspan="7" class="TD_STYLE2">
					${list.human_family_membership}
					</td>
				</tr>
				<tr>
					<td class="TD_STYLE1" height="68">
						备注
					</td>
					<td colspan="7" class="TD_STYLE2">
						${list.remark}
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>

<iframe  width=0 height=0></iframe>
