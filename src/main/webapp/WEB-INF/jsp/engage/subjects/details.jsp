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
		<link rel="stylesheet" href="css/table.css" type="text/css">
		<script type="text/javascript" src="javascript/comm/comm.js"></script>
		<script type="text/javascript" src="javascript/comm/time.js"></script>
	</head>
	<body>
		<table width="100%">
			<tr>
				<td>
					<font color="#0000CC">您正在做的业务是：人力资源--招聘管理--招聘考试题库管理--试题查询 </font>
				</td>
			</tr>
			<tr>
				<td align="right">
					<input type="button" class="BUTTON_STYLE1" value="返回" onclick="history.back();">
				</td>
			</tr>
		</table>
		<table class="TABLE_STYLE1" border="1" width="100%" cellpadding=0
			cellspacing=1 bordercolorlight=#848284 bordercolordark=#eeeeee>
			<tr class="TR_STYLE1">
				<td width="8%" nowrap class="TD_STYLE1">
						试题I级分类
				</td>
				<td width="14%" class="TD_STYLE2">
					 ${list.first_kind_name }
				</td>
				<td width="8%" nowrap class="TD_STYLE1">
						试题II级分类
				</td>
				<td width="14%" class="TD_STYLE2">
				 ${list.second_kind_name }
				</td>
				<td width="10%" nowrap class="TD_STYLE1">
						登记人
				</td>
				<td width="14%" class="TD_STYLE2">
					 ${list.register }
				</td>
				<td width="10%" class="TD_STYLE1">
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
					<td class="TD_STYLE2" colspan="7" height="68">
						 ${list.content }
					</td>
			</tr>
			<tr>
					<td class="TD_STYLE1">
						答案a
					</td>
					<td class="TD_STYLE2" colspan="7">
					 ${list.key_a }
					</td>
				</tr>
			<tr>
					<td class="TD_STYLE1">
						答案b
					</td>
					<td class="TD_STYLE2" colspan="7">
						 ${list.key_b }
					</td>
				</tr>
				<tr>
					<td class="TD_STYLE1">
						答案c
					</td>
					<td class="TD_STYLE2" colspan="7">
						 ${list.key_c }
					</td>
				</tr>
				<tr>
					<td class="TD_STYLE1">
						答案d
					</td>
					<td class="TD_STYLE2" colspan="7">
						 ${list.key_d }
					</td>
				</tr>
				<tr>
					<td class="TD_STYLE1">
						答案e
					</td>
					<td class="TD_STYLE2" colspan="7">
						 ${list.key_e }
					</td>
				</tr>
				<tr>
					<td class="TD_STYLE1">
						正确答案
					</td>
					<td class="TD_STYLE2">
					 ${list.correct_key }
					</td>
					<td class="TD_STYLE1">
						试题出处
					</td>
					<td class="TD_STYLE2">
					 ${list.derivation }
					</td>
					 
				</tr>
		</table>
	</body>
</html>
