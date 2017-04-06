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
			<script type="text/javascript">
			//职位分类发生改变
			$(document).ready(
					function() {
						$("#MajorKind").change(
							function() {
								$.post("findInfoByMajorKind/"+ $(this).val(),
										function(json) {
												var obj =$.parseJSON(json);
													$("#majorName").html("");
													$("#majorName").append("<option value='0/null'>请选择职位名称</option>");
														for (var i = 0; i < obj.length; i++) {
																	var major = obj[i];
																	$("#majorName").append("<option value='"+major.major_id+"/"+major.major_name+"'>"+major.major_id+"/"+major.major_name+"</option>");
																		}
																	});
												});
							});
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
			 
				function tosubmit(){
					var kindmajor=$("#MajorKind").val();
					if(kindmajor=="0/null"){
						alert("请选择您要填写的职位分类。。。");
						return false;
					}
					var major=$("#majorName").val();
					if(major=="0/null"){
						alert("请选择您要填写的职位名称。。。");
						return false;
					}
					var s=$("#limite_time").val();
					if(isNaN(s) || s.length>3||""==s){
						alert("考试限时错误,必须为数字而且长度不能大于3位。。。");
						return false;
					}
					var a=$("#examCount").val();
					var b=$("#question_amount").val();
					if(isNaN(s)||""==b||parseInt(a)<parseInt(b)){
						alert("出题数量必须为数字且不能大于已有数量。。。");
						return false;
					}
					
					if(confirm("确定要提交吗？")==true){
					document.forms[0].action = document.forms[0].action + "?operate=doAdd";
					document.forms[0].submit();
					}
				}
			</script>
	</head>

	<body onload="check()">
		<form name="" method="post" action="engageExam.do">
			<table width="100%">
				<tr>
					<td>
						<font color="#0000CC">您正在做的业务是：人力资源--招聘管理--招聘考试管理--考试出题 </font>
					</td>
				</tr>
				<tr>
					<td align="right">
						<input type="button" value="提交" class="BUTTON_STYLE1"
							onclick="tosubmit()">
						<input type="reset" value="清除" class="BUTTON_STYLE1">
					</td>
				</tr>
			</table>
			<table width="100%" border="1" cellpadding=0 cellspacing=1
				bordercolorlight=#848284 bordercolordark=#eeeeee
				class="TABLE_STYLE1">
				<tr>
					<td class="TD_STYLE1" >
						职位分类
					</td>
					<td class="TD_STYLE2">
						<select Class="SELECT_STYLE1"
							name="major_kind_name"  id="MajorKind">
							<option value="0/null">请选择职位分类</option>
							<c:forEach items="${ list2 }" var="configfilemajorkinds">
							<option value="${configfilemajorkinds.major_kind_id}/${configfilemajorkinds.major_kind_name}">${configfilemajorkinds.major_kind_id }/${configfilemajorkinds.major_kind_name }</option>
						</c:forEach>
						</select>
					</td>
					<td class="TD_STYLE1" >
						职位名称
					</td>
					<td class="TD_STYLE2" >
						<select Class="SELECT_STYLE1"
							name="major_name"  id="majorName">
							<option value="0/null">请选择职位名称</option>
						</select>
					</td>
					<td class="TD_STYLE1">
						登记人
					</td>
					<td class="TD_STYLE2">
						<input type="text" name="register" value="${user}" readonly="readonly" class="TD_STYLE2">
					</td>
					<td class="TD_STYLE1" >
						登记时间
					</td>
					<td  class="TD_STYLE2">
						<input type="text" name="regist_time" class="INPUT_STYLE2" id="nowTime"/>
					</td>
					<td class="TD_STYLE1" >
						答题限时(分钟)
					</td>
					<td  class="TD_STYLE2">
						<input type="text" name="limite_time" class="TD_STYLE2"  id="limite_time">
					</td>
				</tr>
			 <c:forEach items="${list }" var="list"> 
				<tr>
					<td class="TD_STYLE1">
						${list.first_kind_name }
						<input type="hidden" name="first_kind_name" value="${list.first_kind_id }/${list.first_kind_name }">
					</td>
					<td class="TD_STYLE2" colspan="7">
						<table width="100%" border="1" cellpadding=0 cellspacing=1 bordercolorlight=#848284 bordercolordark=#eeeeee
				class="TABLE_STYLE1">
				<tr><td>试题二级分类名称</td><td>可用试题数量</td><td>出题数量</td></tr>
					<tr>
					<td>${list.second_kind_name }
					<input type="hidden" name="second_kind_name" value="${list.second_kind_id }/${list.second_kind_name }">
					</td>
					<td>${list.examCount }
						<input type="hidden"  value="${list.examCount }" id="examCount">
					</td>
					<td><input class="INPUT_STYLE2"  name="question_amount" id="question_amount" ></td>
					</tr>
				</table>
					</td>
				</tr>
				   </c:forEach>
			</table>
		</form>
	</body>
</html>

