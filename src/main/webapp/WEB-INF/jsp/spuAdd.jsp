<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";%>
<base href="<%=basePath %>" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
<script type="text/javascript">
	function click_img(index){
		$("#file_"+index).click();
	}
	
	function replace_image(index){
		//获得图片对象  H5
		var blob_image=$("#file_"+index)[0].files[0];
		var url = window.URL.createObjectURL(blob_image);
		
		//替换
		$("#img_"+index).attr("src",url);
		
		var length = $(":file").size();
	
		if((index+1)==length && length<4){
			add_image(index);
		}
		
	}
	
	function add_image(index){
		var a ='<div id="d_'+(index+1)+'" style="float:left">';
		var b ='<input id="file_'+(index+1)+'" type="file" name="files" style="display: none" onchange="replace_image('+(index+1)+')"/>';
		var c ='<img id="img_'+(index+1)+'" onclick="click_img('+(index+1)+')" src="image/upload_hover.png" style="cursor:pointer;" width="100px" height="100px"/>';
		var d ='</div>';
		var total=a+b+c+d;
		
		$("#d_"+index).after(total);
	}
	
	
</script>
</head>
<body>
		有spu："flbh1":${spu.flbh1} | "flbh2":${spu.flbh2} | "pp_id":${spu.pp_id}<br>
		无spu："flbh1":${flbh1} | "flbh2":${flbh2} | "pp_id":${pp_id}<br>
		
		Spu信息添加
		<form action="spu_add.do" enctype="multipart/form-data" method="post">
		    <input type="hidden" value="${spu.flbh1}" name="flbh1">
		    <input type="hidden" value="${spu.flbh2}" name="flbh2">
		    <input type="hidden" value="${spu.pp_id}" name="pp_id">
			商品名称：<input type="text" name="shp_mch"  /><br>
			商品描述：<textarea rows="10" cols="50" name="shp_msh"></textarea><br>
			商品图片：上传图片上限为4张<br>
			<div id="d_0" style="float:left" width=100>
				<input id="file_0" type="file" name="files" style="display: none" onchange="replace_image(0)"/>
				<img id="img_0" onclick="click_img(0)" src="image/upload_hover.png" style="cursor:pointer;" width="100px" height="100px" />
			</div>
		  <input type="submit" value="提交">
		</form>
</body>
</html>