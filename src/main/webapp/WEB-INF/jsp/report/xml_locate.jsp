<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	%>
<html>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
		<link rel="stylesheet" href="table.css" type="text/css">
		<link rel="stylesheet" type="text/css" media="all"
			href="<%=path %>/html/javascript/calendar/calendar-win2k-cold-1.css">
		<script type="text/javascript" src="<%=path %>/html/javascript/calendar/cal.js"></script>
		<script type="text/javascript" src="<%=path %>/html/javascript/comm/list.js"></script>
		<script type="text/javascript" src="dwr/engine.js"></script>
		<script type="text/javascript" src="dwr/util.js"></script>
		<script type="text/javascript" src="dwr/interface/configFileKindBizImpl.js"></script>
		<script type="text/javascript" src="dwr/interface/peopleResourceMoveBizImpl.js"></script>
		<script type="text/javascript">
			function doTwo(value){
				configFileKindBizImpl.doSearchConfigFileSecondKind(value,callback_doTwo);
			}
			function callback_doTwo(data){
			    $("erji").options.length=1;
			    $("shanji").options.length=1;
				DWRUtil.addOptions($("erji"),data,"secondKindId","secondKindName");
			}
			
			function doThree(value){
				configFileKindBizImpl.doSearchConfigFileThirdKind($("yiji").value,value,callback_doThree);
			}
			function callback_doThree(data){
				$("shanji").options.length=1;
				DWRUtil.addOptions($("shanji"),data,"thirdKindId","thirdKindName");
			}
			
			function downExport(){
				var count=0;
		 		for(i=0;i<document.all.str.length;i++){
					if(document.all.str[i].checked){
						count=count+1;
					}
		 		}
		 		if(count==0){
		 			alert("请选择你要导出的字段...");
		 			return false;
		 		}
			document.forms[0].action="<%=path %>/recordAction!XmlLocate.action";
			document.forms[0].submit();
				return true;
			} 
			function selAll(args){
				var c=document.all.choice.value;
				if(c=="全选"){
					document.all.choice.value="取消";
				}else{
					document.all.choice.value="全选";
				}
				for(var i=0;i<args.elements.length;i++){
					if(args.elements[i].type=="checkbox"){
						if(c=="全选")
							args.elements[i].checked=true;
						else
							args.elements[i].checked=false;
					}
				}
			}
	</script>
	</head>

	<body><br>
		<form action="" method="post">
				<table width="100%">
				<tr>
					<td>
						<font color="#0000CC">您正在做的业务是：人力资源--标准数据报表--XML标准数据报表</font>
					</td>
				</tr>
				<tr>
					<td align="right">
						
						<input type="button" value="确定" class="BUTTON_STYLE1" onclick="downExport()">
						<input type="button" value="返回" class="BUTTON_STYLE1"
							onclick="history.back();">
					</td>
				</tr>
			</table>
	<table width="100%" border="1" cellpadding=0 cellspacing=1
				class="TABLE_STYLE1">
				<tr class="TR_STYLE1">
					<td class="TD_STYLE1" colspan="4">
						请选择要导出的字段&nbsp;
						<input type="button" name="choice" value="全选"
							class="BUTTON_STYLE1" onclick="selAll(this.form)">
					</td>
				</tr>
				<input type="hidden" value="<s:property value='#request.tablename'/>" name="cpk.primaryKeyTable"/>
				<s:iterator id="x" value="#request.list" status="status">
    					<s:if test="#status.index%4==0">
    						<tr>
    						</tr>
    					</s:if>
    					<td class="TD_STYLE2">
    					<input type="checkbox" value="<s:property value="#x.primaryKey"/>" name="str"/>
    						<s:property value="#x.keyName"/>
						</td>
 				</s:iterator>
	</table>
	
	
		</form>
	</body>

</html>


