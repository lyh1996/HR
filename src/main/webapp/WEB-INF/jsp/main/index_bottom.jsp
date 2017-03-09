<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>

<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=UTF-8">
<!-- <link rel="stylesheet" href="images/CSS.css" type="text/css"> -->

<style type="text/css">
<!--
.style1 {font-size: 12px}
body {
	margin-top: 0px;
	margin-bottom: 0px;
}
--
</style>
<style type="text/css">
    body {
	margin:0;
	padding:0;
	font: 11px/1.5em Verdana;
}

h2 {
	font: bold 14px Verdana, Arial, Helvetica, sans-serif;
	color: #000;
	margin: 0px;
	padding: 0px 0px 0px 15px;
}
 
/*- Menu Tabs--------------------------- */ 


    #tabs {
      float:left;
      width:100%;
      background:#BBD9EE;
      font-size:93%;
      line-height:normal;
      }
    #tabs ul {
	margin:0;
	padding:10px 10px 0 50px;
	list-style:none;
      }
    #tabs li {
      display:inline;
      margin:0;
      padding:0;
      }
    #tabs a {
      float:left;
      background:url("images/tableft.gif") no-repeat left top;
      margin:0;
      padding:0 0 0 4px;
      text-decoration:none;
      }
    #tabs a span {
      float:left;
      display:block;
      background:url("images/tabright.gif") no-repeat right top;
      padding:5px 15px 4px 6px;
      color:#666;
      }
    /* Commented Backslash Hack hides rule from IE5-Mac \*/
    #tabs a span {float:none;}
    /* End IE5-Mac hack */
    #tabs a:hover span {
      color:#FF9834;
      }
    #tabs a:hover {
      background-position:0% -42px;
      }
    #tabs a:hover span {
      background-position:100% -42px;
      }


	  
/*- Menu Tabs B--------------------------- */

    #tabsB {
      float:left;
      width:100%;
      background:#F4F4F4;
      font-size:93%;
      line-height:normal;
      }
    #tabsB ul {
	margin:0;
	padding:10px 10px 0 50px;
	list-style:none;
      }
    #tabsB li {
      display:inline;
      margin:0;
      padding:0;
      }
    #tabsB a {
      float:left;
      background:url("images/tableftB.gif") no-repeat left top;
      margin:0;
      padding:0 0 0 4px;
      text-decoration:none;
      }
    #tabsB a span {
      float:left;
      display:block;
      background:url("images/tabrightB.gif") no-repeat right top;
      padding:5px 15px 4px 6px;
      color:#666;
      }
    /* Commented Backslash Hack hides rule from IE5-Mac \*/
    #tabsB a span {float:none;}
    /* End IE5-Mac hack */
    #tabsB a:hover span {
      color:#000;
      }
    #tabsB a:hover {
      background-position:0% -42px;
      }
    #tabsB a:hover span {
      background-position:100% -42px;
      }
	
	
	
/*- Menu Tabs C--------------------------- */

    #tabsC {
      float:left;
      width:100%;
      background:#EDF7E7;
      font-size:93%;
      line-height:normal;
      }
    #tabsC ul {
	margin:0;
	padding:10px 10px 0 50px;
	list-style:none;
      }
    #tabsC li {
      display:inline;
      margin:0;
      padding:0;
      }
    #tabsC a {
      float:left;
      background:url("images/tableftC.gif") no-repeat left top;
      margin:0;
      padding:0 0 0 4px;
      text-decoration:none;
      }
    #tabsC a span {
      float:left;
      display:block;
      background:url("images/tabrightC.gif") no-repeat right top;
      padding:5px 15px 4px 6px;
      color:#464E42;
      }
    /* Commented Backslash Hack hides rule from IE5-Mac \*/
    #tabsC a span {float:none;}
    /* End IE5-Mac hack */
    #tabsC a:hover span {
      color:#FFF;
      }
    #tabsC a:hover {
      background-position:0% -42px;
      }
    #tabsC a:hover span {
      background-position:100% -42px;
      }  
	
	
	
