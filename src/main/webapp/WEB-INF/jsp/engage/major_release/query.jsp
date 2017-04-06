<%@ page contentType="text/html; charset=utf-8" language="java"
	errorPage=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<html>
<head>
<link rel="stylesheet" href="css/table.css" type="text/css">
<script type="text/javascript" src="javascript/comm/comm.js"></script>
<script type="text/javascript">
		function shenqin(id)
		{
			document.forms[0].action = "engageresume.do?operate=toApply&id="+id;
			document.forms[0].submit();
		}
</script>
</head>

<body>
<form action="engagemajorrelease.do" method="post">
<table width="100%" >
  <tr>
    <td> 
    <font color="#0000CC">您正在做的业务是：人力资源--招聘管理--职位发布管理--职位发布查询 </font></td>
  </tr>
  <tr>
   <td align="right"><input type="button" class="SUBMIT_STYLE1" value="申请该职位" onclick="javascript:shenqin(${list.mre_id })">
      <input type="button" class="SUBMIT_STYLE1" value="返回" onclick="history.back()">
    </td>
  </tr>
</table>
	<table class="TABLE_STYLE1" border="1" width="100%" cellpadding=0
				cellspacing=1 bordercolorlight=#848284 bordercolordark=#eeeeee>
				<tr class="TR_STYLE1">
					<td class="TD_STYLE1">
						I级机构
					</td>
					<td class="TD_STYLE2" width="13%" name="first_kind_name" id="FirstKind">					
							${list.first_kind_name }
					</td>
					<td class="TD_STYLE1" width="11%" >
						II级机构
					</td>
					<td class="TD_STYLE2" width="13%">					
							${list.second_kind_name }
					</td>
					<td class="TD_STYLE1" width="11%">
						III级机构
					</td>
					<td class="TD_STYLE2" width="13%">
							${list.third_kind_name }
					</td>
					<td class="TD_STYLE1" width="11%">
						招聘类型
					</td>
					<td class="TD_STYLE2" width="13%">
						${list.engage_type }
					</td>
				</tr>
				<tr class="TR_STYLE1">
					<td class="TD_STYLE1" width="11%">
						职位分类
					</td>
					<td class="TD_STYLE2" width="13%">						
							${list.major_kind_name }				
					</td>
					<td class="TD_STYLE1" width="11%">
						职位名称
					</td>
					<td class="TD_STYLE2" width="13%">					
							${list.major_name }
					</td>
					<td class="TD_STYLE1" width="11%">
						招聘人数
					</td>
					<td class="TD_STYLE2" width="13%">
							${list.human_amount }
					</td>
					<td class="TD_STYLE1" width="11%">
						截止日期
					</td>
					<td class="TD_STYLE2" width="13%">
							${list.deadline }
					</td>
				</tr>
				<tr class="TR_STYLE1">
					<td class="TD_STYLE1" width="11%">
						登记人
					</td>
					<td class="TD_STYLE2" width="13%">
						${list.register}
					</td>
					<td class="TD_STYLE1" width="11%">
						登记时间
					</td>
					<td class="TD_STYLE2" width="13%">
						${list.regist_time}
					</td>
					<td class="TD_STYLE1" width="11%">
						变更人
					</td>
					<td class="TD_STYLE2" width="13%">
						${list.changer}
					</td>
					<td class="TD_STYLE1" width="11%">
						变更时间
					</td>
					<td class="TD_STYLE2" width="13%">
						${list.change_time}					
					</td>
				</tr>
				<tr class="TR_STYLE1">
					<td class="TD_STYLE1" height="65" width="11%">
						职位描述
					</td>
					<td class="TD_STYLE2" colspan="7">
							<textarea name="major_describe"
						class="TEXTAREA_STYLE1" rows="4" readonly="true" >${list.major_describe }</textarea>
					</td>
				</tr>
				<tr class="TR_STYLE1">
					<td class="TD_STYLE1">
						招聘要求
					</td>
					<td class="TD_STYLE2" colspan="7">
							<textarea name="engage_required"
						class="TEXTAREA_STYLE1" rows="4" readonly="true" >${list.engage_required }</textarea>
					</td>
				</tr>
			</table>

</form>
</body>
</html>
