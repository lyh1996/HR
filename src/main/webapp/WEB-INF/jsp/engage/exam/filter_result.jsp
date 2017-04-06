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
		</script>
		<script type="text/javascript">
			function doCheck(id)
			{
				document.forms[0].action = document.forms[0].action + "?operate=doCheck&id="+id;
				document.forms[0].submit();
			}
		</script>
		</head>
		

	<body onload="check()">
		<form name="" method="post" action="engageAnswer.do">
			<table width="100%">
				<tr>
					<td>
						<font color="#0000CC">您正在做的业务是:人力资源--招聘管理--招聘考试管理--成绩查询筛选 </font>
					</td>
				</tr>
				<tr>
					<td align="right">
							<input type="radio"  name="results" value="建议笔试" />建议笔试
						<input type="radio"  name="results" value="建议录用" />建议录用
						<input type="radio"  name="results" value="删除简历" />删除简历
						<input type="button" value="确认" class="BUTTON_STYLE1" onclick="javascript:doCheck('${list.resume_id }');">
						<input type="button" value="返回" class="BUTTON_STYLE1" onclick="history.back();">
					</td>
				</tr>
			</table>
			<table width="100%" border="1" cellpadding=0 cellspacing=1
				bordercolorlight=#848284 bordercolordark=#eeeeee
				class="TABLE_STYLE1">
				<tr>
					<td class="TD_STYLE1">
						职位分类
					</td>
					<td class="TD_STYLE2">
						 	${resumes.human_major_kind_name }
						<input type="hidden" value="${resumes.human_major_kind_id }" name="human_major_kind_id" readonly="true" />
					</td>
					<td class="TD_STYLE1" width="12%">
						职位名称
					</td>
					<td class="TD_STYLE2">
							${resumes.human_major_name }
						<input type="hidden" value="${resumes.human_major_id }" name="human_major_id" readonly="true">
					</td>
					<td class="TD_STYLE1" width="12%">
						招聘类型
					</td>
					<td  class="TD_STYLE2" colspan="2" width="24%">
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
						<input type="hidden" name="human_email" value="${resumes.human_email}"> 
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
				<tr>
					<td class="TD_STYLE1" height="65">
						个人履历
					</td>
					<td class="TD_STYLE2" colspan="7">
					<textarea  class="TEXTAREA_STYLE1" rows="4"  readonly="true" >${resumes.human_history_records }</textarea>
					</td>
				</tr>
				<tr>
					<td class="TD_STYLE1" height="65">
						备注
					</td>
					<td class="TD_STYLE2" colspan="7">
						<textarea  class="TEXTAREA_STYLE1" rows="4" readonly="true" >${resumes.remark }</textarea>
					</td>
				</tr>
				<tr>
					<td class="TD_STYLE1" height="65">
						筛选推荐意见
					</td>
					<td class="TD_STYLE2" colspan="7">
						<textarea  class="TEXTAREA_STYLE1" rows="4" readonly="true" >${resumes.recomandation }</textarea>
					</td>
				</tr>
				<tr>
					<td class="TD_STYLE1">
						考试次数
					</td>
					<td  class="TD_STYLE2">
						${testCount }
						<input type="hidden" name="test_amount" value="${testCount }">
					</td>
					<td class="TD_STYLE1">
						成绩总分
					</td>
					<td  class="TD_STYLE2">
						${score }
						<input type="hidden" name="total_points" value="${score }">
					</td>

					<td class="TD_STYLE1">
						筛选人
					</td>
					<td  class="TD_STYLE2">
							${user }
						<input type="hidden" name="test_checker" value="${user}"> 
					</td>
					<td class="TD_STYLE1">
						筛选时间
					</td>
					<td  class="TD_STYLE2">
						<input type="text" name="test_check_time" value="${user}" id="nowTime" readonly="readonly" class="TD_STYLE1"> 
					</td>
				</tr>				
			</table>
		</form>
	</body>
</html>

