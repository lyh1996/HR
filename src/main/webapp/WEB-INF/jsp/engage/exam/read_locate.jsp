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
			
			function toquery(){
				if(confirm("确定要提交吗？")==true){
				document.forms[0].action = document.forms[0].action + "?operate=toReadList";
				document.forms[0].submit();
				}
			}
			</script>
	</head>

	<body>
		<form method="post" action="engageAnswer.do">
			<table width="100%">
				<tr>
					<td>
						<font color="#0000CC">您正在做的业务是：人力资源--招聘管理--招聘考试管理--考试阅卷</font>
					</td>
				</tr>
				<tr>
					<td>
						<div align="right">
							<input type="button" value="查询" class="BUTTON_STYLE1" onclick="toquery()">
						</div>
					</td>
				</tr>
			</table>
			<table width="100%" border="1" cellpadding=0 cellspacing=1
				bordercolorlight=#848284 bordercolordark=#eeeeee
				class="TABLE_STYLE1">
				
				<tr>
					<td width="10%" class="TD_STYLE1">
						姓名
					</td>
					<td class="TD_STYLE2" > 
						<input type="text" name="human_name" class="INPUT_STYLE1" id="human_name">
					</td>
					<td width="10%" class="TD_STYLE1">
						身份证号码
					</td>
					<td class="TD_STYLE2" > 
						<input type="text" name="human_idcard" class="INPUT_STYLE1" id="human_idcard">
					</td>
				</tr>
				<tr>
					<td class="TD_STYLE1">
						职位分类
					</td>
					<td class="TD_STYLE2" >
						<select Class="SELECT_STYLE1"
							name="major_kind_name"  id="MajorKind">
							<option value="0/null">请选择职位分类</option>
							<c:forEach items="${ list2 }" var="configfilemajorkinds">
							<option value="${configfilemajorkinds.major_kind_id}/${configfilemajorkinds.major_kind_name}">${configfilemajorkinds.major_kind_id }/${configfilemajorkinds.major_kind_name }</option>
						</c:forEach>
						</select>
					</td>
					<td class="TD_STYLE1">
						职位名称
					</td>
					<td class="TD_STYLE2" >
						<select Class="SELECT_STYLE1"
							name="major_name"  id="majorName">
							<option value="0/null">请选择职位名称</option>
						</select>
					</td>
				</tr>
			</table>
		</form>
	</body>	
</html>
