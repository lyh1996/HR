<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>" />
<title>New Document</title>
<meta name="Generator" content="EditPlus">
<meta name="Author" content="">
<meta name="Keywords" content="">
<meta name="Description" content="">

<link href="css/table.css" rel="stylesheet" type="text/css">
<link href="css/style.css" rel="stylesheet" type="text/css">
	<script type="text/javascript" src="javascript/comm/jquery-1.12.4.js"></script>

<script type="text/javascript">
	function selectRight(v) {

		var srs = document.getElementsByName('rightCode');

		var sr = document.getElementById(v);
		if (sr.checked) {
			if (v.length == 7) {
				var t1 = document.getElementById(v.substring(0, 5));
				t1.checked = true;
			}
			var t2 = document.getElementById(v.substring(0, 3));
			t2.checked = true;
		}

	}

	function allRight(v) {

		var sr = document.getElementById(v);
		if (sr.checked) {
			var srs = document.getElementsByName('rightCode');

			for (var i = 0; i < srs.length; i++) {
				if (srs[i].id.substring(0, v.length) == v) {
					srs[i].checked = true;
				}
			}

			if (v.length > 3) {
				var t = document.getElementById(v.substring(0, 3));
				 
				t.checked = true;
			}
		} else {
			var srs = document.getElementsByName('rightCode');
			for (var i = 0; i < srs.length; i++) {
				if (srs[i].id.substring(0, v.length) == v) {
					srs[i].checked = false;
				}
			}
		}

	}

	function aall() {
		var a = document.getElementById("a");
		var rs = document.getElementsByName("rightCode");

		if (a.checked) {
			for (var i = 0; i < rs.length; i++) {
				rs[i].checked = true;
			}
		} else {
			for (var i = 0; i < rs.length; i++) {
				rs[i].checked = false;
			}
		}

	}
</script><script type="text/javascript">
	function tosubmit() {
		if(confirm("确定要提交吗？")==true){
				document.forms[0].action = document.forms[0].action + "?operate=doDispact&id="+${roles.RId } ;
				document.forms[0].submit();
			}
		
	}
</script>
</head>


<body>
	<form method="post" action="right.do">
		<table width="100%">
			<tr>
				<td>&nbsp; <font color="#0000CC">您正在做的业务是:人力资源--权限管理--角色管理--权限分配</font>
				</td>
			</tr>
			<tr>
				<td align="right"><input type="button" value="保存"
					class="BUTTON_STYLE1" onclick="tosubmit()" />
					<input type="button" value="返回" class="common_button" onclick="history.back();"></td>
			</tr>
		</table>
		<table class="data_list_table">
			<tr>
				<th>角色名</th>
				<td>${roles.RName }</td>
				<th>角色描述</th>
				<td>${roles.RDesc }</td>
				<th>状态</th>
				<td><c:choose>
						<c:when test="${roles.RFlag== 0}">
      								禁用
    						</c:when>
						<c:when test="${roles.RFlag ==1}">
       								正常
   							 </c:when>
					</c:choose></td>
			</tr>
		</table>
		<br> <input type="checkbox" onclick="aall()" id="a">全选

		<table width="100%" border="1" cellpadding=0 cellspacing=1
			bordercolorlight=#848284 bordercolordark=#eeeeee class="TABLE_STYLE1">
			<tr height="30" align="center">
				<td width="200" align="left" class="TD_STYLE1">一级权限</td>
				<td align="center" class="TD_STYLE1">子模块---&gt;子模块（选定后保存）</td>

			</tr>
			<%--  高级注释：获得全部的权限循环(第一次) --%>
			<c:forEach var="r" items="${list }">
				<%--  高级注释：得到  根目录   -1 --%>
				<c:if test="${r.rightParentCode=='-1' }">
					<tr>
						<td>
							<div align="left">
								<p>
									<input type="checkbox" name="rightCode" value="${r.rightCode}"
										onclick="allRight('${r.rightCode}')" id="${r.rightCode}" />
									<SPAN class=node>${r.rightText } </SPAN>
								</p>
							</div>
						</td>
						<td>
							<table width="100%" border="1" cellpadding=0 cellspacing=1
								bordercolorlight=#848284 bordercolordark=#eeeeee
								class="TABLE_STYLE1">

								<%--  高级注释：获得全部的权限循环 （第二次）--%>
								<c:forEach items="${list }" var="r2">
									<%--  高级注释：得到根目录  下  的目录 --%>
									<c:if test="${r2.rightParentCode==r.rightCode}">
										<tr>
											<td width="200">
												<div>
													<p>
														<input type="checkbox" name="rightCode"
															value="${r2.rightCode}"
															onclick="allRight('${r2.rightCode}')"
															id="${r2.rightCode}" /> <SPAN class=node>${r2.rightText}</SPAN>
													</p>
												</div>
											</td>
											<td>
												<div>
													<%--  高级注释：获得全部的权限循环 （第三次）--%>
													<%--  高级注释： --%>
													<%--  高级注释： --%>
													<%--  高级注释： --%>
													<%--  高级注释： --%>
													<p>
														<c:forEach items="${list }" var="r3">
															<%--  高级注释：得到根目录  下  的目录 --%>
															<c:if test="${r3.rightParentCode==r2.rightCode}">
																<input type="checkbox" name="rightCode"
																	value="${r3.rightCode}"
																	onclick="selectRight('${r3.rightCode}')"
																	id="${r3.rightCode}" />
																<SPAN class=node>${r3.rightText}</SPAN>
															</c:if>
														</c:forEach>
													</p>

												</div>
											</td>

										</tr>
									</c:if>
								</c:forEach>
							</table>
						</td>
					</tr>
				</c:if>
			</c:forEach>
		</table>
	</form>
</body>
</html>