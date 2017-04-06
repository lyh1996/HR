<%@ page contentType="text/html; charset=UTF-8" language="java" errorPage="" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" href="css/table.css" type="text/css" >
<script type="text/javascript" src="javascript/comm/comm.js"></script>
<script type="text/javascript">
//下面用于多图片上传预览功能

function setImagePreviews() {

	var docObj = document.getElementById("doc");

	var dd = document.getElementById("dd");

	dd.innerHTML = "";

	var fileList = docObj.files;

	for (var i = 0; i < fileList.length; i++) {

		dd.innerHTML += "<div style='float:left;padding-right:20px' > <img id='img" + i + "'  /> </div>";

		var imgObjPreview = document.getElementById("img" + i);

		if (docObj.files && docObj.files[i]) {

			//火狐下，直接设img属性

			imgObjPreview.style.display = 'block';

			imgObjPreview.style.width = '150px';

			imgObjPreview.style.height = '180px';

			//imgObjPreview.src = docObj.files[0].getAsDataURL();

			//火狐7以上版本不能用上面的getAsDataURL()方式获取，需要以下方式

			imgObjPreview.src = window.URL
					.createObjectURL(docObj.files[i]);

		}

		else {

			//IE下，使用滤镜

			docObj.select();

			var imgSrc = document.selection.createRange().text;

			alert(imgSrc);

			var localImagId = document.getElementById("img" + i);

			//必须设置初始大小

			localImagId.style.width = "150px";

			localImagId.style.height = "180px";

			//图片异常的捕捉，防止用户修改后缀来伪造图片

			try {

				localImagId.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale)";

				localImagId.filters
						.item("DXImageTransform.Microsoft.AlphaImageLoader").src = imgSrc;

			}

			catch (e) {

				alert("您上传的图片格式不正确，请重新选择!");

				return false;

			}

			imgObjPreview.style.display = 'none';

			document.selection.empty();

		}

	}

	return true;

}
	</script>
</head>
<body>
<form method="post" action="humanfile.do" enctype="multipart/form-data">
<table width="100%" >
  <tr>
    <td colspan="2"> 
    <font color="#0000CC">您正在做的业务是：人力资源--人力资源档案管理--人力资源档案登记</font></td>
  </tr>
  <tr>
    <td width="59%">提交成功，如有照片，请选择上传照片(.jpg、.gif文件)
    <input type="file"   id="doc" name="imgUrl" multiple="multiple" onchange="setImagePreviews()"  class="FILE_STYLE1"  width="100%"/>
    <td width="41%" align="right">
    <input type="button" value="上传照片" class="BUTTON_STYLE1" onclick="doUpLoadPhoto2('register');">
	<input type="button" value="上传附件" class="BUTTON_STYLE1" onclick="toUpLoadAttach2('register');">
      <input type="button" value="完成" class="BUTTON_STYLE1" onclick="javascript:finish();"></td>
  </tr>
  <tr>
				<td align="center"><div id="dd"></div></td>
			</tr>
  </table>

</form>
</body>
</html>
