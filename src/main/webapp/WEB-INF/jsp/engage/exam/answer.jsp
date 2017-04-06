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
			<script type="text/javascript" src="javascript/comm/jquery-1.12.4.js"></script>
			<script>
			$(function(){
			     timedCount();// 
			 });
			 
			 var c = 0;
			 var m = 0;
			 var h = 0;
			 var t;
			 
			 // 计时器
			 function timedCount()
			 {
			     if(c > 0 && (c%60 == 0)){ m += 1;c = 0}
			     if(m > 0 && (m%60 == 0)){ h += 1;m = 0}
			     var time = b(h) + ':' + b(m) + ':'+ b(c);
			     $("#test_time").val(time);// 计时器显示在控件中
			    // alert(time);
			     c = c + 1;
			     t = setTimeout("timedCount()",1000);
			     if(b==$("#limitetime").val){
			    	 alert("时间到。。。。。")
			    		document.forms[0].action = document.forms[0].action + "?operate=doAnswerSuccess";
			    		document.forms[0].submit();
			     }
			 }
			 // 时间格式化
			 function b(n){
			     return n >= 10 ? n : "0" + n;
			 }
			 // 计时暂停
			 function pauseclock(){
			     clearInterval(t);
			 }
			 // 计时开始
			 function startclock(){
			     t=setTimeout("timedCount()",1000);
			 }
			 
</script>
<script type="text/javascript">
function tosubmit(){
		if(confirm("确定要提交吗？")==true){
		document.forms[0].action = document.forms[0].action + "?operate=doAnswerSuccess";
		document.forms[0].submit();
		}
	}
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

		 
	</head>

	<body onload="check()">
		<form action="engageAnswer.do" method="post" >
			<table width="100%">
				<tr>
					<td>
						<font color="#0000CC">您正在做的业务是：人力资源--招聘管理--招聘考试管理--考试答题(单选) </font>
					</td>
				</tr>
				<tr>
					<td class="TD_STYLE2" align="right">
						<div>
							答题限定时间: ${limitetime }分钟 <br>
							<input type="hidden" id="limitetime" value="${limitetime }">
							<input type="hidden" name="test_time" id="nowTime">
							答题已用时间:<input readonly="readonly" name="use_time" id="test_time" class="TD_STYLE2" style="color: red;">
						</div>
					</td>
				</tr>
				<tr>
					<td align="right">
						<input type="button" value="交卷" class="BUTTON_STYLE1" onclick="tosubmit()">
						<input type="hidden" name="human_name" value="${list.human_name }"/>
						<input type="hidden" name="human_idcard" value="${list.human_idcard }"/>
						<input type="hidden" name="major_kind_id" value="${list.major_kind_id }"/>
						<input type="hidden" name="major_kind_name" value="${list.major_kind_name }"/>
						<input type="hidden" name="major_id" value="${list.major_id }"/>
						<input type="hidden" name="major_name" value="${list.major_name }"/>
						<input type="hidden" name="exam_number" value="${list.exam_number }"/>
					</td>
				</tr>
			</table>
			<table width="100%" border="1" cellpadding=0 cellspacing=1
				bordercolorlight=#848284 bordercolordark=#eeeeee
				class="TABLE_STYLE1">
				<tr>
					<td class="TD_STYLE1" width="14%">
						试卷编号
					</td>
					<td  class="TD_STYLE2">
						${list.exam_number }
					</td>
					<td width="14%"  class="TD_STYLE2">
						试卷题数
					</td>
					<td  class="TD_STYLE2">
						${num }
					</td>
				</tr>
				<tr>
					<td class="TD_STYLE1"  width="11%">
						姓名
					</td>
					<td width="14%" class="TD_STYLE2">
						${list.human_name }
					</td>
					<td  " class="TD_STYLE2">
						身份证号码
					</td>
					<td width="14%" class="TD_STYLE2">
						${list.human_idcard }
					</td>
				</tr>
				<c:forEach items="${list2 }"  var="list2">
				<tr>
					<td class="TD_STYLE1" colspan="4">
						${list2.first_kind_name}/${list2.second_kind_name}
					</td>
				</tr>
				<c:forEach items="${subjects }" var="subject">
				<c:forEach items="${subject}" var="s" varStatus="b">
				<c:if test="${s.first_kind_id==list2.first_kind_id&&s.second_kind_id==list2.second_kind_id }">
				<tr>
					<td class="TD_STYLE2" colspan="4">
						${b.count}. ${s.content }<br>
						<input type="hidden" name="subject_id" value="${s.sub_id }">
						<input type="checkbox" name="answer"  value="A">A. ${s.key_a}<br>
						<input type="checkbox" name="answer"  value="B">B.${s.key_b}<br>
						<input type="checkbox" name="answer"  value="C">C.${s.key_c}<br>
						<input type="checkbox" name="answer"  value="D">D.${s.key_d}<br>
						<input type="checkbox" name="answer"  value="E">E.${s.key_e}
					</td>
				</tr>
				</c:if>
				</c:forEach>
				</c:forEach>
				  </c:forEach>
			</table>
		</form>
	</body>
</html>