/*- Menu Tabs D--------------------------- */

    #tabsD {
      float:left;
      width:100%;
      background:#FCF3F8;
      font-size:93%;
      line-height:normal;
	  border-bottom:1px solid #F4B7D6;
      }
    #tabsD ul {
	margin:0;
	padding:10px 10px 0 50px;
	list-style:none;
      }
    #tabsD li {
      display:inline;
      margin:0;
      padding:0;
      }
    #tabsD a {
      float:left;
      background:url("images/tableftD.gif") no-repeat left top;
      margin:0;
      padding:0 0 0 4px;
      text-decoration:none;
      }
    #tabsD a span {
      float:left;
      display:block;
      background:url("images/tabrightD.gif") no-repeat right top;
      padding:5px 15px 4px 6px;
      color:#C7377D;
      }
    /* Commented Backslash Hack hides rule from IE5-Mac \*/
    #tabsD a span {float:none;}
    /* End IE5-Mac hack */
    #tabsD a:hover span {
      color:#C7377D;
      }
    #tabsD a:hover {
      background-position:0% -42px;
      }
    #tabsD a:hover span {
      background-position:100% -42px;
      }  
	
	
	
/*- Menu Tabs E--------------------------- */

    #tabsE {
      float:left;
      width:100%;
      background:#000;
      font-size:93%;
      line-height:normal;

      }
    #tabsE ul {
	margin:0;
	padding:10px 10px 0 50px;
	list-style:none;
      }
    #tabsE li {
      display:inline;
      margin:0;
      padding:0;
      }
    #tabsE a {
      float:left;
      background:url("images/tableftE.gif") no-repeat left top;
      margin:0;
      padding:0 0 0 4px;
      text-decoration:none;
      }
    #tabsE a span {
      float:left;
      display:block;
      background:url("images/tabrightE.gif") no-repeat right top;
      padding:5px 15px 4px 6px;
      color:#FFF;
      }
    /* Commented Backslash Hack hides rule from IE5-Mac \*/
    #tabsE a span {float:none;}
    /* End IE5-Mac hack */
    #tabsE a:hover span {
      color:#FFF;
      }
    #tabsE a:hover {
      background-position:0% -42px;
      }
    #tabsE a:hover span {
      background-position:100% -42px;
      }  
	
	
	
/*- Menu Tabs F--------------------------- */

    #tabsF {
      float:left;
      width:100%;
      background:#efefef;
      font-size:93%;
      line-height:normal;
	  border-bottom:1px solid #666;
      }
    #tabsF ul {
	margin:0;
	padding:10px 10px 0 50px;
	list-style:none;
      }
    #tabsF li {
      display:inline;
      margin:0;
      padding:0;
      }
    #tabsF a {
      float:left;
      background:url("images/tableftF.gif") no-repeat left top;
      margin:0;
      padding:0 0 0 4px;
      text-decoration:none;
      }
    #tabsF a span {
      float:left;
      display:block;
      background:url("images/tabrightF.gif") no-repeat right top;
      padding:5px 15px 4px 6px;
      color:#666;
      }
    /* Commented Backslash Hack hides rule from IE5-Mac \*/
    #tabsF a span {float:none;}
    /* End IE5-Mac hack */
    #tabsF a:hover span {
      color:#FFF;
      }
    #tabsF a:hover {
      background-position:0% -42px;
      }
    #tabsF a:hover span {
      background-position:100% -42px;
      }
	
	
	
