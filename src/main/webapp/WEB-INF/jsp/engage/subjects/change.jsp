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
		<link rel="stylesheet" href="css//table.css" type="text/css">
		<link rel="stylesheet" type="text/css" media="all"
			href="javascript/calendar/calendar-win2k-cold-1.css">
		<script type="text/javascript" src="javascript/calendar/cal.js"></script>
		<script type="text/javascript" src="javascript/comm/comm.js"></script>
		<script type="text/javascript" src="javascript/comm/time.js"></script>
		<script type="text/javascript" src="javascript/comm/select.js"></script>
		<script type="text/javascript" src="javascript/comm/jquery-1.12.4.js"></script>
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
		var validateMsg = "";
		function checkNotEmpty(ctlName,label)
		{
			var oCtl = document.getElementById(ctlName);
			//alert(oCtl);
			if (oCtl.value=="")
			{
				if (label)
				{
					validateMsg += label;
				}
				validateMsg += "不能为空！\n";
				oCtl.focus();
			}
		}
		function checkValidateMsg()
		{
			if (validateMsg!="")
			{
				alert(validateMsg);
				return false;
			}
			return true;
		}
		 
			function tosubmit(){
				checkNotEmpty("content","题干");
				checkNotEmpty("key_a","答案a");
				checkNotEmpty("key_b","答案b");
				checkNotEmpty("key_c","答案c");
				checkNotEmpty("key_d","答案d");
				checkNotEmpty("correct_key","正确答案");
				if (!checkValidateMsg())
				{
					return;
				}
			 
				document.forms[0].action = document.forms[0].action + "?operate=doEdit";
				document.forms[0].submit();
			}
 		</script>
	</head>
	
	<body onload="check()">
		<form action="engagesubjects.do" method="post">
			<table width="100%">
				<tr>
					<td>
						<font color="#0000CC">您正在做的业务是：人力资源--招聘管理--招聘考试题库管理--试题变更 </font>
					</td>
				</tr>
				<tr>
					<td align="right">
						<input type="button" value="提交" class="BUTTON_STYLE1"
							onclick="tosubmit()">
						<input type="button" value="返回" class="BUTTON_STYLE1"
							onclick="history.back();">
							<input  type="hidden" name="sub_id" value="${list.sub_id }"/>
					</td>
				</tr>
			</table>		
			
			<table class="TABLE_STYLE1" border="1" width="100%" cellpadding=0
				cellspacing=1 bordercolorlight=#848284 bordercolordark=#eeeeee>
				
				<tr class="TR_STYLE1">
					<td width="8%" nowrap class="TD_STYLE1">
						试题I级分类
					</td>
					<td width="14%">
					${list.first_kind_name }
					</td>
					<td width="8%" nowrap class="TD_STYLE1">
						试题II级分类
					</td>
					<td width="14%">
						${list.second_kind_name }
					</td>
					<td width="8%" nowrap class="TD_STYLE1">
						登记人
					</td>
					<td width="14%" class="TD_STYLE2">
						 ${list.register }
					</td>
					<td width="8%" class="TD_STYLE1">
						登记时间
					</td>
					<td width="14%" class="TD_STYLE2">
						${list.regist_time }
					</td>
				</tr>
				<tr>
					<td class="TD_STYLE1">
						题干
					</td>
					<td class="TD_STYLE2" colspan="7">
						<textarea 
							name="content" class="TEXTAREA_STYLE1"  id="content"
							rows="4">${list.content }</textarea>
					</td>
				</tr>
				<tr>
					<td class="TD_STYLE1">
						答案a
					</td>
					<td class="TD_STYLE2" colspan="7">
						<textarea 
							name="key_a" class="TEXTAREA_STYLE1" id="key_a"
							rows="4">${list.key_a }</textarea>
					</td>
				</tr>
				<tr>
					<td class="TD_STYLE1">
						答案b
					</td>
					<td class="TD_STYLE2" colspan="7">
						<textarea 
							name="key_b" class="TEXTAREA_STYLE1" id="key_b"
							rows="4" >${list.key_b}</textarea>
					</td>
				</tr>
				<tr>
					<td class="TD_STYLE1">
						答案c
					</td>
					<td class="TD_STYLE2" colspan="7">
						<textarea 
							name="key_c" class="TEXTAREA_STYLE1" id="key_c"
							rows="4" >${list.key_c}</textarea>
					</td>
				</tr>
				<tr>
					<td class="TD_STYLE1">
						答案d
					</td>
					<td class="TD_STYLE2" colspan="7">
						<textarea 
							name="key_d" class="TEXTAREA_STYLE1" id="key_d"
							rows="4" >${list.key_d}</textarea>
					</td>
				</tr>
				<tr>
					<td class="TD_STYLE1">
						答案e
					</td>
					<td class="TD_STYLE2" colspan="7">
						<textarea 
							name="key_e" class="TEXTAREA_STYLE1"
							rows="4" >${list.key_e}</textarea>
					</td>
				</tr>
				<tr>
					<td class="TD_STYLE1">
						正确答案
					</td>
					<td class="TD_STYLE2">
						<input type="text" name="correct_key" class="INPUT_STYLE2" id="correct_key" value="${list.correct_key}">
					</td>
					<td class="TD_STYLE1">
						试题出处
					</td>
					<td class="TD_STYLE2">
						<input type="text" name="derivation" class="INPUT_STYLE2" id="derivation" value="${list.derivation }">
					</td>
					<td class="TD_STYLE1">
						变更人
					</td>
					<td class="TD_STYLE2">
						<input type="text" name="changer" class="INPUT_STYLE2" value="${user}">
					</td>
					<td class="TD_STYLE1">
						变更时间
					</td>
					<td class="TD_STYLE2">
						<input type="text" name="change_time" class="INPUT_STYLE2" id="nowTime">
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