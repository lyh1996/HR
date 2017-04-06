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
<script type="text/javascript">
function tick() {
	var now = new Date();
	var hours, minutes, seconds, noon;
	var intHours, intMinutes, intSeconds;
	intHours = now.getHours();
	intMinutes = now.getMinutes();
	intSeconds = now.getSeconds();
	if (intHours < 24) {
		hours = intHours+":";
		noon = "A.M.";
	} else {
		intHours = intHours - 24;
		hours = intHours + ":";
		noon = "P.M.";
	}
	if (intMinutes < 10) {
		minutes = "0"+intMinutes+":";
	} else {
		minutes = intMinutes+":";
	}
	if (intSeconds < 10) {
		seconds = "0"+intSeconds+" ";
	} else {
		seconds = intSeconds+" ";
	}
	timeString = hours+minutes+seconds;
	var now = new Date();
  	document.getElementById("nowTime").value=now.getFullYear()+"-"+(now.getMonth()+1)+"-"+now.getDate()+" "+timeString;
	window.setTimeout("tick();", 1000);
}

//load事件
function check(){
	//获得系统当前时间的方法
  	tick();					
}
function tocheckPhoto()
{
	document.forms[0].action = document.forms[0].action + "?operate=CheckPhoto";
	document.forms[0].submit();
}
</script>
	</head>

	<body onload="check()">
		<form method="post" action="humanfile.do">
			<table width="100%">
				<tr>
					<td>
						<font color="#0000CC">您正在做的业务是：人力资源--人力资源档案管理--人力资源档案复核 </font>
					</td>
				</tr>
				<tr>
					<td align="right">
					  <input type="button" value="复核通过" class="BUTTON_STYLE1" onclick="javascript:tocheckPhoto();">
						<input type="reset" value="清除" class="BUTTON_STYLE1">
						<input type="button" value="返回" class="BUTTON_STYLE1"
							onclick="history.back()">
					</td>
				</tr>
			</table>
			<table width="100%" border="1" cellpadding=0 cellspacing=1
				bordercolorlight=#848284 bordercolordark=#eeeeee
				class="TABLE_STYLE1">
				 <input type="hidden" value="${list.huf_id} " name="huf_id">
				<tr>
				
					<td class="TD_STYLE1" width="10%">
						档案编号
					</td>
					<td colspan="6" class="TD_STYLE2">
						<input type="text" name="human_id" class="INPUT_STYLE2" value="${list.human_id }"readonly="readonly">
					</td>
					<td rowspan="6" width="13%">
						<img src="${list.human_picture}"  style="width: 185px ;height: 143px"/>
					</td>
				</tr>
				<tr>
					<td class="TD_STYLE1" width="10%">
						I级机构
					</td>
					<td width="14%" class="TD_STYLE2">
						${list.first_kind_name}
					</td>
					<td width="10%" class="TD_STYLE1">
						II级机构
					</td>
					<td width="13%" class="TD_STYLE2">
						${list.second_kind_name}
					</td>
					<td width="10%" class="TD_STYLE1">
						III级机构
					</td>
					<td class="TD_STYLE2" colspan="2" width="2%" >
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
						<select Class="SELECT_STYLE1"
							name="human_pro_designation">
							<option value="${list.human_pro_designation}" selected>${list.human_pro_designation}</option>
							<c:forEach items="${ list3 }" var="Profession">
							<option value="${Profession.attribute_name }">${Profession.attribute_name }</option>
						</c:forEach>
						</select>
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
						<select Class="SELECT_STYLE1" name="human_sex"  value="${list.human_sex }">
							<option value="${list.human_sex }" selected>${list.human_sex }</option>
							<option value="男">男</option>
							<option value="女">女</option>
						</select>
					</td>
					<td class="TD_STYLE1">
						EMAIL
					</td>
					<td colspan="2" class="TD_STYLE2">
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
						QQ
					</td>
					<td class="TD_STYLE2">
					<input type="text" name="human_qq" class="INPUT_STYLE2" value="${list.human_qq }">
					</td>
					<td class="TD_STYLE1">
						手机
					</td>
					<td colspan="2" class="TD_STYLE2">
						<input type="text" name="human_mobilephone" class="INPUT_STYLE2" value="${list.human_mobilephone }">
					</td>
				</tr>
				<tr>
					<td class="TD_STYLE1">
						住址
					</td>
					<td colspan="3" class="TD_STYLE2">
						<input type="text" name="human_address" class="INPUT_STYLE2" value="${list.human_address }">
					</td>
					<td class="TD_STYLE1">
						邮编
					</td>
					<td colspan="2" class="TD_STYLE2">
						<input type="text" name="human_postcode" class="INPUT_STYLE2" value="${list.human_postcode }">
					</td>
				</tr>
				<tr>
					<td class="TD_STYLE1">
						国籍
					</td>
					<td class="TD_STYLE2">
						<select Class="SELECT_STYLE1"
							name="human_nationality">
							<option value="${list.human_nationality }" selected="selected">${list.human_nationality }</option>
							<c:forEach items="${ list4 }" var="country">
							<option value="${country.attribute_name }">${country.attribute_name }</option>
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
					<td width="18%" class="TD_STYLE2">
						<input type="text" name="human_birthday" class="INPUT_STYLE2" id="date_start" value="${list.human_birthday }"/>
					</td>
					<td width="6%" class="TD_STYLE1">
						民族
					</td>
					<td class="TD_STYLE2">
						<select Class="SELECT_STYLE1" name="human_race">
						<option value="${list.human_race }" selected="selected">${list.human_race }</option>
							<c:forEach items="${ list5 }" var="race">
							<option value="${race.attribute_name }">${race.attribute_name }</option>
						</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<td class="TD_STYLE1">
						宗教信仰
					</td>
					<td class="TD_STYLE2">
						<select Class="SELECT_STYLE1"
							name="human_religion">
							<option value="${list.human_religion }" selected="selected">${list.human_religion }</option>
							<c:forEach items="${ list6 }" var="religion">
							<option value="${religion.attribute_name }">${religion.attribute_name }</option>
						</c:forEach>
						</select>
					</td>
					<td class="TD_STYLE1">
						政治面貌
					</td>
					<td class="TD_STYLE2">
						<select Class="SELECT_STYLE1" name="human_party">
						<option value="${list.human_party }" selected="selected">${list.human_party }</option>
							<c:forEach items="${ list7 }" var="party">
							<option value="${party.attribute_name }">${party.attribute_name }</option>
						</c:forEach>
						</select>
					</td>
					<td class="TD_STYLE1">
						身份证号码
					</td>
					<td class="TD_STYLE2">
					<input type="text" name="human_id_card" class="INPUT_STYLE2" value="${list.human_id_card }">
					</td>
					<td class="TD_STYLE1">
						社会保障号码
					</td>
					<td class="TD_STYLE2">
						<input type="text" name="human_society_security_id" class="INPUT_STYLE2" value="${list.human_society_security_id }">
					</td>
				</tr>
				<tr>
					<td class="TD_STYLE1">
						年龄
					</td>
					<td class="TD_STYLE2">
						<input type="text" name="human_age" class="INPUT_STYLE2" value="${list.human_age }">
					</td>
					<td class="TD_STYLE1">
						学历
					</td>
					<td class="TD_STYLE2">
						<select Class="SELECT_STYLE1" name="human_educated_degree">
						<option value="${list.human_educated_degree }" selected="selected">${list.human_educated_degree }</option>
							<c:forEach items="${ list8 }" var="degree">
							<option value="${degree.attribute_name }">${degree.attribute_name }</option>
						</c:forEach>
						</select>
					</td>
					<td class="TD_STYLE1">
						教育年限
					</td>
					<td class="TD_STYLE2">
						<select  Class="SELECT_STYLE1"
							name="human_educated_years">
							<option value="${list.human_educated_years }" selected="selected">${list.human_educated_years }</option>
							<c:forEach items="${ list9 }" var="educatedyears">
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
							 <option value="${list.human_educated_major }" selected="selected">${list.human_educated_major }</option>
							<c:forEach items="${ list10 }" var="educatedmajor">
							<option value="${educatedmajor.attribute_name }">${educatedmajor.attribute_name }</option>
						</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<td class="TD_STYLE1">
						薪酬标准
					</td>
					<td class="TD_STYLE2">
						<select Class="SELECT_STYLE1"
							name="salary_standard_name">
							<option value="${list.salary_standard_id}/${list.salary_standard_name }" selected="selected">${list.salary_standard_id }/${list.salary_standard_name }</option>
							<option value="0/未定义">0/未定义</option>
							<c:forEach items="${ standards }" var="standards">
							<option value="${standards.standard_id}/${standards.standard_name }">${standards.standard_id }/${standards.standard_name }</option>
						</c:forEach>
						</select>
					</td>
					<td class="TD_STYLE1">
						开户行
					</td>
					<td class="TD_STYLE2">
							<input type="text" name="human_bank" class="INPUT_STYLE2" value="${list.human_bank}">
					</td>
					<td class="TD_STYLE1">
						帐号
					</td>
					<td class="TD_STYLE2">
							<input type="text" name="human_account" class="INPUT_STYLE2" value="${list.human_account }">
					</td>
					<td class="TD_STYLE1">
						复核人
					</td>
					<td class="TD_STYLE2">
						<input type="text" name="register" class="INPUT_STYLE2"
							value="${user}" readonly="true" />
					</td>
				</tr>
				<tr>
					<td class="TD_STYLE1">
						复核时间
					</td>
					<td class="TD_STYLE2">
					<input type="text" name="check_time" class="INPUT_STYLE2" id="nowTime"
						 readonly="true"/>
					</td>
					<td class="TD_STYLE1">
						特长
					</td>
					<td class="TD_STYLE2">
						<select Class="SELECT_STYLE1"
							name="human_speciality">
							 <option value="${list.human_speciality }" selected="selected">${list.human_speciality }</option>
							<c:forEach items="${ list11 }" var="speciality">
							<option value="${speciality.attribute_name }">${speciality.attribute_name }</option>
						</c:forEach>
						</select>
					</td>
					<td class="TD_STYLE1">
						爱好
					</td>
					<td class="TD_STYLE2">
						<select Class="SELECT_STYLE1" name="human_hobby">
						<option value="${list.human_hobby }" selected="selected">${list.human_hobby }</option>
							<c:forEach items="${ list12 }" var="hobby">
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
                   	<a href="${list.attachment_name }">下载附件</a>
                    </c:otherwise>
                </c:choose>
					
					</td>
				</tr>
				<tr>
					<td class="TD_STYLE1">
						个人履历
					</td>
					<td colspan="7" class="TD_STYLE2">
							<textarea name="human_histroy_records"
						class="TEXTAREA_STYLE1" rows="4">${list.human_histroy_records}</textarea>
					</td>
				</tr>
				<tr>
					<td class="TD_STYLE1">
						家庭关系信息
					</td>
					<td colspan="7" class="TD_STYLE2">
						<textarea name="human_family_membership"
						class="TEXTAREA_STYLE1" rows="4">${list.human_family_membership}</textarea>
					</td>
				</tr>
				<tr>
					<td class="TD_STYLE1">
						备注
					</td>
					<td colspan="7" class="TD_STYLE2">
						<textarea name="remark"
						class="TEXTAREA_STYLE1" rows="4">${list.remark}</textarea>
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
<iframe  width=0 height=0></iframe>
