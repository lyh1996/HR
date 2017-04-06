<%@ page contentType="text/html; charset=UTF-8" language="java" errorPage="" %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<%
	//添加基底网址
	String path=request.getContextPath();//doubanTeacher
	String basePath=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/table.css" type="text/css">
<script type="text/javascript" src="javascript/comm/comm.js"></script>
</head>
<body>
<form method="post" action="updateconfigfilefirstkinds">
	<input id="bid" type="hidden" value="${configFileFirstKind.ffkId}" name="ffkId">
<table width="100%" >
  <tr>
    <td> 
    <font color="#0000CC">您正在做的业务是：人力资源--客户化设置--人力资源档案管理设置--I级机构设置 </font></td>
  </tr>
  <tr>
    <td align="right">
    	<input type="submit"  value="提交" /> &nbsp;&nbsp;<a
					href="getconfigfilefirstkinds">返回</a>
    </td>
  </tr>
  </table>
  
<table width="100%"  border="1" cellpadding=0 cellspacing=1 bordercolorlight=#848284 bordercolordark=#eeeeee class="TABLE_STYLE1">
  <tr>
    <td width="19%" class="TD_STYLE1">I级机构编号</td>
    <td width="81%" class="TD_STYLE2"><input type="text" name="firstKindId"  styleClass="INPUT_STYLE1" style="background-color: D4F8D4"value="${configFileFirstKind.firstKindId}"readonly="true"/></td>
  </tr>
  <tr>
    <td class="TD_STYLE1">I级机构名称</td>
    <td class="TD_STYLE2"><input type="text" name="firstKindName"  styleClass="INPUT_STYLE1" style="background-color: D4F8D4"value="${configFileFirstKind.firstKindName}"/></td>
  </tr>
  <tr>
    <td class="TD_STYLE1">薪酬发放责任人编号（多个编号之间请用"半角逗号"加"一个空格"隔开，如", "）</td>
    <td class="TD_STYLE2"><textarea name="firstKindSalaryId"  styleClass="TEXTAREA_STYLE1" rows="4" style="background-color: D4F8D4" >${configFileFirstKind.firstKindSalaryId}</textarea></td>
  </tr>
  <tr>
    <td class="TD_STYLE1">销售责任人编号（多个编号之间请用"半角逗号"加"一个空格"隔开，如", "）</td>
    <td class="TD_STYLE2"><textarea name="firstKindSaleId" styleClass="TEXTAREA_STYLE1" rows="4" style="background-color: D4F8D4">${configFileFirstKind.firstKindSaleId}</textarea></td>
  </tr>
</table>
</form>
</body>
</html>
