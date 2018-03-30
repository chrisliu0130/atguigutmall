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

</head>
<body>
		商品属性添加<hr>
		<form action="attr_add.do">
		${flbh2}<br>
		<a href="javascript:add_one_item()">添加一栏</a><br>
		<input id="table_item" type="hidden" value="${flbh2}" name="flbh2">
			<table index="0" border="1px solid red" width="800px" >
				<tr><td>属性名<input type="text" name="list_attr[0].shxm_mch"></td><td></td><td><a href="javascript:;" onclick="add_one_line(this)">添加属性值</a></td></tr>
				<tr><td>属性值<input type="text" name="list_attr[0].list_value[0].shxzh"></td><td>单位<input type="text" name="list_attr[0].list_value[0].shxzh_mch"></td><td>删除<input type="text"></td></tr>
				<!-- <tr><td>属性值<input type="text" name="list_attr[0].list_value[1].shxzh"></td><td>单位<input type="text" name="list_attr[0].list_value[1].shxzh_mch"></td><td>删除<input type="text"></td></tr> -->
			</table>
			<hr>
			<input type="submit" value="提交">
		</form>
		
		<script type="text/javascript">
		function add_one_item(){
			var len = $("table").length;
			//alert(len);
			var a ='<table index="'+(len-3)+'" border="1px solid red" width="800px" >'
			var b ='<tr><td>属性名<input type="text" name="list_attr['+(len-3)+'].shxm_mch"></td><td></td><td><a href="javascript:;" onclick="add_one_line(this)">添加属性值</a></td></tr>'
			var c ='<tr><td>属性值<input type="text" name="list_attr['+(len-3)+'].list_value[0].shxzh"></td><td>单位<input type="text" name="list_attr['+(len-3)+'].list_value[0].shxzh_mch"></td><td>删除<input type="text"></td></tr>'
		    var d ='</table><hr>'
			var e= a+b+c+d;
			$("#table_item").after(e);
		}
		
		function add_one_line(obj){
			//alert($(obj).html());
			//$(obj).parents("#123").css("border","1px solid blue");
			var len = $(obj).parents("table").children().children().size();
			var index = $(obj).parents("table").attr("index");
			//alert(index);
			//alert(len);
			$(obj).parents("table").append('<tr><td>属性值<input type="text" name="list_attr['+index+'].list_value['+(len-1)+'].shxzh"></td><td>单位<input type="text" name="list_attr['+index+'].list_value['+(len-1)+'].shxzh_mch"></td><td>删除<input type="text"></td></tr>');
			
		}
</script>
</body>
</html>