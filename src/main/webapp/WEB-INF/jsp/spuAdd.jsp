<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";%>
<base href="<%=basePath %>" />
	<link rel="stylesheet" type="text/css" href="js/easyui/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="js/easyui/themes/icon.css">
	<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
	<script type="text/javascript" src="js/easyui/jquery.easyui.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

</head>
<body>
		有spu："flbh1":${spu.flbh1} | "flbh2":${spu.flbh2} | "pp_id":${spu.pp_id}<br>
		<%-- 无spu："flbh1":${flbh1} | "flbh2":${flbh2} | "pp_id":${pp_id}<br> --%>
		
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
			</div><br><br><br><br><br><br><br>
			商品颜色：<span id="shp_ys_span_0" onclick="removeColorSpan(0)" style="width:50px;height:21.47px;"></span><input id="shp_ys_0" type="text" style="width:50px" name="color_list[0].shp_ys"/><a id="shp_ys_a_0" href="javascript:addshp_ys(0);">输入颜色，点击添加</a><br>
			商品版本：<span id="shp_bb_span_0" onclick="removeVersionSpan(0)" style="width:50px;height:21.47px;"></span><input id="shp_bb_0"  type="text" style="width:50px" name="version_list[0].shp_bb"/><a id="shp_bb_a_0" href="javascript:addshp_bb(0);">输入版本，点击添加</a><br>
		  <input type="submit" value="提交">
		</form>
		
		<script type="text/javascript">
			function removeColorSpan(i){
				$("#shp_ys_span_"+i).remove();
			}
			
			function removeVersionSpan(i){
				$("#shp_bb_span_"+i).remove();
			}
		
		
			function addshp_ys(i){
				//alert(i);
				$("#shp_ys_"+i).after("<span id='shp_ys_span_"+(i+1)+"' onclick='removeColorSpan("+(i+1)+")' style='width:50px;height:21.47px;'></span><input id='shp_ys_"+(i+1)+"' type='text' style='width:50px' name='color_list["+(i+1)+"].shp_ys'/><a id='shp_ys_a_"+(i+1)+"' href='javascript:addshp_ys("+(i+1)+");'>输入颜色，点击添加</a>");
				$("#shp_ys_a_"+i).remove();
				var str = $("#shp_ys_"+i).val();
				$("#shp_ys_span_"+i).html(str+" ");
				$("#shp_ys_"+i).attr("style","display:none");
				//alert( $("#shp_ys_"+i).val());
				
			}
			
			function addshp_bb(i){
				//alert(i);
				$("#shp_bb_"+i).after("<span id='shp_bb_span_"+(i+1)+"' onclick='removeVersionSpan("+(i+1)+")' style='width:50px;height:21.47px;'></span><input id='shp_bb_"+(i+1)+"' type='text' style='width:50px' name='version_list["+(i+1)+"].shp_bb'/><a id='shp_bb_a_"+(i+1)+"' href='javascript:addshp_bb("+(i+1)+");'>输入颜色，点击添加</a>");
				$("#shp_bb_a_"+i).remove();
				var str = $("#shp_bb_"+i).val();
				$("#shp_bb_span_"+i).html(str+" ");
				$("#shp_bb_"+i).attr("style","display:none");
				//alert( $("#shp_ys_"+i).val());
				
			}
			
			function addVersion(i){
				//alert(i);
				$("#version_"+i).after("<input id='version_"+(i+1)+"' type='text' style='width:50px' name='version["+(i+1)+"]'/><a id='version_a_"+(i+1)+"' href='javascript:addVersion("+(i+1)+");'>添加一种颜色</a>");
				$("#version_a_"+i).remove();
			}
			
			
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
</body>
</html>