<%@ page contentType="text/html; charset=UTF-8" language="java"
	errorPage=""%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" href="css/table.css" type="text/css">
		<script type="text/javascript" src="javascript/comm/comm.js"></script>
	</head>
	<body>
		<form method="post" action="configpublicchar.do">
			<table width="100%">
				<tr>
					<td>
						<font color="#0000CC">您正在做的业务是：人力资源--客户化设置--人力资源档案管理设置--公共属性设置
						</font>
					</td>
				</tr>
				<tr>
					<td align="right">
						<input type="button" value="提交" class="BUTTON_STYLE1"
							onclick="javascript:doAdd();">
						<input type="button" value="返回" class="BUTTON_STYLE1"
							onclick="history.back();">
					</td>
				</tr>
			</table>

			<table width="100%" border="1" cellpadding=0 cellspacing=1
				bordercolorlight=#848284 bordercolordark=#eeeeee
				class="TABLE_STYLE1">
				<tr>
					<td width="19%" class="TD_STYLE1">
						属性种类
					</td>
					<td width="81%" class="TD_STYLE2">
						<select name="attribute_kind" styleClass="SELECT_STYLE2" >
							<option value="国籍">国籍&nbsp;&nbsp;&nbsp;</option>
							<option value="民族">民族&nbsp;&nbsp;&nbsp;</option>
							<option value="政治面貌">政治面貌&nbsp;&nbsp;&nbsp;</option>
							<option value="宗教信仰">宗教信仰&nbsp;&nbsp;&nbsp;</option>
							<option value="爱好">爱好&nbsp;&nbsp;&nbsp;</option>
							<option value="特长">特长&nbsp;&nbsp;&nbsp;</option>
							<option value="教育年限">教育年限&nbsp;&nbsp;&nbsp;</option>
							<option value="学历">学历&nbsp;&nbsp;&nbsp;</option>
							<option value="专业">专业&nbsp;&nbsp;&nbsp;</option>
							<option value="培训项目">培训项目&nbsp;&nbsp;&nbsp;</option>
							<option value="培训等级">培训成绩&nbsp;&nbsp;&nbsp;</option>
							<option value="奖励项目">奖励项目&nbsp;&nbsp;&nbsp;</option>
							<option value="奖励等级">奖励等级&nbsp;&nbsp;&nbsp;</option>
							<option value="奖励等级">薪酬设置&nbsp;&nbsp;&nbsp;</option>
						</select>
					</td>
				</tr>
				<tr>
					<td class="TD_STYLE1">
						属性名称
					</td>
					<td class="TD_STYLE2">
						 <input type="text" name="attribute_name" class="INPUT_STYLE1" >
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>

