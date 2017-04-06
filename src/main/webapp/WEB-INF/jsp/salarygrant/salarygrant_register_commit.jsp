<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
	<base href="<%=basePath %>">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" href="css/table.css" type="text/css" />
		<title>无标题文档</title>
		<style type="text/css">
<!--
.style3 {color: #0000CC}
-->
</style>	
	</head>
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
	        
	         function MyNull(){
			if (document.getElementById("mynull1").value==""){
				alert("奖励金额，不能为空！！！");
				return false;
			}
			if (document.getElementById("mynull2").value==""){
				alert("销售绩效，不能为空！！！");
				return false;
			}
			if (document.getElementById("mynull3").value==""){
				alert("应扣金额，不能为空！！！");
				return false;
			}
			document.forms[0].action = document.forms[0].action + "?operate=save&type="+${type};
			document.forms[0].submit();
	         }
	</script>
	<body onload="check()">
		<form method="post" action="salarygrant.do">
			<table width="100%">
				<tr>
					<td colspan="2">
						<font color="#0000CC">您正在做的业务是：人力资源--薪酬标准管理--薪酬发放登记  
						</font>		
						<%-- <input type="hidden" name="type"  value="<s:property value="#parameters.id"/>"> --%> 			
					</td>
				</tr>			
				<tr>
					<td colspan="2" align="right">
						<input type="button" value="提交"  class="BUTTON_STYLE1"  onclick="MyNull()">
						<input type="reset" value="重置"   class="BUTTON_STYLE1" >
						<input type="button" value="返回" onclick="history.back();" class="BUTTON_STYLE1">
					</td>
				</tr>
				<tr>
					<td colspan="2">
					薪酬单编号：${id}
					<input type="hidden"  name="salary_grant_id" value="${id }" readonly="readonly"  >
					</td>					
				</tr>
				<tr>
					<td colspan="2">
						机构：${firstKindName  }/${secondKindName  }/ ${ thirdKindName}

					</td>					
				</tr>
				<tr>
					<td>
					本机构总人数:<%=((java.util.List)request.getAttribute("HfList")).size() %>，基本薪酬总数:${money}
			    	<input type="hidden"  name="salary_standard_sum" value=" ${money}">
			    	<input type="hidden"  name="human_amount" value=" <%=((java.util.List)request.getAttribute("HfList")).size() %>">
					</td>
					<td  align="right">
						登记人:<input type="text" value="${user }" name="register" size="8" readonly="readonly" class="INPUT_STYLE1">
						登记时间：<input type="text" value="" name="regist_time" readonly="readonly" id="nowTime" class="INPUT_STYLE1">
					</td>
				</tr>
			</table>
			<table width="100%" border="1" cellpadding=0 cellspacing=1
				bordercolorlight=#848284 bordercolordark=#eeeeee
				class="TABLE_STYLE1">
				<tr>
					<td class="TD_STYLE1">
						<span>序号</span>
					</td>
					<td class="TD_STYLE1">
						<span>档案编号</span>
					</td>
					<td class="TD_STYLE1">
						<span>姓名</span>
					</td>
					<c:forEach items="${list2 }" varStatus="status" var="standard">
								<td class="TD_STYLE1">							
									${standard.item_name}
								</td>				
						</c:forEach>	
						
					<td class="TD_STYLE1">
						奖励金额
					</td>
					<td class="TD_STYLE1">
						销售绩效总额
					</td>
					<td class="TD_STYLE1">
						应扣金额
					</td>
					</tr>	
					<c:forEach  items="${HfList}" varStatus="status" var="a">
						<tr class="TD_STYLE2">
						<td>
							${status.count}
						</td>
						<td>
							${a.human_id}			
							<input type="hidden"  name="human_id"  value="${a.human_id}">	
							<%-- <input type="hidden"  name=" human_name"  value="${a.human_name}">
							<input type="hidden"  name=" salary_standard_id"  value="${a.salary_standard_id}">
							<input type="hidden"  name=" first_kind_id"  value="${a.first_kind_id}">
							<input type="hidden"  name=" first_kind_name"  value="${a.first_kind_name}">
							<input type="hidden"  name=" second_kind_id"  value="${a.second_kind_id}">
							<input type="hidden"  name=" second_kind_name"  value="${a.second_kind_name}">
							<input type="hidden"  name=" third_kind_id"  value="${a.third_kind_id}">
							<input type="hidden"  name=" third_kind_name"  value="${a.third_kind_name}"> --%>
						</td>
						<td>
							${a.human_name}
						</td>
						
						<c:forEach items="${list2 }" varStatus="status" var="standard2" >
								<td class="TD_STYLE1">							
									${standard2.salary}
								</td>				
						</c:forEach>
						<td>
							<input type="text" id="mynull1"  name="bouns_sum"   class="INPUT_STYLE2" />
						</td>
						<td>
							<input type="text" id="mynull2"  name="sale_sum"    class="INPUT_STYLE2"/>
						</td>
						<td>
							<input type="text" id="mynull3"  name="deduct_sum"   class="INPUT_STYLE2"/>
						</td>
						<td>
						</td>					
					</tr>	
					</c:forEach>
			</table>			
		</form>
	</body>
</html>