/*- Menu Tabs G--------------------------- */

    #tabsG {
      float:left;
      width:100%;
      background:#666;
      font-size:93%;
      line-height:normal;
      }
    #tabsG ul {
	margin:0;
	padding:10px 10px 0 50px;
	list-style:none;
      }
    #tabsG li {
      display:inline;
      margin:0;
      padding:0;
      }
    #tabsG a {
      float:left;
      background:url("images/tableftG.gif") no-repeat left top;
      margin:0;
      padding:0 0 0 4px;
      text-decoration:none;
      }
    #tabsG a span {
      float:left;
      display:block;
      background:url("images/tabrightG.gif") no-repeat right top;
      padding:5px 15px 4px 6px;
      color:#FFF;
      }
    /* Commented Backslash Hack hides rule from IE5-Mac \*/
    #tabsG a span {float:none;}
    /* End IE5-Mac hack */
    #tabsG a:hover span {
      color:#FFF;
      }
    #tabsG a:hover {
      background-position:0% -42px;
      }
    #tabsG a:hover span {
      background-position:100% -42px;
      } 


/*- Menu Tabs H--------------------------- */

    #tabsH {
      float:left;
      width:100%;
      background:#000;
      font-size:93%;
      line-height:normal;
      }
    #tabsH ul {
	margin:0;
	padding:10px 10px 0 50px;
	list-style:none;
      }
    #tabsH li {
      display:inline;
      margin:0;
      padding:0;
      }
    #tabsH a {
      float:left;
      background:url("images/tableftH.gif") no-repeat left top;
      margin:0;
      padding:0 0 0 4px;
      text-decoration:none;
      }
    #tabsH a span {
      float:left;
      display:block;
      background:url("images/tabrightH.gif") no-repeat right top;
      padding:5px 15px 4px 6px;
      color:#FFF;
      }
    /* Commented Backslash Hack hides rule from IE5-Mac \*/
    #tabsH a span {float:none;}
    /* End IE5-Mac hack */
    #tabsH a:hover span {
      color:#FFF;
      }
    #tabsH a:hover {
      background-position:0% -42px;
      }
    #tabsH a:hover span {
      background-position:100% -42px;
      }


/*- Menu Tabs I--------------------------- */

    #tabsI {
      float:left;
      width:100%;
      background:#EFF4FA;
      font-size:93%;
      line-height:normal;
	  border-bottom:1px solid #DD740B;
      }
    #tabsI ul {
	margin:0;
	padding:10px 10px 0 50px;
	list-style:none;
      }
    #tabsI li {
      display:inline;
      margin:0;
      padding:0;
      }
    #tabsI a {
      float:left;
      background:url("images/tableftI.gif") no-repeat left top;
      margin:0;
      padding:0 0 0 5px;
      text-decoration:none;
      }
    #tabsI a span {
      float:left;
      display:block;
      background:url("images/tabrightI.gif") no-repeat right top;
      padding:5px 15px 4px 6px;
      color:#FFF;
      }
    /* Commented Backslash Hack hides rule from IE5-Mac \*/
    #tabsI a span {float:none;}
    /* End IE5-Mac hack */
    #tabsI a:hover span {
      color:#FFF;
      }
    #tabsI a:hover {
      background-position:0% -42px;
      }
    #tabsI a:hover span {
      background-position:100% -42px;
      }


/*- Menu Tabs J--------------------------- */

    #tabsJ {
      float:right;
      width:100%;
      background:#505050;
      font-size:93%;
      line-height:normal;
	  border-bottom:1px solid #24618E;
      }
    #tabsJ ul {
		font-size: 9pt;
	float:right;
	margin:0;
	padding:0px 0px 0 50px;
	list-style:none;
      }
    #tabsJ li {
	  font-size: 9pt;
      display:inline;
      margin:0;
      padding:0;
      }
    #tabsJ a {
      float:left;
      background:url("images/tableftJ.gif") no-repeat left top;
      margin:0;
      padding:0 0 0 5px;
      text-decoration:none;
      }
    #tabsJ a span {
      float:left;
      display:block;
      background:url("images/tabrightJ.gif") no-repeat right top;
      padding:5px 15px 4px 6px;
      color:#24618E;
      }
    /* Commented Backslash Hack hides rule from IE5-Mac \*/
    #tabsJ a span {float:none;}
    /* End IE5-Mac hack */
    #tabsJ a:hover span {
      color:#FFF;
      }
    #tabsJ a:hover {
      background-position:0% -42px;
      }
    #tabsJ a:hover span {
      background-position:100% -42px;
      }


/*- Menu Tabs K--------------------------- */ 	

    #tabsK {
      float:left;
      width:100%;
      background:#E7E5E2;
      font-size:93%;
      line-height:normal;
	  border-bottom:1px solid #54545C;
      }
    #tabsK ul {
	margin:0;
	padding:10px 10px 0 50px;
	list-style:none;
      }
    #tabsK li {
      display:inline;
      margin:0;
      padding:0;
      }
    #tabsK a {
      float:left;
      background:url("images/tableftK.gif") no-repeat left top;
      margin:0;
      padding:0 0 0 4px;
      text-decoration:none;
      }
    #tabsK a span {
      float:left;
      display:block;
      background:url("images/tabrightK.gif") no-repeat right top;
      padding:5px 15px 4px 6px;
      color:#FFF;
      }
    /* Commented Backslash Hack hides rule from IE5-Mac \*/
    #tabsK a span {float:none;}
    /* End IE5-Mac hack */
    #tabsK a:hover span {
      color:#FFF;
	  background-position:100% -42px;
      }
    #tabsK a:hover {
      background-position:0% -42px;
      }
    #tabsK a:hover span {
      background-position:100% -42px;
	  }
</style>
</head>

<body topmargin="0" bgcolor="#505050">
<script> 
function tick() {
var now = new Date();
var hours, minutes, seconds, noon;
var intHours, intMinutes, intSeconds;
intHours = now.getHours();
intMinutes = now.getMinutes();
intSeconds = now.getSeconds();
if (intHours < 12) {
hours = intHours+":";
noon = "A.M.";
} else {
intHours = intHours - 12
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
timeString = hours+minutes+seconds+noon;
Clock.innerHTML = timeString;
window.setTimeout("tick();", 100);
}
window.onload = tick;

function winopen(){
var targeturl="executive/index.jsp"
newwin=winopen("","","scrollbars")
if (document.all){
newwin.moveTo(0,0)
newwin.resizeTo(screen.width,screen.height)
}
newwin.location=targeturl
}
</script>
<div align="left">
  <center>
<table width="100%" height="25" border="0" cellpadding="0" cellspacing="0" background="images/tab_inactive1.jpg" style="border-collapse: collapse">
        <tr>
		  <td align="left" width="40%">
          <p class="style1" align="left"><font color="#ffffff"style="font-size: 13">
          <script type="text/javascript">
          var now = new Date();
		  document.write(now.getFullYear()+"-"+(now.getMonth()+1)+"-"+now.getDate()+" ");
          </script></font>  
          <font id="Clock" align="center" style="font-size: 13; color:#ffffff">
          <script type="text/javascript">
			var day = now.getDay();
			switch(day)
			{
				case 1:document.write("星期一");break;
				case 2:document.write("星期二");break;
				case 3:document.write("星期三");break;
				case 4:document.write("星期四");break;
				case 5:document.write("星期五");break;
				case 6:document.write("星期六");break;
				case 0:document.write("星期日");break;
			}
		</script>
          </font>  
          客户_ <%out.print((String)session.getAttribute("userName")); %> 您好!</p>          </td>

<td>
<div id="tabsJ">
<ul>
    <li><a href=""  target="_blank" title="Link 1"><span><font color="#FFFFFF">我的公告</span></a></li>
    <li><a href="" target="_blank" title="Link 2"><span><font color="#FFFFFF">我的同事</span></a></li>
    <li><a href=""  target="_blank" title="Link 3"><span><font color="#FFFFFF">我的搜索</span></a></li>
	<li><a href=""  target="_blank" title="Link 4"><span><font color="#FFFFFF">我的网站</span></a></li>
	<li><a href="users.do?operate=logout" target="top" title="Link 5"><span><font color="#FFFFFF">退出系统</span></a></li>
 </ul>
</div>
</td>
</tr>
</table></center>
</div>
</body>
</html>